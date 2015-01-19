<?php

/* #######################################################################

	Register Sidebars for Widgets

####################################################################### */


if ( function_exists('register_sidebar') )
	register_sidebar(array(
			'name' => __( 'Overlay Widget Area (Global)', 'wearesupa' ),
			'before_widget' => '<div class="widget col span1of4">',
			'after_widget' => '</div>',
			'before_title' => '<h3>',
			'after_title' => '</h3>',
		));

	register_sidebar(array(
			'name' => __( 'Blog Article Sidebar', 'wearesupa' ),
			'before_widget' => '<div class="widget">',
			'after_widget' => '</div>',
			'before_title' => '<h3>',
			'after_title' => '</h3>',
		));

	register_sidebar(array(
			'name' => __( 'Ad Space (Header)', 'wearesupa' ),
			'before_widget' => '<div class="ad-widget-header">',
			'after_widget' => '</div>',
			'before_title' => '<h3>',
			'after_title' => '</h3>',
		));

	register_sidebar(array(
			'name' => __( 'Ad Space (Footer)', 'wearesupa' ),
			'before_widget' => '<div class="ad-widget-footer">',
			'after_widget' => '</div>',
			'before_title' => '<h3>',
			'after_title' => '</h3>',
		));
