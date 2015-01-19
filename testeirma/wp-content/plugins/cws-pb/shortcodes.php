<?php

function shortcode_cws_row ($atts, $content){
	extract(shortcode_atts(array(
		'cols' => 1,
		'margin_left' => 'auto',
		'margin_right' => 'auto',
		'margin_top' => 'auto',
		'margin_bottom' => 'auto'), $atts));
	$style = "";
	$style .= $margin_left != "auto" ? "margin-left:" . $margin_left . "px;" : "";
	$style .= $margin_right != "auto" ? "margin-right:" . $margin_right . "px;" : "";
	$style .= $margin_top != "auto" ? "margin-top:" . $margin_top . "px;" : "";
	$style .= $margin_bottom != "auto" ? "margin-bottom:" . $margin_bottom . "px;" : "";
	$out = "<div class='grid-row clearfix'" . ( !empty($style) ? " style='$style'" : "" ) . ">";
	$out .= do_shortcode($content);
	$out .= '</div>';
	return $out;
}
add_shortcode('cws-row','shortcode_cws_row');

function shortcode_cws_col ($atts, $content){
	extract(shortcode_atts(
		array(
			'span'=>12
		), $atts));
	$out = "<div class='grid-col grid-col-" . $span . "'>";
	$out .= do_shortcode( $content );
	$out .= "</div>";
	return $out;
}
add_shortcode('col','shortcode_cws_col');

function shortcode_cws_widget ( $atts, $content ){
	$atts = shortcode_atts(
		array(
			'type'=>'text',
			'title'=>null,
			'e_style'=>null,
			'toggle'=>null
		), $atts);
	extract ($atts);
	$out = "<section class='cws-widget'>";
	$out .= $title ? "<div class='widget-title'>" . $title . "</div>" : "";
	$args = array( 'atts' => $atts , 'content' => $content );
	switch ($type){
		case 'text':
			$out .= cws_text_renderer( $args );
			break;
		case 'tabs':
			$out .= cws_tabs_renderer( $args );
			break;
		case 'accs':
			$out .= cws_accordion_renderer( $args );
			break;
		default: //
			do_shortcode( $content );//
	}
	$out .= "</section>";
	return $out;
}
add_shortcode('cws-widget','shortcode_cws_widget');

function cws_text_renderer ($args){
	extract($args);
	$out = "<section class='cws_widget_content'>";
	$out .= do_shortcode($content);
	$out .= "</section>";
	return $out;
}

function cws_tabs_renderer ($args){
	extract($args);
	$GLOBALS['tabs'] = $GLOBALS['tab_items_content'] = array();
	do_shortcode($content);
	$tabs = $GLOBALS['tabs'];
	$tab_items_content = $GLOBALS['tab_items_content'];
	unset ( $GLOBALS['tabs'], $GLOBALS['tab_items_content'] );
	if ( (!count($tabs)) || (!count($tab_items_content)) ) return;
	$out = "<div class='cws_widget_content tab_widget" . ( $atts['e_style'] ? " " . $atts['e_style'] : "" ) . "'>
			<div class='tabs' role='tablist'>";
	for ( $i=0; $i<count($tabs); $i++ ){
		$out .= "<a class='tab" . ( $tabs[$i]['open'] ? ' active' : '' ) . "' role='tab' tabindex='$i'>" . $tabs[$i]['title'] . "</a>";
	}
	$out .= "</div>
			<div class='tab_items'>";
	for ( $i=0; $i<count($tab_items_content); $i++ ){
		$out .= "<div class='tab_item' role='tabpanel' tabindex='$i'" . ( $tabs[$i]["open"] ? "" : " style='display:none'" ) . ">" . $tab_items_content[$i] . "</div>";
	}
	$out .= "</div>
			</div>";
	unset( $tabs );
	unset( $tab_items_content );
	return $out;
}

function cws_item_shortcode ($atts, $content){
	extract( shortcode_atts(
		array(
				'type' => NULL,
				'open' => NULL,
				'title' => __('TITLE',THEME_SLUG),
		), $atts));
	if ( empty($type) ) return;
	switch ($type){
		case 'tabs':
			cws_tab_item_handler( $title, $content, $open );
			break;
		case 'accs':
			return cws_accordion_item_renderer( $title, $content, $open );
			break;
	}
}

add_shortcode( 'item', 'cws_item_shortcode' );

function cws_tab_item_handler ( $title, $content, $open ){
	array_push( $GLOBALS['tabs'], array('title'=>$title,'open'=>$open) );
	array_push( $GLOBALS['tab_items_content'], $content );
}

function cws_accordion_renderer ( $args ){
	extract($args);
	if ( isset( $atts['toggle'] ) ) return cws_toggle_renderer ($args);
	$out = "<section class='cws_widget_content accordion_widget" . ( $atts['e_style'] ? " " . $atts['e_style'] : "" ) . "'>";
	$out .= do_shortcode($content);
	$out .= "</section>";
	return $out;
}

function cws_accordion_item_renderer ( $title, $content, $open ){
	$out = "<div class='accordion_section" . ( $open ? " active" : "" ) . "'>";
	$out .= "<div class='accordion_title'>$title<i class='accordion_icon'></i></div>"; // TITLE
	$out .= "<div class='accordion_content'" . ( $open ? "" : " style='display: none;'" ) . ">" . do_shortcode($content) . "</div>";
	$out .= "</div>";
	return $out;
}

function cws_toggle_renderer ($args){
	extract( $args );
	$out = "<section class='cws_widget_content toggle_widget" . ( $atts['e_style'] ? " " . $atts['e_style'] : "" ) . "'>";
	$out .= do_shortcode( $content );
	$out .= "</section>";
	return $out;
}

?>