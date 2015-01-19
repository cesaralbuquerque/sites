<?php

// Add Gallery Functionality
// https://github.com/mustardBees/cmb-field-gallery
// Useful global constants
define( 'CMB_URL', get_template_directory_uri() );

/**
 * Render field
 */
function pw_gallery_field( $field, $meta ) {
	wp_enqueue_script( 'pw_gallery_init', CMB_URL . '/framework/js/cmb-gallery.js', array( 'jquery' ), null );

	if ( ! empty( $meta ) ) {
		$meta = implode( ',', $meta );
	}

	echo '<div class="pw-gallery">';
	echo '	<input type="hidden" id="' . $field['id'] . '" name="' . $field['id'] . '" value="' . $meta . '" />';
	echo '	<input type="button" class="button" value="' . ( ! empty( $field['button'] ) ? $field['button'] : 'Manage gallery' ) . '" />';
	echo '</div>';

	if ( ! empty( $field['desc'] ) ) echo '<p class="cmb_metabox_description">' . $field['desc'] . '</p>';
}
add_filter( 'cmb_render_pw_gallery', 'pw_gallery_field', 10, 2 );


/**
 * Split CSV string into an array of values
 */
function pw_gallery_field_sanitise( $meta_value, $field ) {
	if ( empty( $meta_value ) ) {
		$meta_value = '';
	} else {
		$meta_value = explode( ',', $meta_value );
	}

	return $meta_value;
}


/**
 * Include and setup custom metaboxes and fields.
 *
 * @category Tipi
 * @package  Metaboxes
 * @license  http://www.opensource.org/licenses/gpl-license.php GPL v2.0 (or later)
 * @link     https://github.com/webdevstudios/Custom-Metaboxes-and-Fields-for-WordPress
 */

add_filter( 'cmb_meta_boxes', 'wearesupa_tipi_metaboxes' );
/**
 * Define the metabox and field configurations.
 *
 * @param  array $meta_boxes
 * @return array
 */
