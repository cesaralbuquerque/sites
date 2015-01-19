<?php 
//
// Shortcodes
//

function wearesupa_col_one_third( $atts, $content = null ) {
	return '<div class="one_third">' . do_shortcode($content) . '</div>';
}
add_shortcode('one_third', 'wearesupa_col_one_third');

function wearesupa_col_one_third_last( $atts, $content = null ) {
	return '<div class="one_third last">' . do_shortcode($content) . '</div><div class="clearboth"></div>';
}
add_shortcode('one_third_last', 'wearesupa_col_one_third_last');

function wearesupa_col_two_third( $atts, $content = null ) {
	return '<div class="two_third">' . do_shortcode($content) . '</div>';
}
add_shortcode('two_third', 'wearesupa_col_two_third');

function wearesupa_col_two_third_last( $atts, $content = null ) {
	return '<div class="two_third last">' . do_shortcode($content) . '</div><div class="clearboth"></div>';
}
add_shortcode('two_third_last', 'wearesupa_col_two_third_last');

function wearesupa_col_one_half( $atts, $content = null ) {
	return '<div class="one_half">' . do_shortcode($content) . '</div>';
}
add_shortcode('one_half', 'wearesupa_col_one_half');

function wearesupa_col_one_half_last( $atts, $content = null ) {
	return '<div class="one_half last">' . do_shortcode($content) . '</div><div class="clearboth"></div>';
}
add_shortcode('one_half_last', 'wearesupa_col_one_half_last');

function wearesupa_col_one_fourth( $atts, $content = null ) {
	return '<div class="one_fourth">' . do_shortcode($content) . '</div>';
}
add_shortcode('one_fourth', 'wearesupa_col_one_fourth');

function wearesupa_col_one_fourth_last( $atts, $content = null ) {
	return '<div class="one_fourth last">' . do_shortcode($content) . '</div><div class="clearboth"></div>';
}
add_shortcode('one_fourth_last', 'wearesupa_col_one_fourth_last');

function wearesupa_col_three_fourth( $atts, $content = null ) {
	return '<div class="three_fourth">' . do_shortcode($content) . '</div>';
}
add_shortcode('three_fourth', 'wearesupa_col_three_fourth');

function wearesupa_col_three_fourth_last( $atts, $content = null ) {
	return '<div class="three_fourth last">' . do_shortcode($content) . '</div><div class="clearboth"></div>';
}
add_shortcode('three_fourth_last', 'wearesupa_col_three_fourth_last');

function wearesupa_col_one_fifth( $atts, $content = null ) {
	return '<div class="one_fifth">' . do_shortcode($content) . '</div>';
}
add_shortcode('one_fifth', 'wearesupa_col_one_fifth');

function wearesupa_col_one_fifth_last( $atts, $content = null ) {
	return '<div class="one_fifth last">' . do_shortcode($content) . '</div><div class="clearboth"></div>';
}
add_shortcode('one_fifth_last', 'wearesupa_col_one_fifth_last');

function wearesupa_col_two_fifth( $atts, $content = null ) {
	return '<div class="two_fifth">' . do_shortcode($content) . '</div>';
}
add_shortcode('two_fifth', 'wearesupa_col_two_fifth');

function wearesupa_col_two_fifth_last( $atts, $content = null ) {
	return '<div class="two_fifth last">' . do_shortcode($content) . '</div><div class="clearboth"></div>';
}
add_shortcode('two_fifth_last', 'wearesupa_col_two_fifth_last');

function wearesupa_col_three_fifth( $atts, $content = null ) {
	return '<div class="three_fifth">' . do_shortcode($content) . '</div>';
}
add_shortcode('three_fifth', 'wearesupa_col_three_fifth');

function wearesupa_col_three_fifth_last( $atts, $content = null ) {
	return '<div class="three_fifth last">' . do_shortcode($content) . '</div><div class="clearboth"></div>';
}
add_shortcode('three_fifth_last', 'wearesupa_col_three_fifth_last');

function wearesupa_col_four_fifth( $atts, $content = null ) {
	return '<div class="four_fifth">' . do_shortcode($content) . '</div>';
}
add_shortcode('four_fifth', 'wearesupa_col_four_fifth');

function wearesupa_col_four_fifth_last( $atts, $content = null ) {
	return '<div class="four_fifth last">' . do_shortcode($content) . '</div><div class="clearboth"></div>';
}
add_shortcode('four_fifth_last', 'wearesupa_col_four_fifth_last');

function wearesupa_col_one_sixth( $atts, $content = null ) {
	return '<div class="one_sixth">' . do_shortcode($content) . '</div>';
}
add_shortcode('one_sixth', 'wearesupa_col_one_sixth');

function wearesupa_col_one_sixth_last( $atts, $content = null ) {
	return '<div class="one_sixth last">' . do_shortcode($content) . '</div><div class="clearboth"></div>';
}
add_shortcode('one_sixth_last', 'wearesupa_col_one_sixth_last');

function wearesupa_col_five_sixth( $atts, $content = null ) {
	return '<div class="five_sixth">' . do_shortcode($content) . '</div>';
}
add_shortcode('five_sixth', 'wearesupa_col_five_sixth');

function wearesupa_col_five_sixth_last( $atts, $content = null ) {
	return '<div class="five_sixth last">' . do_shortcode($content) . '</div><div class="clearboth"></div>';
}
add_shortcode('five_sixth_last', 'wearesupa_col_five_sixth_last');

function wearesupa_clear( $atts, $content = null ) {
	return '<div class="clear">' . do_shortcode($content) . '</div>';
}
add_shortcode('clear', 'wearesupa_clear');



function wearesupa_photosetgrid( $atts, $content = null ) {
	extract(shortcode_atts(array(
	'layout' => ''
	), $atts));

	return '<div class="photosetgrid" data-layout="'. $layout .'">' . do_shortcode($content) . '</div>';
}
add_shortcode('photosetgrid', 'wearesupa_photosetgrid');


?>