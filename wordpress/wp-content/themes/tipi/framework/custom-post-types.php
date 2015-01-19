<?php

	//
	// Custom Post Type: Homepage Item
	//
	add_action( 'init', 'wearesupa_create_homepage_item_post_type' );
	function wearesupa_create_homepage_item_post_type() {
	
	
			register_post_type( 'wearesupa-homepage',
				array(
					'labels' => array(
						'name' => _x('Homepage Items', 'post type general name','wearesupa'),
						'singular_name' => _x('Homepage Item', 'post type singular name','wearesupa'),
						'add_new' => _x('Add New', 'portfolio item','wearesupa'),
						'add_new_item' => __('Add New Homepage Item','wearesupa'),
						'edit_item' => __('Edit Homepage Item','wearesupa'),
						'new_item' => __('New Homepage Item','wearesupa'),
						'view_item' => __('View Homepage Item','wearesupa'),
						'search_items' => __('Search Homepage Items','wearesupa'),
						'not_found' =>  __('Nothing found','wearesupa'),
						'not_found_in_trash' => __('Nothing found in Trash','wearesupa'),
						'parent_item_colon' => ''
					),
					'public' => true,
					'has_archive' => false,
					'rewrite' => array('slug' => 'homepage-item'),
					'supports' => array('title','revisions','thumbnail'),
				)
			);	
		}
	

?>