function wearesupa_tipi_metaboxes( array $meta_boxes ) {

	if ( is_admin() ) {

		// Enqueue Admin JS
		wp_enqueue_script( 'homepage_item_layout', CMB_URL . '/framework/js/cmb-layout.js', array( 'jquery' ), null );

	}

	// Start with an underscore to hide fields from custom fields list
	$prefix = '_wearesupa_';

	/**
	 * Metabox to be displayed on a single page ID
	 */
	$meta_boxes['homepage_item_metabox'] = array(
		'id'         => 'homepage_item_metabox',
		'title'      => __( 'Homepage Item Options', 'wearesupa' ),
		'pages'      => array( 'wearesupa-homepage', ), // Post type
		'context'    => 'normal',
		'priority'   => 'high',
		'show_names' => true, // Show field names on the left
		'fields'     => array(
			array(
				'name'    => __( 'Choose Item Layout', 'wearesupa' ),
				'id'      => $prefix . 'choose_layout',
				'type'    => 'select',
				'options' => array(
					'about'   => __( 'About Layout', 'wearesupa' ),
					'blog' => __( 'Blog Layout', 'wearesupa' ),
					'stats'     => __( 'Stats Layout', 'wearesupa' ),
					'gallery'     => __( 'Gallery Layout', 'wearesupa' ),
				),
			),


		)
	);

	$categories = get_categories();
	$cat_options = array();
	if ( !empty( $categories ) ) {
	    foreach ( $categories as $key => $term ) {
	        $cat_options[] = array(
	            'name' => $term->name,
	         'value' => $term->cat_ID,
	        );
	    }
	}


	$meta_boxes['homepage_item_blog_metabox'] = array(
		'id'         => 'homepage_item_blog_metabox',
		'title'      => __( 'Homepage Item Options for Blog Layout', 'wearesupa' ),
		'pages'      => array( 'wearesupa-homepage', ), // Post type
		'context'    => 'normal',
		'priority'   => 'high',
		'show_names' => true, // Show field names on the left
		'fields'     => array(
			array(
				'name'    => __( 'Blog Title', 'wearesupa' ),
				'id'      => $prefix . 'text_blog_title',
				'type'    => 'text',
			),
			array(
				'name'    => __( 'Blog Description', 'wearesupa' ),
				'id'      => $prefix . 'text_blog_description',
				'type'    => 'wysiwyg',
				'options' => array( 'textarea_rows' => 5, ),
			),

			array(
				'name'    => __( 'How Many Blog Articles?', 'wearesupa' ),
				'id'      => $prefix . 'blog_volume',
				'type'    => 'select',
				'options' => array(
					'3'   => __( '3', 'wearesupa' ),
					'6' => __( '6', 'wearesupa' ),
					'9'     => __( '9', 'wearesupa' ),
					'12'     => __( '12', 'wearesupa' ),
					'15'     => __( '15', 'wearesupa' ),
					'18'     => __( '18', 'wearesupa' ),
				),
			),

			array(
			        'name'    => __( 'Category', 'wearesupa' ),
			        'desc'    => __( 'Choose a category to display', 'wearesupa' ),
			        'id'      => $prefix . 'cat_select',
			        'type'    => 'multicheck',
			        'options' => $cat_options,
			        'inline'  => true,
			),

			array(
				'name'    => __( 'Blog Panel Background Color', 'wearesupa' ),
				'desc'    => __( 'This sets the background color of the entire panel (If you want a parallax background, just upload it via the featured image uploader)', 'wearesupa' ),
				'id'      => $prefix . 'bg_color_blog',
				'type'    => 'colorpicker',
				'default' => '#2c2c2c'
			),

			array(
				'name'    => __( 'Blog Title Text Color', 'wearesupa' ),
				'id'      => $prefix . 'text_color_blog_title',
				'type'    => 'colorpicker',
				'default' => '#ffffff'
			),

			array(
				'name'    => __( 'Blog Text Color', 'wearesupa' ),
				'id'      => $prefix . 'text_color_blog',
				'type'    => 'colorpicker',
				'default' => '#ffffff'
			),

			array(
				'name'       => __( '"More" Button Text', 'wearesupa' ),
				'desc'       => __( 'By filling this out a more button will appear but please make sure you also set your blog link below', 'wearesupa' ),
				'id'         => $prefix . 'more_button',
				'type'       => 'text'
			),

			array(
				'name'       => __( '"More" Button Link', 'wearesupa' ),
				'id'         => $prefix . 'more_button_link',
				'type'       => 'text_url'
			),


		)
	);


	$meta_boxes['homepage_item_about_metabox'] = array(
		'id'         => 'homepage_item_about_metabox',
		'title'      => __( 'Homepage Item Options for About Layout', 'wearesupa' ),
		'pages'      => array( 'wearesupa-homepage', ), // Post type
		'context'    => 'normal',
		'priority'   => 'high',
		'show_names' => true, // Show field names on the left
		'fields'     => array(
			array(
				'name'    => __( 'About Title', 'wearesupa' ),
				'id'      => $prefix . 'text_about_title',
				'type'    => 'text',
			),
			array(
				'name'    => __( 'About Content', 'wearesupa' ),
				'id'      => $prefix . 'text_about_content',
				'type'    => 'wysiwyg',
				'options' => array( 'textarea_rows' => 10, ),
			),

			array(
				'name' => __( 'Enable Gallery', 'wearesupa' ),
				'id'   => $prefix . 'about_gallery',
				'type' => 'checkbox',
			),

			array(
				'name'    => __( 'About Gallery', 'wearesupa' ),
				'button' => __( 'Manage gallery', 'wearesupa'), // Optionally set button label
				'id'      => $prefix . 'about_images',
				'type'    => 'pw_gallery',
				'sanitization_cb' => 'pw_gallery_field_sanitise'
			),

			array(
				'name'    => __( 'About Panel Background Color', 'wearesupa' ),
				'desc'    => __( 'This sets the background color of the entire panel (If you want a parallax background, just upload it via the featured image uploader)', 'wearesupa' ),
				'id'      => $prefix . 'bg_color_about',
				'type'    => 'colorpicker',
				'default' => '#f2f2f2'
			),

			array(
				'name'    => __( 'About Title Text Color', 'wearesupa' ),
				'id'      => $prefix . 'text_color_about_title',
				'type'    => 'colorpicker',
				'default' => '#2c2c2c'
			),

			array(
				'name'    => __( 'About Text Color', 'wearesupa' ),
				'id'      => $prefix . 'text_color_about',
				'type'    => 'colorpicker',
				'default' => '#2c2c2c'
			),



		)
	);

	$meta_boxes['homepage_item_gallery_metabox'] = array(
		'id'         => 'homepage_item_gallery_metabox',
		'title'      => __( 'Homepage Item Options for Gallery', 'wearesupa' ),
		'pages'      => array( 'wearesupa-homepage', ), // Post type
		'context'    => 'normal',
		'priority'   => 'high',
		'show_names' => true, // Show field names on the left
		'fields'     => array(
			array(
				'name'    => __( 'Gallery images', 'wearesupa' ),
				'button' => __( 'Manage gallery', 'wearesupa'), // Optionally set button label
				'id'      => $prefix . 'gallery_images',
				'type'    => 'pw_gallery',
				'sanitization_cb' => 'pw_gallery_field_sanitise'
			),

			array(
				'name'    => __( 'Gallery Panel Background Color', 'wearesupa' ),
				'desc'    => __( 'This sets the background color of the entire panel (If you want a image background, just upload it via the featured image uploader)', 'wearesupa' ),
				'id'      => $prefix . 'bg_color_gallery',
				'type'    => 'colorpicker',
				'default' => '#f2f2f2'
			),
		)
	);


	function fa_icons_list(){
		$icon = array(
			'none' => 'No Icon',
			'fa-adjust' => 'adjust',
			'fa-anchor' => 'anchor',
			'fa-archive' => 'archive',
			'fa-arrows' => 'arrows',
			'fa-arrows-h' => 'arrows-h',
			'fa-arrows-v' => 'arrows-v',
			'fa-asterisk' => 'asterisk',
			'fa-automobile' => 'automobile',
			'fa-ban' => 'ban',
			'fa-bank' => 'bank',
			'fa-bar-chart-o' => 'bar-chart-o',
			'fa-barcode' => 'barcode',
			'fa-bars' => 'bars',
			'fa-beer' => 'beer',
			'fa-bell' => 'bell',
			'fa-bell-o' => 'bell-o',
			'fa-bolt' => 'bolt',
			'fa-bomb' => 'bomb',
			'fa-book' => 'book',
			'fa-bookmark' => 'bookmark',
			'fa-bookmark-o' => 'bookmark-o',
			'fa-briefcase' => 'briefcase',
			'fa-bug' => 'bug',
			'fa-building' => 'building',
			'fa-building-o' => 'building-o',
			'fa-bullhorn' => 'bullhorn',
			'fa-bullseye' => 'bullseye',
			'fa-cab' => 'cab',
			'fa-calendar' => 'calendar',
			'fa-calendar-o' => 'calendar-o',
			'fa-camera' => 'camera',
			'fa-camera-retro' => 'camera-retro',
			'fa-car' => 'car',
			'fa-caret-square-o-down' => 'caret-square-o-down',
			'fa-caret-square-o-left' => 'caret-square-o-left',
			'fa-caret-square-o-right' => 'caret-square-o-right',
			'fa-caret-square-o-up' => 'caret-square-o-up',
			'fa-certificate' => 'certificate',
			'fa-check' => 'check',
			'fa-check-circle' => 'check-circle',
			'fa-check-circle-o' => 'check-circle-o',
			'fa-check-square' => 'check-square',
			'fa-check-square-o' => 'check-square-o',
			'fa-child' => 'child',
			'fa-circle' => 'circle',
			'fa-circle-o' => 'circle-o',
			'fa-circle-o-notch' => 'circle-o-notch',
			'fa-circle-thin' => 'circle-thin',
			'fa-clock-o' => 'clock-o',
			'fa-cloud' => 'cloud',
			'fa-cloud-download' => 'cloud-download',
			'fa-cloud-upload' => 'cloud-upload',
			'fa-code' => 'code',
			'fa-code-fork' => 'code-fork',
			'fa-coffee' => 'coffee',
			'fa-cog' => 'cog',
			'fa-cogs' => 'cogs',
			'fa-comment' => 'comment',
			'fa-comment-o' => 'comment-o',
			'fa-comments' => 'comments',
			'fa-comments-o' => 'comments-o',
			'fa-compass' => 'compass',
			'fa-credit-card' => 'credit-card',
			'fa-crop' => 'crop',
			'fa-crosshairs' => 'crosshairs',
			'fa-cube' => 'cube',
			'fa-cubes' => 'cubes',
			'fa-cutlery' => 'cutlery',
			'fa-dashboard' => 'dashboard',
			'fa-database' => 'database',
			'fa-desktop' => 'desktop',
			'fa-dot-circle-o' => 'dot-circle-o',
			'fa-download' => 'download',
			'fa-edit' => 'edit',
			'fa-ellipsis-h' => 'ellipsis-h',
			'fa-ellipsis-v' => 'ellipsis-v',
			'fa-envelope' => 'envelope',
			'fa-envelope-o' => 'envelope-o',
			'fa-envelope-square' => 'envelope-square',
			'fa-eraser' => 'eraser',
			'fa-exchange' => 'exchange',
			'fa-exclamation' => 'exclamation',
			'fa-exclamation-circle' => 'exclamation-circle',
			'fa-exclamation-triangle' => 'exclamation-triangle',
			'fa-external-link' => 'external-link',
			'fa-external-link-square' => 'external-link-square',
			'fa-eye' => 'eye',
			'fa-eye-slash' => 'eye-slash',
			'fa-fax' => 'fax',
			'fa-female' => 'female',
			'fa-fighter-jet' => 'fighter-jet',
			'fa-file-archive-o' => 'file-archive-o',
			'fa-file-audio-o' => 'file-audio-o',
			'fa-file-code-o' => 'file-code-o',
			'fa-file-excel-o' => 'file-excel-o',
			'fa-file-image-o' => 'file-image-o',
			'fa-file-movie-o' => 'file-movie-o',
			'fa-file-pdf-o' => 'file-pdf-o',
			'fa-file-photo-o' => 'file-photo-o',
			'fa-file-picture-o' => 'file-picture-o',
			'fa-file-powerpoint-o' => 'file-powerpoint-o',
			'fa-file-sound-o' => 'file-sound-o',
			'fa-file-video-o' => 'file-video-o',
			'fa-file-word-o' => 'file-word-o',
			'fa-file-zip-o' => 'file-zip-o',
			'fa-film' => 'film',
			'fa-filter' => 'filter',
			'fa-fire' => 'fire',
			'fa-fire-extinguisher' => 'fire-extinguisher',
			'fa-flag' => 'flag',
			'fa-flag-checkered' => 'flag-checkered',
			'fa-flag-o' => 'flag-o',
			'fa-flash' => 'flash',
			'fa-flask' => 'flask',
			'fa-folder' => 'folder',
			'fa-folder-o' => 'folder-o',
			'fa-folder-open' => 'folder-open',
			'fa-folder-open-o' => 'folder-open-o',
			'fa-frown-o' => 'frown-o',
			'fa-gamepad' => 'gamepad',
			'fa-gavel' => 'gavel',
			'fa-gear' => 'gear',
			'fa-gears' => 'gears',
			'fa-gift' => 'gift',
			'fa-glass' => 'glass',
			'fa-globe' => 'globe',
			'fa-graduation-cap' => 'graduation-cap',
			'fa-group' => 'group',
			'fa-hdd-o' => 'hdd-o',
			'fa-headphones' => 'headphones',
			'fa-heart' => 'heart',
			'fa-heart-o' => 'heart-o',
			'fa-history' => 'history',
			'fa-home' => 'home',
			'fa-image' => 'image',
			'fa-inbox' => 'inbox',
			'fa-info' => 'info',
			'fa-info-circle' => 'info-circle',
			'fa-institution' => 'institution',
			'fa-key' => 'key',
			'fa-keyboard-o' => 'keyboard-o',
			'fa-language' => 'language',
			'fa-laptop' => 'laptop',
			'fa-leaf' => 'leaf',
			'fa-legal' => 'legal',
			'fa-lemon-o' => 'lemon-o',
			'fa-level-down' => 'level-down',
			'fa-level-up' => 'level-up',
			'fa-life-bouy' => 'life-bouy',
			'fa-life-ring' => 'life-ring',
			'fa-life-saver' => 'life-saver',
			'fa-lightbulb-o' => 'lightbulb-o',
			'fa-location-arrow' => 'location-arrow',
			'fa-lock' => 'lock',
			'fa-magic' => 'magic',
			'fa-magnet' => 'magnet',
			'fa-mail-forward' => 'mail-forward',
			'fa-mail-reply' => 'mail-reply',
			'fa-mail-reply-all' => 'mail-reply-all',
			'fa-male' => 'male',
			'fa-map-marker' => 'map-marker',
			'fa-meh-o' => 'meh-o',
			'fa-microphone' => 'microphone',
			'fa-microphone-slash' => 'microphone-slash',
			'fa-minus' => 'minus',
			'fa-minus-circle' => 'minus-circle',
			'fa-minus-square' => 'minus-square',
			'fa-minus-square-o' => 'minus-square-o',
			'fa-mobile' => 'mobile',
			'fa-mobile-phone' => 'mobile-phone',
			'fa-money' => 'money',
			'fa-moon-o' => 'moon-o',
			'fa-mortar-board' => 'mortar-board',
			'fa-music' => 'music',
			'fa-navicon' => 'navicon',
			'fa-paper-plane' => 'paper-plane',
			'fa-paper-plane-o' => 'paper-plane-o',
			'fa-paw' => 'paw',
			'fa-pencil' => 'pencil',
			'fa-pencil-square' => 'pencil-square',
			'fa-pencil-square-o' => 'pencil-square-o',
			'fa-phone' => 'phone',
			'fa-phone-square' => 'phone-square',
			'fa-photo' => 'photo',
			'fa-picture-o' => 'picture-o',
			'fa-plane' => 'plane',
			'fa-plus' => 'plus',
			'fa-plus-circle' => 'plus-circle',
			'fa-plus-square' => 'plus-square',
			'fa-plus-square-o' => 'plus-square-o',
			'fa-power-off' => 'power-off',
			'fa-print' => 'print',
			'fa-puzzle-piece' => 'puzzle-piece',
			'fa-qrcode' => 'qrcode',
			'fa-question' => 'question',
			'fa-question-circle' => 'question-circle',
			'fa-quote-left' => 'quote-left',
			'fa-quote-right' => 'quote-right',
			'fa-random' => 'random',
			'fa-recycle' => 'recycle',
			'fa-refresh' => 'refresh',
			'fa-reorder' => 'reorder',
			'fa-reply' => 'reply',
			'fa-reply-all' => 'reply-all',
			'fa-retweet' => 'retweet',
			'fa-road' => 'road',
			'fa-rocket' => 'rocket',
			'fa-rss' => 'rss',
			'fa-rss-square' => 'rss-square',
			'fa-search' => 'search',
			'fa-search-minus' => 'search-minus',
			'fa-search-plus' => 'search-plus',
			'fa-send' => 'send',
			'fa-send-o' => 'send-o',
			'fa-share' => 'share',
			'fa-share-alt' => 'share-alt',
			'fa-share-alt-square' => 'share-alt-square',
			'fa-share-square' => 'share-square',
			'fa-share-square-o' => 'share-square-o',
			'fa-shield' => 'shield',
			'fa-shopping-cart' => 'shopping-cart',
			'fa-sign-in' => 'sign-in',
			'fa-sign-out' => 'sign-out',
			'fa-signal' => 'signal',
			'fa-sitemap' => 'sitemap',
			'fa-sliders' => 'sliders',
			'fa-smile-o' => 'smile-o',
			'fa-sort' => 'sort',
			'fa-sort-alpha-asc' => 'sort-alpha-asc',
			'fa-sort-alpha-desc' => 'sort-alpha-desc',
			'fa-sort-amount-asc' => 'sort-amount-asc',
			'fa-sort-amount-desc' => 'sort-amount-desc',
			'fa-sort-asc' => 'sort-asc',
			'fa-sort-desc' => 'sort-desc',
			'fa-sort-down' => 'sort-down',
			'fa-sort-numeric-asc' => 'sort-numeric-asc',
			'fa-sort-numeric-desc' => 'sort-numeric-desc',
			'fa-sort-up' => 'sort-up',
			'fa-space-shuttle' => 'space-shuttle',
			'fa-spinner' => 'spinner',
			'fa-spoon' => 'spoon',
			'fa-square' => 'square',
			'fa-square-o' => 'square-o',
			'fa-star' => 'star',
			'fa-star-half' => 'star-half',
			'fa-star-half-empty' => 'star-half-empty',
			'fa-star-half-full' => 'star-half-full',
			'fa-star-half-o' => 'star-half-o',
			'fa-star-o' => 'star-o',
			'fa-suitcase' => 'suitcase',
			'fa-sun-o' => 'sun-o',
			'fa-support' => 'support',
			'fa-tablet' => 'tablet',
			'fa-tachometer' => 'tachometer',
			'fa-tag' => 'tag',
			'fa-tags' => 'tags',
			'fa-tasks' => 'tasks',
			'fa-taxi' => 'taxi',
			'fa-terminal' => 'terminal',
			'fa-thumb-tack' => 'thumb-tack',
			'fa-thumbs-down' => 'thumbs-down',
			'fa-thumbs-o-down' => 'thumbs-o-down',
			'fa-thumbs-o-up' => 'thumbs-o-up',
			'fa-thumbs-up' => 'thumbs-up',
			'fa-ticket' => 'ticket',
			'fa-times' => 'times',
			'fa-times-circle' => 'times-circle',
			'fa-times-circle-o' => 'times-circle-o',
			'fa-tint' => 'tint',
			'fa-toggle-down' => 'toggle-down',
			'fa-toggle-left' => 'toggle-left',
			'fa-toggle-right' => 'toggle-right',
			'fa-toggle-up' => 'toggle-up',
			'fa-trash-o' => 'trash-o',
			'fa-tree' => 'tree',
			'fa-trophy' => 'trophy',
			'fa-truck' => 'truck',
			'fa-umbrella' => 'umbrella',
			'fa-university' => 'university',
			'fa-unlock' => 'unlock',
			'fa-unlock-alt' => 'unlock-alt',
			'fa-unsorted' => 'unsorted',
			'fa-upload' => 'upload',
			'fa-user' => 'user',
			'fa-users' => 'users',
			'fa-video-camera' => 'video-camera',
			'fa-volume-down' => 'volume-down',
			'fa-volume-off' => 'volume-off',
			'fa-volume-up' => 'volume-up',
			'fa-warning' => 'warning',
			'fa-wheelchair' => 'wheelchair',
			'fa-wrench' => 'wrench',
			'fa-file' => 'file',
			'fa-file-archive-o' => 'file-archive-o',
			'fa-file-audio-o' => 'file-audio-o',
			'fa-file-code-o' => 'file-code-o',
			'fa-file-excel-o' => 'file-excel-o',
			'fa-file-image-o' => 'file-image-o',
			'fa-file-movie-o' => 'file-movie-o',
			'fa-file-o' => 'file-o',
			'fa-file-pdf-o' => 'file-pdf-o',
			'fa-file-photo-o' => 'file-photo-o',
			'fa-file-picture-o' => 'file-picture-o',
			'fa-file-powerpoint-o' => 'file-powerpoint-o',
			'fa-file-sound-o' => 'file-sound-o',
			'fa-file-text' => 'file-text',
			'fa-file-text-o' => 'file-text-o',
			'fa-file-video-o' => 'file-video-o',
			'fa-file-word-o' => 'file-word-o',
			'fa-file-zip-o' => 'file-zip-o',
			'fa-circle-o-notch' => 'circle-o-notch',
			'fa-cog' => 'cog',
			'fa-gear' => 'gear',
			'fa-refresh' => 'refresh',
			'fa-spinner' => 'spinner',
			'fa-check-square' => 'check-square',
			'fa-check-square-o' => 'check-square-o',
			'fa-circle' => 'circle',
			'fa-circle-o' => 'circle-o',
			'fa-dot-circle-o' => 'dot-circle-o',
			'fa-minus-square' => 'minus-square',
			'fa-minus-square-o' => 'minus-square-o',
			'fa-plus-square' => 'plus-square',
			'fa-plus-square-o' => 'plus-square-o',
			'fa-square' => 'square',
			'fa-square-o' => 'square-o',
			'fa-bitcoin' => 'bitcoin',
			'fa-btc' => 'btc',
			'fa-cny' => 'cny',
			'fa-dollar' => 'dollar',
			'fa-eur' => 'eur',
			'fa-euro' => 'euro',
			'fa-gbp' => 'gbp',
			'fa-inr' => 'inr',
			'fa-jpy' => 'jpy',
			'fa-krw' => 'krw',
			'fa-money' => 'money',
			'fa-rmb' => 'rmb',
			'fa-rouble' => 'rouble',
			'fa-rub' => 'rub',
			'fa-ruble' => 'ruble',
			'fa-rupee' => 'rupee',
			'fa-try' => 'try',
			'fa-turkish-lira' => 'turkish-lira',
			'fa-usd' => 'usd',
			'fa-won' => 'won',
			'fa-yen' => 'yen',
			'fa-align-center' => 'align-center',
			'fa-align-justify' => 'align-justify',
			'fa-align-left' => 'align-left',
			'fa-align-right' => 'align-right',
			'fa-bold' => 'bold',
			'fa-chain' => 'chain',
			'fa-chain-broken' => 'chain-broken',
			'fa-clipboard' => 'clipboard',
			'fa-columns' => 'columns',
			'fa-copy' => 'copy',
			'fa-cut' => 'cut',
			'fa-dedent' => 'dedent',
			'fa-eraser' => 'eraser',
			'fa-file' => 'file',
			'fa-file-o' => 'file-o',
			'fa-file-text' => 'file-text',
			'fa-file-text-o' => 'file-text-o',
			'fa-files-o' => 'files-o',
			'fa-floppy-o' => 'floppy-o',
			'fa-font' => 'font',
			'fa-header' => 'header',
			'fa-indent' => 'indent',
			'fa-italic' => 'italic',
			'fa-link' => 'link',
			'fa-list' => 'list',
			'fa-list-alt' => 'list-alt',
			'fa-list-ol' => 'list-ol',
			'fa-list-ul' => 'list-ul',
			'fa-outdent' => 'outdent',
			'fa-paperclip' => 'paperclip',
			'fa-paragraph' => 'paragraph',
			'fa-paste' => 'paste',
			'fa-repeat' => 'repeat',
			'fa-rotate-left' => 'rotate-left',
			'fa-rotate-right' => 'rotate-right',
			'fa-save' => 'save',
			'fa-scissors' => 'scissors',
			'fa-strikethrough' => 'strikethrough',
			'fa-subscript' => 'subscript',
			'fa-superscript' => 'superscript',
			'fa-table' => 'table',
			'fa-text-height' => 'text-height',
			'fa-text-width' => 'text-width',
			'fa-th' => 'th',
			'fa-th-large' => 'th-large',
			'fa-th-list' => 'th-list',
			'fa-underline' => 'underline',
			'fa-undo' => 'undo',
			'fa-unlink' => 'unlink',
			'fa-angle-double-down' => 'angle-double-down',
			'fa-angle-double-left' => 'angle-double-left',
			'fa-angle-double-right' => 'angle-double-right',
			'fa-angle-double-up' => 'angle-double-up',
			'fa-angle-down' => 'angle-down',
			'fa-angle-left' => 'angle-left',
			'fa-angle-right' => 'angle-right',
			'fa-angle-up' => 'angle-up',
			'fa-arrow-circle-down' => 'arrow-circle-down',
			'fa-arrow-circle-left' => 'arrow-circle-left',
			'fa-arrow-circle-o-down' => 'arrow-circle-o-down',
			'fa-arrow-circle-o-left' => 'arrow-circle-o-left',
			'fa-arrow-circle-o-right' => 'arrow-circle-o-right',
			'fa-arrow-circle-o-up' => 'arrow-circle-o-up',
			'fa-arrow-circle-right' => 'arrow-circle-right',
			'fa-arrow-circle-up' => 'arrow-circle-up',
			'fa-arrow-down' => 'arrow-down',
			'fa-arrow-left' => 'arrow-left',
			'fa-arrow-right' => 'arrow-right',
			'fa-arrow-up' => 'arrow-up',
			'fa-arrows' => 'arrows',
			'fa-arrows-alt' => 'arrows-alt',
			'fa-arrows-h' => 'arrows-h',
			'fa-arrows-v' => 'arrows-v',
			'fa-caret-down' => 'caret-down',
			'fa-caret-left' => 'caret-left',
			'fa-caret-right' => 'caret-right',
			'fa-caret-square-o-down' => 'caret-square-o-down',
			'fa-caret-square-o-left' => 'caret-square-o-left',
			'fa-caret-square-o-right' => 'caret-square-o-right',
			'fa-caret-square-o-up' => 'caret-square-o-up',
			'fa-caret-up' => 'caret-up',
			'fa-chevron-circle-down' => 'chevron-circle-down',
			'fa-chevron-circle-left' => 'chevron-circle-left',
			'fa-chevron-circle-right' => 'chevron-circle-right',
			'fa-chevron-circle-up' => 'chevron-circle-up',
			'fa-chevron-down' => 'chevron-down',
			'fa-chevron-left' => 'chevron-left',
			'fa-chevron-right' => 'chevron-right',
			'fa-chevron-up' => 'chevron-up',
			'fa-hand-o-down' => 'hand-o-down',
			'fa-hand-o-left' => 'hand-o-left',
			'fa-hand-o-right' => 'hand-o-right',
			'fa-hand-o-up' => 'hand-o-up',
			'fa-long-arrow-down' => 'long-arrow-down',
			'fa-long-arrow-left' => 'long-arrow-left',
			'fa-long-arrow-right' => 'long-arrow-right',
			'fa-long-arrow-up' => 'long-arrow-up',
			'fa-toggle-down' => 'toggle-down',
			'fa-toggle-left' => 'toggle-left',
			'fa-toggle-right' => 'toggle-right',
			'fa-toggle-up' => 'toggle-up',
			'fa-arrows-alt' => 'arrows-alt',
			'fa-backward' => 'backward',
			'fa-compress' => 'compress',
			'fa-eject' => 'eject',
			'fa-expand' => 'expand',
			'fa-fast-backward' => 'fast-backward',
			'fa-fast-forward' => 'fast-forward',
			'fa-forward' => 'forward',
			'fa-pause' => 'pause',
			'fa-play' => 'play',
			'fa-play-circle' => 'play-circle',
			'fa-play-circle-o' => 'play-circle-o',
			'fa-step-backward' => 'step-backward',
			'fa-step-forward' => 'step-forward',
			'fa-stop' => 'stop',
			'fa-youtube-play' => 'youtube-play',
			'fa-adn' => 'adn',
			'fa-android' => 'android',
			'fa-apple' => 'apple',
			'fa-behance' => 'behance',
			'fa-behance-square' => 'behance-square',
			'fa-bitbucket' => 'bitbucket',
			'fa-bitbucket-square' => 'bitbucket-square',
			'fa-bitcoin' => 'bitcoin',
			'fa-btc' => 'btc',
			'fa-codepen' => 'codepen',
			'fa-css3' => 'css3',
			'fa-delicious' => 'delicious',
			'fa-deviantart' => 'deviantart',
			'fa-digg' => 'digg',
			'fa-dribbble' => 'dribbble',
			'fa-dropbox' => 'dropbox',
			'fa-drupal' => 'drupal',
			'fa-empire' => 'empire',
			'fa-facebook' => 'facebook',
			'fa-facebook-square' => 'facebook-square',
			'fa-flickr' => 'flickr',
			'fa-foursquare' => 'foursquare',
			'fa-ge' => 'ge',
			'fa-git' => 'git',
			'fa-git-square' => 'git-square',
			'fa-github' => 'github',
			'fa-github-alt' => 'github-alt',
			'fa-github-square' => 'github-square',
			'fa-gittip' => 'gittip',
			'fa-google' => 'google',
			'fa-google-plus' => 'google-plus',
			'fa-google-plus-square' => 'google-plus-square',
			'fa-hacker-news' => 'hacker-news',
			'fa-html5' => 'html5',
			'fa-instagram' => 'instagram',
			'fa-joomla' => 'joomla',
			'fa-jsfiddle' => 'jsfiddle',
			'fa-linkedin' => 'linkedin',
			'fa-linkedin-square' => 'linkedin-square',
			'fa-linux' => 'linux',
			'fa-maxcdn' => 'maxcdn',
			'fa-openid' => 'openid',
			'fa-pagelines' => 'pagelines',
			'fa-pied-piper' => 'pied-piper',
			'fa-pied-piper-alt' => 'pied-piper-alt',
			'fa-pied-piper-square' => 'pied-piper-square',
			'fa-pinterest' => 'pinterest',
			'fa-pinterest-square' => 'pinterest-square',
			'fa-qq' => 'qq',
			'fa-ra' => 'ra',
			'fa-rebel' => 'rebel',
			'fa-reddit' => 'reddit',
			'fa-reddit-square' => 'reddit-square',
			'fa-renren' => 'renren',
			'fa-share-alt' => 'share-alt',
			'fa-share-alt-square' => 'share-alt-square',
			'fa-skype' => 'skype',
			'fa-slack' => 'slack',
			'fa-soundcloud' => 'soundcloud',
			'fa-spotify' => 'spotify',
			'fa-stack-exchange' => 'stack-exchange',
			'fa-stack-overflow' => 'stack-overflow',
			'fa-steam' => 'steam',
			'fa-steam-square' => 'steam-square',
			'fa-stumbleupon' => 'stumbleupon',
			'fa-stumbleupon-circle' => 'stumbleupon-circle',
			'fa-tencent-weibo' => 'tencent-weibo',
			'fa-trello' => 'trello',
			'fa-tumblr' => 'tumblr',
			'fa-tumblr-square' => 'tumblr-square',
			'fa-twitter' => 'twitter',
			'fa-twitter-square' => 'twitter-square',
			'fa-vimeo-square' => 'vimeo-square',
			'fa-vine' => 'vine',
			'fa-vk' => 'vk',
			'fa-wechat' => 'wechat',
			'fa-weibo' => 'weibo',
			'fa-weixin' => 'weixin',
			'fa-windows' => 'windows',
			'fa-wordpress' => 'wordpress',
			'fa-xing' => 'xing',
			'fa-xing-square' => 'xing-square',
			'fa-yahoo' => 'yahoo',
			'fa-youtube' => 'youtube',
			'fa-youtube-play' => 'youtube-play',
			'fa-youtube-square' => 'youtube-square',
			'fa-ambulance' => 'ambulance',
			'fa-h-square' => 'h-square',
			'fa-hospital-o' => 'hospital-o',
			'fa-medkit' => 'medkit',
			'fa-plus-square' => 'plus-square',
			'fa-stethoscope' => 'stethoscope',
			'fa-user-md' => 'user-md',
			'fa-wheelchair' => 'wheelchair',
		);
		return $icon;
	}



	/**
	 * Repeatable Field Groups
	 */
	$meta_boxes['homepage_item_stats_counter_metabox'] = array(
		'id'         => 'homepage_item_stats_counter_metabox',
		'title'      => __( 'Add Your Stats', 'wearesupa' ),
		'pages'      => array( 'wearesupa-homepage', ),
		'fields'     => array(
			array(
				'id'          => $prefix . 'repeat_group',
				'type'        => 'group',
				'description' => __( 'Add as many different stats in here as you like. We use <a href="http://fortawesome.github.io/Font-Awesome/" target="_blank">FontAwesome Icons</a> for the stats, please visit that link, find the icon you want and find the icon name in this link.', 'wearesupa' ),
				'options'     => array(
					'group_title'   => __( 'Stat #{#}', 'wearesupa' ), // {#} gets replaced by row number
					'add_button'    => __( 'Add Another Stat', 'wearesupa' ),
					'remove_button' => __( 'Remove Stat', 'wearesupa' ),
					'sortable'      => true, // beta
				),
				// Fields array works the same, except id's only need to be unique for this group. Prefix is not needed.
				'fields'      => array(
					array(
						'name' => __( 'Stat Title', 'wearesupa' ),
						'id'   => 'title',
						'type' => 'text',
					),
					array(
						'name' => __( 'Stat Number', 'wearesupa' ),
						'id'   => 'number',
						'type' => 'text_small',
					),
					array(
						'name' => __( 'Choose an Icon', 'wearesupa' ),
						'id'   => 'icon',
						'type'    => 'select',
						'options' => $icons = fa_icons_list(),
					),

				),
			),
		),
	);




	$meta_boxes['homepage_template_metabox'] = array(
		'id'         => 'homepage_template_metabox',
		'title'      => __( 'Homepage Template Options', 'wearesupa' ),
		'pages'      => array( 'page', ), // Post type
		'context'    => 'normal',
		'priority'   => 'high',
		'show_names' => true, // Show field names on the left
		'show_on' => array( 'key' => 'page-template', 'value' => 't-homepage.php' ),
		'fields'     => array(

			array(
				'name'       => __( 'Cover Title Small Text', 'wearesupa' ),
				'desc'       => __( 'This is the "the" text seen in the demo (optional)', 'wearesupa' ),
				'id'         => $prefix . 'hero_title_small_text',
				'type'       => 'text',
			),

			array(
				'name'       => __( 'Cover Title', 'wearesupa' ),
				'desc'       => __( 'This shows as the large box in the hero area within the heading 1 (optional)', 'wearesupa' ),
				'id'         => $prefix . 'hero_title_text',
				'type'       => 'text',
			),

			array(
				'name'       => __( 'Cover Button Text', 'wearesupa' ),
				'desc'       => __( 'If you don\'t add text, the button won\'t show', 'wearesupa' ),
				'id'         => $prefix . 'hero_button_text',
				'type'       => 'text',
			),

			array(
				'name'       => __( 'Cover Overlay Image', 'wearesupa' ),
				'id'         => $prefix . 'cover_image_overlay',
				'type'       => 'file'
			),

			array(
				'name'       => __( 'Cover Overlay Image Alt text', 'wearesupa' ),
				'desc'       => __( 'Add an alt description to your image', 'wearesupa' ),
				'id'         => $prefix . 'cover_image_overlay_alt',
				'type'       => 'text',
			),

			array(
				'name'    => __( 'Cover Overlay Image Position', 'wearesupa' ),
				'desc'    => __( 'Position your image', 'wearesupa' ),
				'id'      => $prefix . 'cover_image_overlay_position',
				'type'    => 'select',
				'options' => array(
					'left' => __( 'Bottom Left', 'wearesupa' ),
					'right'   => __( 'Bottom Right', 'wearesupa' ),
				),
			),

			array(
			    'name' => 'Cover Images',
			    'desc' => __( 'Upload,View and Re-order your images. These images will then transition', 'wearesupa' ),
			    'button' => __( 'Manage gallery', 'wearesupa'), // Optionally set button label
			    'id'   => $prefix . 'gallery_images',
			    'type' => 'pw_gallery',
			    'sanitization_cb' => 'pw_gallery_field_sanitise',
			),

		)
	);

	$meta_boxes['post_layout'] = array(
		'id'         => 'post_layout',
		'title'      => __( 'Post Template Options', 'wearesupa' ),
		'pages'      => array( 'post', ), // Post type
		'context'    => 'normal',
		'priority'   => 'high',
		'show_names' => true, // Show field names on the left
		// 'cmb_styles' => true, // Enqueue the CMB stylesheet on the frontend
		'fields'     => array(
			array(
				'name'    => __( 'Select Layout', 'wearesupa' ),
				'id'      => $prefix . 'select_layout',
				'type'    => 'radio_inline',
				'default' => 'fullwidth',
				'options' => array(
					'fullwidth' => '<img src="'. get_template_directory_uri() . '/framework/cmb/images/col-1c.png" />',
					'contentleft' => '<img src="'. get_template_directory_uri() . '/framework/cmb/images/col-2cl.png" />',
					'contentright' => '<img src="'. get_template_directory_uri() . '/framework/cmb/images/col-2cr.png" />',
				),
			),

		),
	);


	// Add other metaboxes as needed

	return $meta_boxes;
}


add_action( 'init', 'cmb_initialize_wearesupa_meta_boxes', 9999 );
/**
 * Initialize the metabox class.
 */
function cmb_initialize_wearesupa_meta_boxes() {

	if ( ! class_exists( 'cmb_Meta_Box' ) )
		require_once 'cmb/init.php';
}

?>
