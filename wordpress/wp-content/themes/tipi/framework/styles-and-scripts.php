<?php

/* #######################################################################

	Tipi - Load Front-end JS and CSS

####################################################################### */


add_action( 'wp_enqueue_scripts', 'wearesupa_load_css' );
function wearesupa_load_css() {

 // Check for presence of google fonts advanced and then load defaults
  $fontAdvanced = get_option( 'font_advanced_service' );
  if ( !$fontAdvanced ) {
	wp_enqueue_style( 'google-fonts', '//fonts.googleapis.com/css?family=PT+Serif:400,700,400italic,700italic|Oswald', array(), '', 'screen' );
  }
  	wp_enqueue_style( 'reset', get_template_directory_uri() . '/reset.min.css', array(), '1.0.0', 'screen' );
  	wp_enqueue_style( 'font-awesome', get_template_directory_uri() . '/font-awesome.min.css', array(), '4.1.0', 'screen' );
  	wp_enqueue_style( 'swipebox', get_template_directory_uri() . '/swipebox.min.css', array(), '1.2.8', 'screen' );

  if ( is_page_template( 't-homepage.php' ) ) {
  	wp_enqueue_style( 'animate', get_template_directory_uri() . '/animate.min.css', array(), '1.0.0', 'screen' );
  }



  wp_enqueue_style( 'default', get_bloginfo( 'stylesheet_url' ), array(), '1.0.7', 'screen' , 'google-fonts' );
  wp_enqueue_style( 'print', get_template_directory_uri() . '/print.css', array(), '1.0.0', 'print' );


  // Check for presence of google fonts advanced and then load defaults
  $fontAdvanced = get_option( 'font_advanced_service' );


}


add_action( 'wp_enqueue_scripts', 'wearesupa_load_ie_css' );
function wearesupa_load_ie_css()
{
	global $wp_styles;
	wp_register_style('lt-ie9', get_template_directory_uri() . '/ie.css', array(), '1.0.7', 'screen');
	$wp_styles->add_data('lt-ie9', 'conditional', '(lt IE 9) & (!IEMobile)');
	wp_enqueue_style('lt-ie9');
}


add_action( 'wp_enqueue_scripts', 'wearesupa_load_js' );
function wearesupa_load_js() {
	wp_register_script('modernizr',get_template_directory_uri() . '/assets/js/plugins/modernizr.min.js',array('jquery'), '1.0.0', false);
	wp_register_script('jplayer',get_template_directory_uri() . '/assets/js/plugins/jquery.jplayer.min.js',array('jquery'), '1.0.0', true);
	wp_register_script('plugins', get_template_directory_uri() . '/assets/js/plugins/min/plugins-min.js',array('jquery'), '1.0.1', true);

	wp_register_script( 'scripts', get_template_directory_uri() . '/assets/js/scripts.js', array('jquery','plugins'), '1.0.8', true );

  if ( is_single() || is_archive() || is_search()  || is_author() || is_front_page() ) {
    wp_enqueue_script('jplayer');
  }


	// load on all pages
    wp_enqueue_script('modernizr');
    wp_enqueue_script('plugins');
    wp_enqueue_script('scripts');

}


add_action( 'comment_form_before', 'enqueue_comments_reply' );
function enqueue_comments_reply() {
	if( get_option( 'thread_comments' ) )  {
		wp_enqueue_script( 'comment-reply' );
	}
}


function wearesupa_load_html5_shim() {
	echo '<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->';
}
add_action('wp_head', 'wearesupa_load_html5_shim', 95);

?>
