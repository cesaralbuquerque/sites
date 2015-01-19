<?php
/*
Plugin Name: CWS Builder
Plugin URI: http://pb.creaws.com/
Description: internal use for creaws themes only.
Text Domain: cws_pb
Version: 1.0.0
*/

define( 'CWS_PB_VERSION', '1.0.0' );
define( 'CWS_PB_REQUIRED_WP_VERSION', '3.9' );

if (!defined('CWS_PB_THEME_DIR'))
	define('CWS_PB_THEME_DIR', ABSPATH . 'wp-content/themes/' . get_template());

if (!defined('CWS_PB_HOST'))
	define('CWS_PB_HOST', 'http://clinico.miramar.com.ua');

if (!defined('CWS_PB_PLUGIN_NAME'))
	define('CWS_PB_PLUGIN_NAME', trim(dirname(plugin_basename(__FILE__)), '/'));

if (!defined('CWS_PB_PLUGIN_DIR'))
	define('CWS_PB_PLUGIN_DIR', WP_PLUGIN_DIR . '/' . CWS_PB_PLUGIN_NAME);

if (!defined('CWS_PB_PLUGIN_URL'))
	define('CWS_PB_PLUGIN_URL', WP_PLUGIN_URL . '/' . CWS_PB_PLUGIN_NAME);

require_once CWS_PB_PLUGIN_DIR . '/shortcodes.php';

function admin_scripts ($hook) {
	global $typenow;

	if ( ('post-new.php' === $hook || 'post.php' === $hook) && 'page' === $typenow ) {
		if (wp_script_is('editor-expand')) {
			// starting WP4.0, this script mess things up here
			wp_dequeue_script('editor-expand');
		}
		wp_enqueue_media();
		wp_enqueue_script( 'yui', 'http://yui.yahooapis.com/3.17.2/build/yui/yui.js', '', '', true );
		wp_enqueue_script( 'pb-js', CWS_PB_PLUGIN_URL . '/pb.js', '', CWS_PB_VERSION, true );
		wp_enqueue_style( 'cws-pb', CWS_PB_PLUGIN_URL . '/cws-pb.css' );
	}
}

add_action( 'admin_enqueue_scripts', 'admin_scripts', 11);

add_filter('the_editor', 'cws_content');

function cws_content ( $content ) {
	preg_match("/<textarea[^>]*id=[\"']([^\"']+)\"/", $content, $matches);
	$id = $matches[1];
	if( $id !== "content" )
		return $content;
	ob_start();
	include_once( CWS_PB_PLUGIN_DIR . '/pb.php' );
	return $content . ob_get_clean();
}

add_filter( 'pre_set_site_transient_update_plugins', 'cws_check_for_update_pb' );
set_site_transient('update_plugins', null);

function cws_check_for_update_pb($transient) {
	if (empty($transient->last_checked)) {
		return $transient;
	}

	$pb_path = CWS_PB_PLUGIN_NAME . '/' . CWS_PB_PLUGIN_NAME . '.php';

	$result = wp_remote_get(CWS_PB_HOST . '/cws-pb.php');
	if ( isset($result->errors) ) {
		return $transient;
	} else {
		if (200 == $result['response']['code']) {
			$resp = json_decode($result['body']);
			if ( version_compare( CWS_PB_VERSION, $resp->new_version, '<' ) ) {
				$transient->response[$pb_path] = $resp;
			}
		}
	}
	return $transient;
}

$file   = basename( __FILE__ );
$folder = basename( dirname( __FILE__ ) );
$hook = "in_plugin_update_message-{$folder}/{$file}";

function cws_plugins_api($res, $action = null, $args = null) {
	if ( ($action == 'plugin_information') && isset($args->slug) && ($args->slug == CWS_PB_PLUGIN_NAME) ) {
		$result = wp_remote_get(CWS_PB_HOST . '/cws-pb.php?info=1');
		if (200 == $result['response']['code']) {
			$res = json_decode($result['body'], true);
			$res = (object) array_map(__FUNCTION__, $res);
		}
	}
	return $res;
}

add_filter('plugins_api', 'cws_plugins_api', 20, 3);
?>
