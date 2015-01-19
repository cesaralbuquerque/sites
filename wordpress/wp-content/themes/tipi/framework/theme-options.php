<?php

/* #######################################################################

	Theme Options

####################################################################### */

function wearesupa_register_theme_customizer( $wp_customize ) {

	//
	// General Settings
	//

	$wp_customize->add_section(
	    'wearesupa_general_options',
	    array(
	        'title'     => __('General Settings','wearesupa'),
	        'priority'  => 0
	    )
	);

	$wp_customize->add_setting(
	     'hide_logo_text',
	     array(
	         'default'    =>  false,
	         'transport'  =>  'postMessage',
	         'type' => 'option'
	     )
	 );


	$wp_customize->add_control(
	    'hide_logo_text',
	    array(
	        'section'   => 'wearesupa_general_options',
	        'label'     => __('Hide Plain Text logo?','wearesupa'),
	        'type'      => 'checkbox',
	        'priority'  => 1
	    )
	);

	$wp_customize->add_setting(
	     'hide_tagline',
	     array(
	         'default'    =>  true,
	         'transport'  =>  'postMessage',
	         'type' => 'option'
	     )
	 );


	$wp_customize->add_control(
	    'hide_tagline',
	    array(
	        'section'   => 'wearesupa_general_options',
	        'label'     => __('Hide Tagline?','wearesupa'),
	        'type'      => 'checkbox',
	        'priority'  => 2
	    )
	);


	 $wp_customize->add_setting(
	     'hide_comments',
	     array(
	         'default'    =>  false,
	         'transport'  =>  'postMessage',
	         'type' => 'option'
	     )
	 );


	$wp_customize->add_control(
	    'hide_comments',
	    array(
	        'section'   => 'wearesupa_general_options',
	        'label'     => __('Hide Comments?','wearesupa'),
	        'type'      => 'checkbox',
	        'priority'  => 9
	    )
	);


	$wp_customize->add_setting(
	     'hide_main_border',
	     array(
	         'default'    =>  false,
	         'transport'  =>  'postMessage',
	         'type' => 'option'
	     )
	 );


	$wp_customize->add_control(
	    'hide_main_border',
	    array(
	        'section'   => 'wearesupa_general_options',
	        'label'     => __('Hide Main Border?','wearesupa'),
	        'type'      => 'checkbox',
	        'priority'  => 10
	    )
	);

	$wp_customize->add_setting(
	'disable_preloader',
	array(
		'default'    =>  false,
		'transport'  =>  'postMessage',
		'type' => 'option'
	)
	);


	$wp_customize->add_control(
	'disable_preloader',
	array(
		'section'   => 'wearesupa_general_options',
		'label'     => __('Disable Preloader?','wearesupa'),
		'type'      => 'checkbox',
		'priority'  => 10
	)
	);


	$wp_customize->add_setting(
	    'twitter_username',
	    array(
	        'default'   => '',
	        'transport' => 'postMessage',
	        'type' => 'option'
	    )
	);

	$wp_customize->add_control(
	    'twitter_username',
	    array(
	        'section'  => 'wearesupa_general_options',
	        'label'    => __('Twitter Username','wearesupa'),
	        'type'     => 'text',
	        'priority'  => 20
	    )
	);





	//
	// Header Settings
	//

	$wp_customize->add_section(
	    'header_options',
	    array(
	        'title'     => __('Header Settings','wearesupa'),
	        'description' => __('Upload your global header below, You can then override the header height settings for Mobile, Tablet and Desktop.','wearesupa'),
	        'priority'  => 5
	    )
	);


	$wp_customize->add_setting(
	    'header_image',
	    array(
	        'default'      => '',
	        'transport'    => 'postMessage',
	        'type' => 'option',
	        'priority' => 1
	    )
	);


	$wp_customize->add_control(
	    new WP_Customize_Image_Control(
	        $wp_customize,
	        'header_image',
	        array(
	            'label'    => __('Header Background Image','wearesupa'),
	            'settings' => 'header_image',
	            'section'  => 'header_options'
	        )
	    )
	);


	$wp_customize->add_setting(
	    'bg_color_header',
	    array(
	        'default'   => '#333333',
	        'transport' => 'postMessage',
	        'type' => 'option'
	    )
	);

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'bg_color_header',
	        array(
	            'label'      => __( 'Header Background Colour', 'wearesupa' ),
	            'section'    => 'header_options',
	            'settings'   => 'bg_color_header',
	            'priority'  => 1
	        )
	    )
	);

	$wp_customize->add_setting(
	'bg_color_header',
	array(
		'default'   => '#333333',
		'transport' => 'postMessage',
		'type' => 'option'
	)
	);

	$wp_customize->add_control(
	new WP_Customize_Color_Control(
		$wp_customize,
		'bg_color_header',
		array(
			'label'      => __( 'Header Background Colour', 'wearesupa' ),
			'section'    => 'header_options',
			'settings'   => 'bg_color_header',
			'priority'  => 1
		)
	)
	);

	$wp_customize->add_setting(
	     'header_mobile_height',
	     array(
	         'default'    =>  '270px',
	         'transport'  =>  'postMessage',
         'type' => 'option',
         'priority'  => 2
	     )
	 );


	$wp_customize->add_control(
	    'header_mobile_height',
	    array(
	        'section'   => 'header_options',
	        'label'     => __('Mobile Header Height (Default: 270px)','wearesupa'),
	        'type'      => 'text'

	    )
	);


	$wp_customize->add_setting(
	     'header_tablet_height',
	     array(
	         'default'    =>  '350px',
	         'transport'  =>  'postMessage',
	     'type' => 'option',
	     'priority'  => 3
	     )
	 );


	$wp_customize->add_control(
	    'header_tablet_height',
	    array(
	        'section'   => 'header_options',
	        'label'     => __('Tablet Header Height (Default: 350px)','wearesupa'),
	        'type'      => 'text'

	    )
	);


	$wp_customize->add_setting(
	     'header_desktop_height',
	     array(
	         'default'    =>  '500px',
	         'transport'  =>  'postMessage',
	     'type' => 'option',
	     'priority'  => 4
	     )
	 );


	$wp_customize->add_control(
	    'header_desktop_height',
	    array(
	        'section'   => 'header_options',
	        'label'     => __('Desktop Header Height (Default: 500px)','wearesupa'),
	        'type'      => 'text'

	    )
	);


	//
	// Background Colours
	//
	$wp_customize->add_section(
	    'bg_colors',
	    array(
	        'title'     => __('Background & Border Colors','wearesupa'),
	        'priority'  => 50
	    )
	);


	$wp_customize->add_setting(
	    'bg_footer',
	    array(
	        'default'   => '#fccc20',
	        'type' => 'option'
	    )
	);

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'bg_footer',
	        array(
	            'label'      => __( 'Footer Background', 'wearesupa' ),
	            'section'    => 'bg_colors',
	            'priority'  => 1
	        )
	    )
	);

	$wp_customize->add_setting(
	    'bg_overlay',
	    array(
	        'default'   => '#2c2c2c',
	        'type' => 'option'
	    )
	);

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'bg_overlay',
	        array(
	            'label'      => __( 'Overlay Background', 'wearesupa' ),
	            'section'    => 'bg_colors',
	            'priority'  => 2
	        )
	    )
	);

	$wp_customize->add_setting(
	    'bg_dark',
	    array(
	        'default'   => '#2c2c2c',
	        'type' => 'option'
	    )
	);

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'bg_dark',
	        array(
	            'label'      => __( 'Dark Background', 'wearesupa' ),
	            'section'    => 'bg_colors',
	            'priority'  => 3
	        )
	    )
	);
	$wp_customize->add_setting(
	    'bg_light',
	    array(
	        'default'   => '#f2f2f2',
	        'type' => 'option'
	    )
	);

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'bg_light',
	        array(
	            'label'      => __( 'Light Background (Including Body)', 'wearesupa' ),
	            'section'    => 'bg_colors',
	            'priority'  => 4
	        )
	    )
	);

	$wp_customize->add_setting(
	    'border_color',
	    array(
	        'default'   => '#ffffff',
	        'type' => 'option'
	    )
	);

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'border_color',
	        array(
	            'label'      => __( 'Page Border Color', 'wearesupa' ),
	            'section'    => 'bg_colors',
	            'priority'  => 99
	        )
	    )
	);

	$wp_customize->add_setting(
	    'formatstatus_bkg_color',
	    array(
	        'default'   => '#383430',
	        'type' => 'option'
	    )
	);

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'formatstatus_bkg_color',
	        array(
	            'label'      => __( 'Status/Quote Post Background Color', 'wearesupa' ),
	            'section'    => 'bg_colors',
	            'priority'  => 6
	        )
	    )
	);

	$wp_customize->add_setting(
	    'formatlink_bkg_color',
	    array(
	        'default'   => '#383430',
	        'type' => 'option'
	    )
	);

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'formatlink_bkg_color',
	        array(
	            'label'      => __( 'Link Post Background Color', 'wearesupa' ),
	            'section'    => 'bg_colors',
	            'priority'  => 7
	        )
	    )
	);




	//
	// Font Colours
	//
	$wp_customize->add_setting(
	        'color_blog_title',
	        array(
	            'default'     => '#ffffff',
	            'type' => 'option'
	        )
	    );

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'color_blog_title',
	        array(
	            'label'      => __( 'Blog Title', 'wearesupa' ),
	            'section'    => 'colors',
	            'settings'   => 'color_blog_title',
	            'priority'  => 1
	        )
	    )
	);

	$wp_customize->add_setting(
	        'color_blog_title_hover',
	        array(
	            'default'     => '#000000',
	            'type' => 'option'
	        )
	    );

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'color_blog_title_hover',
	        array(
	            'label'      => __( 'Blog Title Hover', 'wearesupa' ),
	            'section'    => 'colors',
	            'settings'   => 'color_blog_title_hover',
	            'priority'  => 2
	        )
	    )
	);



	$wp_customize->add_setting(
	        'color_body',
	        array(
	            'default'     => '#333333',
	            'type' => 'option'
	        )
	    );

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'color_body',
	        array(
	            'label'      => __( 'Main Body Color', 'wearesupa' ),
	            'section'    => 'colors',
	            'priority'  => 3
	        )
	    )
	);

	$wp_customize->add_setting(
	        'color_link',
	        array(
	            'default'     => '#333333',
	            'type' => 'option'
	        )
	    );

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'color_link',
	        array(
	            'label'      => __( 'Main Link Color', 'wearesupa' ),
	            'section'    => 'colors',
	            'priority'  => 4
	        )
	    )
	);


	$wp_customize->add_setting(
	        'color_link_hover',
	        array(
	            'default'     => '#333333',
	            'type' => 'option'
	        )
	    );

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'color_link_hover',
	        array(
	            'label'      => __( 'Main Link Hover Color', 'wearesupa' ),
	            'section'    => 'colors',
	            'priority'  => 5
	        )
	    )
	);


	$wp_customize->add_setting(
	        'color_link_button',
	        array(
	            'default'     => '#ffffff',
	            'type' => 'option'
	        )
	    );

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'color_link_button',
	        array(
	            'label'      => __( 'Button Link Color', 'wearesupa' ),
	            'section'    => 'colors',
	            'priority'  => 6
	        )
	    )
	);

      $wp_customize->add_setting(
              'color_link_button_hover',
              array(
                  'default'     => '#fccc20',
                  'type' => 'option'
              )
          );

      $wp_customize->add_control(
          new WP_Customize_Color_Control(
              $wp_customize,
              'color_link_button_hover',
              array(
                  'label'      => __( 'Button Link Hover Color', 'wearesupa' ),
                  'section'    => 'colors',
                  'priority'  => 7
              )
          )
      );


      $wp_customize->add_setting(
              'color_overlay_text',
              array(
                  'default'     => '#ffffff',
                  'type' => 'option'
              )
          );

      $wp_customize->add_control(
          new WP_Customize_Color_Control(
              $wp_customize,
              'color_overlay_text',
              array(
                  'label'      => __( 'Overlay Text Color', 'wearesupa' ),
                  'section'    => 'colors',
                  'priority'  => 8
              )
          )
      );

	$wp_customize->add_setting(
		'color_overlay_link',
		array(
			'default'     => '#ffffff',
			'type' => 'option'
		)
	);

	$wp_customize->add_control(
	new WP_Customize_Color_Control(
		$wp_customize,
		'color_overlay_link',
		array(
			'label'      => __( 'Overlay Link Color', 'wearesupa' ),
			'section'    => 'colors',
			'priority'  => 9
		)
	)
	);

      $wp_customize->add_setting(
              'color_overlay_link_hover',
              array(
                  'default'     => '#fccc20',
                  'type' => 'option'
              )
          );

      $wp_customize->add_control(
          new WP_Customize_Color_Control(
              $wp_customize,
              'color_overlay_link_hover',
              array(
                  'label'      => __( 'Overlay Link Hover Color', 'wearesupa' ),
                  'section'    => 'colors',
                  'priority'  => 10
              )
          )
      );


      $wp_customize->add_setting(
              'color_up_button',
              array(
                  'default'     => '#ffffff',
                  'type' => 'option'
              )
          );

      $wp_customize->add_control(
          new WP_Customize_Color_Control(
              $wp_customize,
              'color_up_button',
              array(
                  'label'      => __( 'Up Button Color', 'wearesupa' ),
                  'section'    => 'colors',
                  'priority'  => 11
              )
          )
      );

      $wp_customize->add_setting(
              'color_up_button_hover',
              array(
                  'default'     => '#ffffff',
                  'type' => 'option'
              )
          );

      $wp_customize->add_control(
          new WP_Customize_Color_Control(
              $wp_customize,
              'color_up_button_hover',
              array(
                  'label'      => __( 'Up Button Hover Color', 'wearesupa' ),
                  'section'    => 'colors',
                  'priority'  => 12
              )
          )
      );


      $wp_customize->add_setting(
              'color_footer_link',
              array(
                  'default'     => '#333333',
                  'type' => 'option'
              )
          );

      $wp_customize->add_control(
          new WP_Customize_Color_Control(
              $wp_customize,
              'color_footer_link',
              array(
                  'label'      => __( 'Footer Text and Link Color', 'wearesupa' ),
                  'section'    => 'colors',
                  'priority'  => 13
              )
          )
      );

      $wp_customize->add_setting(
              'color_footer_link_hover',
              array(
                  'default'     => '#333333',
                  'type' => 'option'
              )
          );

      $wp_customize->add_control(
          new WP_Customize_Color_Control(
              $wp_customize,
              'color_footer_link_hover',
              array(
                  'label'      => __( 'Footer Link Hover Color', 'wearesupa' ),
                  'section'    => 'colors',
                  'priority'  => 14
              )
          )
      );


      $wp_customize->add_setting(
              'color_button_dark',
              array(
                  'default'     => '#2c2c2c',
                  'type' => 'option'
              )
          );

      $wp_customize->add_control(
          new WP_Customize_Color_Control(
              $wp_customize,
              'color_button_dark',
              array(
                  'label'      => __( 'Dark Button Color', 'wearesupa' ),
                  'section'    => 'colors',
                  'priority'  => 15
              )
          )
      );


      $wp_customize->add_setting(
              'color_button_dark_hover',
              array(
                  'default'     => '#ffffff',
                  'type' => 'option'
              )
          );

      $wp_customize->add_control(
          new WP_Customize_Color_Control(
              $wp_customize,
              'color_button_dark_hover',
              array(
                  'label'      => __( 'Dark Button Hover Color', 'wearesupa' ),
                  'section'    => 'colors',
                  'priority'  => 15
              )
          )
      );

      $wp_customize->add_setting(
              'color_dark_bg_text',
              array(
                  'default'     => '#ffffff',
                  'type' => 'option'
              )
          );

      $wp_customize->add_control(
          new WP_Customize_Color_Control(
              $wp_customize,
              'color_dark_bg_text',
              array(
                  'label'      => __( 'Dark Background Text Color', 'wearesupa' ),
                  'section'    => 'colors',
                  'priority'  => 16
              )
          )
      );


      $wp_customize->add_setting(
              'color_blog_panel_link',
              array(
                  'default'     => '#ffffff',
                  'type' => 'option'
              )
          );

      $wp_customize->add_control(
          new WP_Customize_Color_Control(
              $wp_customize,
              'color_blog_panel_link',
              array(
                  'label'      => __( 'Blog Panel Link Color', 'wearesupa' ),
                  'section'    => 'colors',
                  'priority'  => 17
              )
          )
      );

      $wp_customize->add_setting(
              'color_blog_panel_link_hover',
              array(
                  'default'     => '#fccc20',
                  'type' => 'option'
              )
          );

      $wp_customize->add_control(
          new WP_Customize_Color_Control(
              $wp_customize,
              'color_blog_panel_link_hover',
              array(
                  'label'      => __( 'Blog Panel Link Hover Color', 'wearesupa' ),
                  'section'    => 'colors',
                  'priority'  => 18
              )
          )
      );

      $wp_customize->add_setting(
              'color_menu_icon',
              array(
                  'default'     => '#ffffff',
                  'type' => 'option'
              )
          );

      $wp_customize->add_control(
          new WP_Customize_Color_Control(
              $wp_customize,
              'color_menu_icon',
              array(
                  'label'      => __( 'Menu Icon Color', 'wearesupa' ),
                  'section'    => 'colors',
                  'priority'  => 19
              )
          )
      );

      $wp_customize->add_setting(
              'color_menu_icon_hover',
              array(
                  'default'     => '#fccc20',
                  'type' => 'option'
              )
          );

      $wp_customize->add_control(
          new WP_Customize_Color_Control(
              $wp_customize,
              'color_menu_icon_hover',
              array(
                  'label'      => __( 'Menu Icon Hover Color', 'wearesupa' ),
                  'section'    => 'colors',
                  'priority'  => 20
              )
          )
      );

      $wp_customize->add_setting(
	    'formatstatus_font_color',
	    array(
	        'default'   => '#ffffff',
	        'type' => 'option'
	    )
	);

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'formatstatus_font_color',
	        array(
	            'label'      => __( 'Status/Quote Post Color', 'wearesupa' ),
	            'section'    => 'colors',
	            'priority'  => 25
	        )
	    )
	);

	$wp_customize->add_setting(
	    'formatstatus_font_color_hover',
	    array(
	        'default'   => '#fccc20',
	        'type' => 'option'
	    )
	);

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'formatstatus_font_color_hover',
	        array(
	            'label'      => __( 'Status/Quote Post Hover Color', 'wearesupa' ),
	            'section'    => 'colors',
	            'priority'  => 26
	        )
	    )
	);

	$wp_customize->add_setting(
	    'formatlink_font_color',
	    array(
	        'default'   => '#ffffff',
	        'type' => 'option'
	    )
	);

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'formatlink_font_color',
	        array(
	            'label'      => __( 'Link Post Color', 'wearesupa' ),
	            'section'    => 'colors',
	            'priority'  => 30
	        )
	    )
	);

	$wp_customize->add_setting(
	    'formatlink_font_color_hover',
	    array(
	        'default'   => '#fccc20',
	        'type' => 'option'
	    )
	);

	$wp_customize->add_control(
	    new WP_Customize_Color_Control(
	        $wp_customize,
	        'formatlink_font_color_hover',
	        array(
	            'label'      => __( 'Link Post Hover Color', 'wearesupa' ),
	            'section'    => 'colors',
	            'priority'  => 30
	        )
	    )
	);


        //
        // Fonts
        //

        $wp_customize->add_section(
            'wearesupa_font',
            array(
                'title'     => __('Fonts','wearesupa'),
                'priority'  => 68
            )
        );

        $wp_customize->add_setting(
            'font_main',
            array(
                'default'   => 'PT Serif',
                'transport' => 'postMessage',
                'type' => 'option'
            )
        );

        $wp_customize->add_control(
            'font_main',
            array(
                'section'  => 'wearesupa_font',
                'label'    => __('Main Font','wearesupa'),
                'type'     => 'select',
                'choices'  => array(
                    'PT Serif' => 'PT Serif (Default)',
                    'Oswald' => 'Oswald',
                    'Helvetica Neue' => 'Helvetica Neue',
                    'helvetica' => 'Helvetica',
                    'arial'     => 'Arial',
                    'verdana'   => 'Verdana',
                    'times'     => 'Times New Roman',
                    'georgia'   => 'Georgia',
                    'courier'   => 'Courier New'
                ),
                'priority' => 1
            )
        );

        $wp_customize->add_setting(
            'font_headings',
            array(
                'default'   => 'Oswald',
                'transport' => 'postMessage',
                'type' => 'option'
            )
        );

        $wp_customize->add_control(
            'font_headings',
            array(
                'section'  => 'wearesupa_font',
                'label'    => __('Heading & Meta Font','wearesupa'),
                'type'     => 'select',
                'choices'  => array(
                    'Oswald' => 'Oswald (Default)',
                    'PT Serif' => 'PT Serif',
                    'Helvetica Neue' => 'Helvetica Neue',
                    'helvetica' => 'Helvetica',
                    'arial'     => 'Arial',
                    'verdana'   => 'Verdana',
                    'times'     => 'Times New Roman',
                    'georgia'   => 'Georgia',
                    'courier'   => 'Courier New'
                ),
                'priority' => 2
            )
        );


        $wp_customize->add_setting(
            'font_uppercase',
            array(
                'default'   => true,
                'transport' => 'postMessage',
                'type' => 'option'
            )
        );

        $wp_customize->add_control(
            'font_uppercase',
            array(
                'section'   => 'wearesupa_font',
                'label'     => __('Uppercase all "Titles"?','wearesupa'),
                'type'      => 'checkbox',
                'priority' => 3
            )
        );

        //
        // Fonts
        //

        $wp_customize->add_section(
            'font_advanced',
            array(
                'title'     => __('Fonts Advanced','wearesupa'),
                'description'	=>	__( 'We support <a href="https://www.google.com/fonts" target="_blank">Google web fonts</a>, <a href="https://typekit.com/fonts" target="_blank">Typekit</a> and <a href="http://html.adobe.com/edge/webfonts/" target="_blank">Adobe Web fonts</a>. Paste their code in to the Font Service Code block below then enter the font family as they tell you to in the Font Family textboxes for Heading &amp; Main. Finally choose your font-weight. <br /><br /><strong>You need to save and publish to view your changes</strong>.' , 'wearesupa' ),
                'priority'  => 69
            )
        );

        //
        // Font Service
        //
        class Font_Service_Control extends WP_Customize_Control {
            public $type = 'font_advanced_service';

            public function render_content() {
                ?>
                    <label>
                        <span class="customize-control-title"><?php echo esc_html( $this->label ); ?></span>
                        <textarea rows="7" style="width:100%;" <?php $this->link(); ?>><?php echo esc_textarea( $this->value() ); ?></textarea>
                    </label>
                <?php
            }
        }

        $wp_customize->add_setting(
            'font_advanced_service',
            array(
                'default'   => '',
                'transport' => 'postMessage',
                'type' => 'option'
            )
        );

        $wp_customize->add_control(
            new Font_Service_Control(
                $wp_customize, 'font_advanced_service',
                array(
                    'label' => 'Service Code',
                    'section' => 'font_advanced',
                    'settings' => 'font_advanced_service',
                    'priority' => 1,
                )
            )
        );

        $wp_customize->add_setting(
            'font_advanced_service_main',
            array(
                'default'   => '',
                'transport' => 'postMessage',
                'type' => 'option'
            )
        );


        $wp_customize->add_control(
            'font_advanced_service_main',
            array(
                'section'   => 'font_advanced',
                'label'     => __( 'Main Font Family' , 'wearesupa' ),
                'type'      => 'text',
                'priority' => 2
            )
        );


        $wp_customize->add_setting(
            'font_advanced_service_main_weight',
            array(
                'default'   => '400',
                'transport' => 'postMessage',
                'type' => 'option'
            )
        );

        $wp_customize->add_control(
            'font_advanced_service_main_weight',
            array(
                'section'  => 'font_advanced',
                'label'    => __('Font Weight for Main','wearesupa'),
                'type'     => 'select',
                'priority' => 3,
                'choices'  => array(
                    '100' => 'Thin (100)',
                    '200' => 'Extra-light (200)',
                    '300' => 'Light (300)',
                    '400'     => 'Normal (400)',
                    '500'   => 'Medium (500)',
                    '600'     => 'Semi-Bold (600)',
                    '700'   => 'Bold (700)',
                    '800'   => 'Extra-Bold (800)',
                    '900' => 'Ultra-Bold (900)'
                )
            )
        );

        $wp_customize->add_setting(
            'font_advanced_service_heading_weight',
            array(
                'default'   => '600',
                'transport' => 'postMessage',
                'type' => 'option'
            )
        );

        $wp_customize->add_control(
            'font_advanced_service_heading_weight',
            array(
                'section'  => 'font_advanced',
                'label'    => __('Font Weight for Headings & Meta','wearesupa'),
                'type'     => 'select',
                'priority' => 4,
                'choices'  => array(
                    '100' => 'Thin (100)',
                    '200' => 'Extra-light (200)',
                    '300' => 'Light (300)',
                    '400'     => 'Normal (400)',
                    '500'   => 'Medium (500)',
                    '600'     => 'Semi-Bold (600)',
                    '700'   => 'Bold (700)',
                    '800'   => 'Extra-Bold (800)',
                    '900' => 'Ultra-Bold (900)'
                )
            )
        );

        $wp_customize->add_setting(
            'font_advanced_service_main_oblique',
            array(
                'default'   => false,
                'transport' => 'postMessage',
                'type' => 'option'
            )
        );

        $wp_customize->add_control(
            'font_advanced_service_main_oblique',
            array(
                'section'   => 'font_advanced',
                'label'     => __('Italicise Main?','wearesupa'),
                'type'      => 'checkbox',
                'priority' => 3
            )
        );

        $wp_customize->add_setting(
            'font_advanced_service_heading_oblique',
            array(
                'default'   => false,
                'transport' => 'postMessage',
                'type' => 'option'
            )
        );

        $wp_customize->add_control(
            'font_advanced_service_heading_oblique',
            array(
                'section'   => 'font_advanced',
                'label'     => __('Italicise Heading &amp; Meta?','wearesupa'),
                'type'      => 'checkbox',
                'priority' => 4
            )
        );

        $wp_customize->add_setting(
            'font_advanced_service_headings',
            array(
                'default'   => '',
                'transport' => 'postMessage',
                'type' => 'option'
            )
        );


        $wp_customize->add_control(
            'font_advanced_service_headings',
            array(
                'section'   => 'font_advanced',
                'label'     => __( 'Heading &amp; Meta Font Family' , 'wearesupa' ),
                'type'      => 'text',
                'priority' => 3
            )
        );


        //
        // Image uploads
        //

        $wp_customize->add_section(
            'wearesupa_image_options',
            array(
                'title'     => __('Image Uploads','wearesupa'),
                'description' => '',
                'priority'  => 70
            )
        );

        $wp_customize->add_setting(
            'wearesupa_logo_image_retina',
            array(
                'default'      => '',
                'transport'    => 'postMessage',
                'type' => 'option',
                'priority' => 1
            )
        );

        $wp_customize->add_control(
            new WP_Customize_Image_Control(
                $wp_customize,
                'wearesupa_logo_image_retina',
                array(
                    'label'    => __('Logo (Retina)','wearesupa'),
                    'settings' => 'wearesupa_logo_image_retina',
                    'section'  => 'wearesupa_image_options'
                )
            )
        );

        $wp_customize->add_setting(
            'wearesupa_logo_image',
            array(
                'default'      => '',
                'transport'    => 'postMessage',
                'type' => 'option',
                'priority' => 1
            )
        );


        $wp_customize->add_control(
            new WP_Customize_Image_Control(
                $wp_customize,
                'wearesupa_logo_image',
                array(
                    'label'    => __('Logo','wearesupa'),
                    'settings' => 'wearesupa_logo_image',
                    'section'  => 'wearesupa_image_options'
                )
            )
        );

        $wp_customize->add_setting(
            'favicon_image',
            array(
                'default'      => '',
                'transport'    => 'postMessage',
                'type' => 'option',
                'priority' => 2
            )
        );


        $wp_customize->add_control(
            new WP_Customize_Image_Control(
                $wp_customize,
                'favicon_image',
                array(
                    'label'    => __('Upload Favicon (32x32px)','wearesupa'),
                    'settings' => 'favicon_image',
                    'section'  => 'wearesupa_image_options'
                )
            )
        );

        $wp_customize->add_setting(
            'appleicon_image',
            array(
                'default'      => '',
                'transport'    => 'postMessage',
                'type' => 'option',
                'priority' => 2
            )
        );


        $wp_customize->add_control(
            new WP_Customize_Image_Control(
                $wp_customize,
                'appleicon_image',
                array(
                    'label'    => __('Upload Apple Touch Icon (152x152px)','wearesupa'),
                    'settings' => 'appleicon_image',
                    'section'  => 'wearesupa_image_options'
                )
            )
        );

        $wp_customize->add_setting(
            'body_background_tile_image',
            array(
                'default'      => '',
                'transport'    => 'postMessage',
                'type' => 'option'
            )
        );


        $wp_customize->add_control(
            new WP_Customize_Image_Control(
                $wp_customize,
                'body_background_tile_image',
                array(
                    'label'    => __('Body Background Tile','wearesupa'),
                    'settings' => 'body_background_tile_image',
                    'section'  => 'wearesupa_image_options'
                )
            )
        );

        $wp_customize->add_setting(
            'body_background_cover_image',
            array(
                'default'      => '',
                'transport'    => 'postMessage',
                'type' => 'option'
            )
        );


        $wp_customize->add_control(
            new WP_Customize_Image_Control(
                $wp_customize,
                'body_background_cover_image',
                array(
                    'label'    => __('Body Background Cover','wearesupa'),
                    'settings' => 'body_background_cover_image',
                    'section'  => 'wearesupa_image_options'
                )
            )
        );


        $wp_customize->add_setting(
            'error_image',
            array(
                'default'      => '',
                'transport'    => 'postMessage',
                'type' => 'option'
            )
        );


        $wp_customize->add_control(
            new WP_Customize_Image_Control(
                $wp_customize,
                'error_image',
                array(
                    'label'    => __('404 Error Cover Image','wearesupa'),
                    'settings' => 'error_image',
                    'section'  => 'wearesupa_image_options'
                )
            )
        );


	//
	// CUSTOM BLOG LAYOUT
	//

	$wp_customize->add_section(
	'blog_layout_options',
	array(
		'title'     => __('Blog Post Layout','wearesupa'),
		'description' => '',
		'priority'  => 71
	)
	);

	$wp_customize->add_setting(
	'blog_layout',
	array(
		'default'   => 'full_width',
		'type' => 'option'
	)
	);

	// $wp_customize->add_control(
	// 'blog_layout',
	// array(
	// 	'section'  => 'blog_layout_options',
	// 	'label'    => __('Select a Layout','wearesupa'),
	// 	'type'     => 'radio',
	// 	'choices'  => array(
	// 		'full-width' => 'Full Width',
	// 		'content-left' => 'Content Left, Sidebar Right',
	// 		'content-right' => 'Content Right, Sidebar Left'
	// 	),
	// 	'priority' => 1
	// )
	// );


        class Custom_CSS_Control extends WP_Customize_Control {
            public $type = 'custom_css';

            public function render_content() {
                ?>
                    <label>
                        <span class="customize-control-title"><?php echo esc_html( $this->label ); ?></span>
                        <textarea rows="7" style="width:100%;" <?php $this->link(); ?>><?php echo esc_textarea( $this->value() ); ?></textarea>
                    </label>
                <?php
            }
        }

             //
             // CUSTOM TEXT
             //

             class Text_Control extends WP_Customize_Control {
                 public $type = 'text_control';

                 public function render_content() {
                     ?>
                         <label>
                             <span class="customize-control-title"><?php echo esc_html( $this->label ); ?></span>
                             <textarea rows="9" style="width:100%;" <?php $this->link(); ?>><?php echo esc_textarea( $this->value() ); ?></textarea>
                         </label>
                     <?php
                 }
             }


             class Text_Control2 extends WP_Customize_Control {
                 public $type = 'text_control2';

                 public function render_content() {
                     ?>
                         <label>
                             <span class="customize-control-title"><?php echo esc_html( $this->label ); ?></span>
                             <textarea rows="9" style="width:100%;" <?php $this->link(); ?>><?php echo esc_textarea( $this->value() ); ?></textarea>
                         </label>
                     <?php
                 }
             }

             class Text_Control3 extends WP_Customize_Control {
                 public $type = 'text_control3';

                 public function render_content() {
                     ?>
                         <label>
                             <span class="customize-control-title"><?php echo esc_html( $this->label ); ?></span>
                             <textarea rows="9" style="width:100%;" <?php $this->link(); ?>><?php echo esc_textarea( $this->value() ); ?></textarea>
                         </label>
                     <?php
                 }
             }

             class Text_Control4 extends WP_Customize_Control {
                 public $type = 'text_control4';

                 public function render_content() {
                     ?>
                         <label>
                             <span class="customize-control-title"><?php echo esc_html( $this->label ); ?></span>
                             <textarea rows="9" style="width:100%;" <?php $this->link(); ?>><?php echo esc_textarea( $this->value() ); ?></textarea>
                         </label>
                     <?php
                 }
             }

             class Text_Control5 extends WP_Customize_Control {
                 public $type = 'text_control5';

                 public function render_content() {
                     ?>
                         <label>
                             <span class="customize-control-title"><?php echo esc_html( $this->label ); ?></span>
                             <textarea rows="9" style="width:100%;" <?php $this->link(); ?>><?php echo esc_textarea( $this->value() ); ?></textarea>
                         </label>
                     <?php
                 }
             }

             $wp_customize->add_section(
             	    'text_settings',
             	    array(
             	        'title' => __('Custom Text','wearesupa'),
             	        'priority' => 72,
             	    )
             	);


           $wp_customize->add_setting( 'footer_socials', array(
              		'default' => '<ul><li><a href="http://twitter.com" title="Twitter" class="btn btndark">Twitter</a></li><li><a href="http://facebook.com" title="Facebook" class="btn btndark">Facebook</a></li><li><a href="http://instagram.com" title="Instagram" class="btn btndark">Instagram</a></li><li><a href="http://foursquare.com" title="Foursquare" class="btn btndark">Foursquare</a></li><li><a href="http://youtube.com" title="Youtube" class="btn btndark">Youtube</a></li></ul>',
              		'type' => 'option'
                   ) );


              $wp_customize->add_control(
                  new Custom_CSS_Control( $wp_customize, 'text_control4',
                      array(
                          'label' => 'Footer Socials',
                          'section' => 'text_settings',
                          'settings' => 'footer_socials',
                          'priority' => 3
                      )
                  )
              );

           	$wp_customize->get_setting( 'footer_socials' )->transport = 'refresh';




        	$wp_customize->add_setting( 'footer_copyright', array(
        	   		'default' => '&copy; 2014 Tipi. Built by <a href="http://www.wearesupa.com" target="_blank">Supa</a>',
        	   		'type' => 'option'
        	        ) );
        	   $wp_customize->add_control(
        	       new Custom_CSS_Control( $wp_customize, 'text_control',
        	           array(
        	               'label' => 'Footer Tagline',
        	               'section' => 'text_settings',
        	               'settings' => 'footer_copyright',
        	               'priority' => 4
        	           )
        	       )
        	   );

        		$wp_customize->get_setting( 'footer_copyright' )->transport = 'refresh';




        		$wp_customize->add_setting( 'overlay_contact', array(
        		   		'default' => '<i class="fa fa-envelope-o"></i><a href="mailto:hello@wearesupa.com" title="Email me">you@youremail.com</a> | 07775 123456',
        		   		'type' => 'option'
        		        ) );
        		   $wp_customize->add_control(
        		       new Custom_CSS_Control( $wp_customize, 'text_control5',
        		           array(
        		               'label' => __('Overlay Contact' , 'wearesupa'),
        		               'section' => 'text_settings',
        		               'settings' => 'overlay_contact',
        		               'priority' => 5
        		           )
        		       )
        		   );

        			$wp_customize->get_setting( 'overlay_contact' )->transport = 'refresh';








        $wp_customize->add_setting(
            'text_menu',
            array(
                'default'   => __('Menu','wearesupa'),
                'type' => 'option'
            )
        );

        $wp_customize->add_control(
            'text_menu',
            array(
                'section'  => 'text_settings',
                'label'    => __('Menu Text','wearesupa'),
                'type'     => 'text',
                'priority' => 4
            )
        );





        $wp_customize->add_setting(
            'text_logo_alt',
            array(
                'default'   => __('Logo Alt','wearesupa'),
                'transport' => 'postMessage',
                'type' => 'option'
            )
        );

        $wp_customize->add_control(
            'text_logo_alt',
            array(
                'section'  => 'text_settings',
                'label'    => __('Logo Alt Text','wearesupa'),
                'type'     => 'text',
                'priority' => 5
            )
        );


        $wp_customize->add_setting(
            'text_logo_title',
            array(
                'default'   => __('Logo Title','wearesupa'),
                'transport' => 'postMessage',
                'type' => 'option'
            )
        );

        $wp_customize->add_control(
            'text_logo_title',
            array(
                'section'  => 'text_settings',
                'label'    => __('Logo Title Text','wearesupa'),
                'type'     => 'text',
                'priority' => 6
            )
        );






        $wp_customize->add_setting(
            'text_blog_section_title',
            array(
                'default'   => __('My Adventures','wearesupa'),
                'transport' => 'postMessage',
                'type' => 'option'
            )
        );


        $wp_customize->add_control(
            'text_blog_section_title',
            array(
                'section'  => 'text_settings',
                'label'    => __('My Adventures Text on Blog Archive','wearesupa'),
                'type'     => 'text',
                'priority' => 6
            )
        );



        //
        // CUSTOM CSS
        //


        $wp_customize->add_section(
        	    'custom_css',
        	    array(
        	        'title' => __('Custom CSS Block','wearesupa'),
        	        'priority' => 72,
        	    )
        	);

        $wp_customize->add_setting(
        	  'custom_css',
        	      array(
        	          'type' => 'option'
        	      )
        );

        $wp_customize->add_control(
            new Custom_CSS_Control( $wp_customize, 'custom_css',
                array(
                    'label' => __( 'Enter Your Custom CSS' , 'wearesupa' ),
                    'section' => 'custom_css',
                    'settings' => 'custom_css'
                )
            )
        );


        $wp_customize->add_section(
        	    'google_analytics_settings',
        	    array(
        	        'title' => __('Google Analytics JavaScript','wearesupa'),
        	        'priority' => 73,
        	    )
        	);

          //
          // GOOGLE ANALYTICS
          //
          class Google_Analytics_Control extends WP_Customize_Control {
              public $type = 'google_analytics';

              public function render_content() {
                  ?>
                      <label>
                          <span class="customize-control-title"><?php echo esc_html( $this->label ); ?></span>
                          <textarea rows="7" style="width:100%;" <?php $this->link(); ?>><?php echo esc_textarea( $this->value() ); ?></textarea>
                      </label>
                  <?php
              }
          }


          $wp_customize->add_setting(
          	  'google_analytics',
          	      array(
          	          'type' => 'option'
          	      )
          );

          $wp_customize->add_control(
              new Google_Analytics_Control(
                  $wp_customize, 'google_analytics',
                  array(
                      'label' => 'Google Analytics Script',
                      'section' => 'google_analytics_settings',
                      'settings' => 'google_analytics',
                      'priority' => 10,
                  )
              )
          );

}
add_action( 'customize_register', 'wearesupa_register_theme_customizer' );


// Make options change live...
function wearesupa_customizer_live_preview() {

    wp_enqueue_script(
        'wearesupa-theme-customizer',
        get_template_directory_uri() . '/framework/js/theme-customizer.js',
        array( 'jquery', 'customize-preview' ),
        '1.0.5',
        true
    );

}
add_action( 'customize_preview_init', 'wearesupa_customizer_live_preview' );



// Add CSS to theme...

function wearesupa_customizer_css() {
    ?>
    <style type="text/css">
    <?php // THEME OPTIONS // ?>
    <?php if( get_option( 'hide_main_border' ) === "1" ) { ?>
    		#container {
    			padding-left: 0;
    			padding-right: 0;
    		}
    <?php } ?>

	<?php if( get_option( 'disable_preloader' ) === "1" ) { ?>
			#preloader {
				display: none;
			}
	<?php } ?>
    <?php // COLOURS //

    	$color_blog_title = get_option( 'color_blog_title' );


    	if ( $color_blog_title !== "#ffffff" && $color_blog_title !== false ) {

     ?>
    .blog-title, .blog-title a, .blog-tagline a, .blog-tagline {
    	color: <?php echo $color_blog_title; ?>
    }
    <?php

    	}
    ?>
    <?php

    	$color_blog_title_hover = get_option( 'color_blog_title_hover' );

    	if ( $color_blog_title_hover !== "#000000" && $color_blog_title_hover !== false ) {

     ?>
    .blog-title a:hover {
    	color: <?php echo $color_blog_title_hover; ?>
    }
    <?php

    	}
    ?>
   <?php

   	$color_body = get_option( 'color_body' );

   	if ( $color_body !== "#333333" && $color_body !== false ) {

    ?>
   body,ul,ol,dl,td,th,caption,pre,p,blockquote,input,textarea,label {
   	color: <?php echo $color_body; ?>
   }

   .tagcloud a {
	border-color: <?php echo $color_body; ?>
   }
   <?php

   	}
   ?>
   <?php

   	$color_link = get_option( 'color_link' );

   	if ( $color_link !== "#333333" && $color_link !== false ) {

    ?>
   article a, article a:visited, h6 a {
   	color: <?php echo $color_link; ?>
   }
   <?php

   	}
   ?>
   <?php

   	$color_link_hover = get_option( 'color_link' );

   	if ( $color_link_hover !== "#333333" && $color_link_hover !== false ) {

    ?>
   article a:hover {
   	color: <?php echo $color_link_hover; ?>
   }
   <?php

   	}
   ?>

   <?php

   	$color_link_button = get_option( 'color_link_button' );

   	if ( $color_link_button !== "#ffffff" && $color_link_button !== false ) {

    ?>
    a.btn, span.btn a, #container .form-submit input {
   	color: <?php echo $color_link_button; ?>
   }
   <?php

   	}
   ?>

   <?php

   	$color_link_button_hover = get_option( 'color_link_button_hover' );

   	if ( $color_link_button_hover !== "#fccc20" && $color_link_button_hover !== false ) {

    ?>
    a.btn:hover, a.btn:focus, span.btn a:hover, span.btn a:focus {
   	color: <?php echo $color_link_button_hover; ?>
   }
   <?php

   	}
   ?>
   <?php

   	$color_overlay_text = get_option( 'color_overlay_text' );

   	if ( $color_overlay_text !== "#ffffff" && $color_overlay_text !== false ) {

    ?>
    #menuoverlay h3, #menuoverlay p, #menuoverlay label {
   	color: <?php echo $color_overlay_text; ?>;
   }
#menuoverlay input[type="text"],#menuoverlay input[type="email"],#menuoverlay input[type="password"],#menuoverlay input[type="url"],#menuoverlay input[type="tel"],#menuoverlay textarea
{
	border-color: <?php echo $color_overlay_text; ?>;
	color: <?php echo $color_overlay_text; ?>;
}
   <?php

   	}
   ?>

	<?php

		$color_overlay_link = get_option( 'color_overlay_link' );

		if ( $color_overlay_link !== "#ffffff" && $color_overlay_link !== false ) {

	?>
	#menuoverlay li a, #menuoverlay a {
		color: <?php echo $color_overlay_link; ?>;
	}
	#menuoverlay input[type="submit"] {
		border-color: <?php echo $color_overlay_link; ?>;
		color: <?php echo $color_overlay_link; ?>;
	}
	<?php

		}
	?>
   <?php

   	$color_overlay_link_hover = get_option( 'color_overlay_link_hover' );

   	if ( $color_overlay_link_hover !== "#fccc20" && $color_overlay_link_hover !== false ) {

    ?>

    #menuoverlay li a:hover, #menuoverlay input[type="submit"]:hover {
   	color: <?php echo $color_overlay_link_hover; ?>
   }
   <?php

   	}
   ?>
   <?php

   	$color_up_button = get_option( 'color_up_button' );

   	if ( $color_up_button !== "#ffffff" && $color_up_button !== false ) {

    ?>
    a.up {
   	color: <?php echo $color_up_button; ?>;
   	border-color: <?php echo $color_up_button; ?>;
   }
   a.up::before,a.up::after {
   	background: <?php echo $color_up_button; ?>;
   }
   <?php

   	}
   ?>

   <?php

   	$color_up_button_hover = get_option( 'color_up_button_hover' );

   	if ( $color_up_button_hover !== "#ffffff" && $color_up_button_hover !== false ) {

    ?>
    a.up:hover {
   	color: <?php echo $color_up_button_hover; ?>;
   	border-color: <?php echo $color_up_button_hover; ?>;
   }
   a.up:hover::before,a.up:hover::after {
   	background: <?php echo $color_up_button_hover; ?>;
   }
   <?php

   	}
   ?>

   <?php

   	$color_footer_link = get_option( 'color_footer_link' );

   	if ( $color_footer_link !== "#333333" && $color_footer_link !== false ) {

    ?>
   #footer, #footer a {
   	color: <?php echo $color_footer_link; ?>;
   }
   <?php

   	}
   ?>
   <?php

   	$color_footer_link_hover = get_option( 'color_footer_link_hover' );

   	if ( $color_footer_link_hover !== "#333333" && $color_footer_link_hover !== false ) {


    ?>
   #footer a:hover {
   	color: <?php echo $color_footer_link_hover; ?>;
   }
   <?php

   	}
   ?>
   <?php

   	$color_button_dark = get_option( 'color_button_dark' );
	$color_button_dark_hover = get_option( 'color_button_dark_hover' );


   	if ( $color_button_dark !== "#2c2c2c" && $color_button_dark !== false ) {

    ?>
   a.btndark, span.btndark a, .sociallinks a {
   	color: <?php echo $color_button_dark; ?> !important;
   	<?php if ( $color_button_dark_hover !== "#ffffff" && $color_button_dark_hover !== false ) { ?>
   	border-color: <?php echo $color_button_dark_hover; ?> !important;
   	<?php } ?>
   }
   <?php

   	}
   ?>
   <?php

   	if ( $color_button_dark_hover !== "#ffffff" && $color_button_dark_hover !== false ) {

    ?>
   a.btndark:hover, span.btndark a:hover, .sociallinks a:hover {
   	color: <?php echo $color_button_dark_hover; ?> !important;
   	<?php 	if ( $color_button_dark !== "#2c2c2c" && $color_button_dark !== false ) { ?>
   	border-color: <?php echo $color_button_dark; ?> !important;
   	<?php } ?>
   }
   <?php

   	}
   ?>
   <?php

   	$color_dark_bg_text = get_option( 'color_dark_bg_text' );

   	if ( $color_dark_bg_text !== "#ffffff" && $color_dark_bg_text !== false ) {

    ?>
   #blog .col *, .blog-panel .col * {
   	color: <?php echo $color_dark_bg_text; ?>;
   }
   #blog h2::before,#blog h2::after,
   .blog-panel h2::before,.blog-panel h2::after
   {
   	background-color: <?php echo $color_dark_bg_text; ?>;
   }
   <?php

   	}
   ?>
   <?php

   	$color_blog_panel_link = get_option( 'color_blog_panel_link' );

   	if ( $color_blog_panel_link !== "#ffffff" && $color_blog_panel_link !== false ) {

    ?>

   .view h3 a, .view h3 .fa {
   	color: <?php echo $color_blog_panel_link; ?>;
   }
   <?php

   	}
   ?>
   <?php

   	$color_blog_panel_link_hover = get_option( 'color_blog_panel_link_hover' );

   	if ( $color_blog_panel_link_hover !== "#fccc20" && $color_blog_panel_link_hover !== false ) {

    ?>
   .view:hover h3 a, .view:hover a.itemcontent, .view:hover.format-link .itemcontent a, .view:hover.format-quote .itemcontent blockquote p, .view:hover.format-status .itemcontent blockquote p, .view:hover h3 .fa {
   	color: <?php echo $color_blog_panel_link_hover; ?> !important;
   }

   .owl-theme .owl-controls .owl-page span {
	background-color: <?php echo $color_blog_panel_link_hover; ?> !important;
   }
   <?php

   	}
   ?>
   <?php

   	$color_menu_icon = get_option( 'color_menu_icon' );

   	if ( $color_menu_icon !== "#ffffff" && $color_menu_icon !== false ) {

    ?>
   #navtrigger span, #navtrigger:hover span.top,#navtrigger:hover span.bottom {
   	background-color: <?php echo $color_menu_icon; ?>;
   }
   <?php

   	}
   ?>
   <?php

   	$color_menu_icon_hover = get_option( 'color_menu_icon_hover' );

   	if ( $color_menu_icon_hover !== "#fccc20" && $color_menu_icon_hover !== false ) {

    ?>

   #navtrigger:hover span {
   	background-color: <?php echo $color_menu_icon_hover; ?>;
   }
   <?php

   	}
   ?>

   <?php
		$formatstatus_font_color = get_option( 'formatstatus_font_color' );

		if ( $formatstatus_font_color !== "#ffffff" && $formatstatus_font_color !== false ) {
	?>
	.format-quote a.itemcontent blockquote p, .format-status a.itemcontent p {
	color: <?php echo $formatstatus_font_color ?>;
	}
	.format-quote a.itemcontent .fa, .format-status a.itemcontent .fa {
	color: <?php echo $formatstatus_font_color ?>;
	}
	<?php
		}
	?>

	<?php
		$formatstatus_font_color_hover = get_option( 'formatstatus_font_color_hover' );

		if ( $formatstatus_font_color_hover !== "#fccc20" && $formatstatus_font_color_hover !== false ) {
	?>
	.view:hover.format-quote a.itemcontent blockquote p, .view:hover.format-status a.itemcontent p {
	color: <?php echo $formatstatus_font_color_hover ?> !important;
	}
	.view:hover.format-quote a.itemcontent .fa, .view:hover.format-status a.itemcontent .fa {
	color: <?php echo $formatstatus_font_color_hover ?> !important;
	}
	<?php
		}
	?>

	<?php
	$formatlink_font_color = get_option( 'formatlink_font_color' );

	if ( $formatlink_font_color !== "#ffffff" && $formatlink_font_color !== false ) {
	?>
	.format-link .itemcontent a {
	color: <?php echo $formatlink_font_color ?>;
	}
	.format-link .itemcontent .fa {
	color: <?php echo $formatlink_font_color ?>;
	}
	<?php
		}
	?>

	<?php
	$formatlink_font_color_hover = get_option( 'formatlink_font_color_hover' );

	if ( $formatlink_font_color_hover !== "#fccc20" && $formatlink_font_color_hover !== false ) {
	?>
	.view:hover.format-link .itemcontent a {
	color: <?php echo $formatlink_font_color_hover ?> !important;
	}
	.view:hover.format-link .itemcontent .fa {
	color: <?php echo $formatlink_font_color_hover ?> !important;
	}
	<?php
		}
	?>

   <?php // BACKGROUND COLORS //

   $border_color = get_option( 'border_color' );

   	if ( $border_color !== "#ffffff" && $border_color !== false ) {

    ?>

   #tborder,#bborder,#lborder,#rborder {
   	background: <?php echo $border_color; ?>;
   }
   <?php

   	}
   ?>
   <?php

   $bg_color_header = get_option( 'bg_color_header' );

   	if ( $bg_color_header !== "#333333" && $bg_color_header !== false ) {

    ?>
   .articleheader {
   	background-color: <?php echo $bg_color_header; ?>;
   }

   <?php

   	}
   ?>

   <?php

   $bg_footer = get_option( 'bg_footer' );

   	if ( $bg_footer !== "#fccc20" && $bg_footer !== false ) {

    ?>
   #footer{
   	background: <?php echo $bg_footer; ?>;
   }
   #footer::before {
   	border-bottom: 20px solid <?php echo $bg_footer; ?>;
   }
   <?php

   	}
   ?>
   <?php

   $bg_overlay = get_option( 'bg_overlay' );

   	if ( $bg_overlay !== "#2c2c2c" && $bg_overlay !== false ) {

    ?>
   #menuoverlay{
   	background: <?php echo $bg_overlay; ?>;
   }

   <?php

   	}
   ?>
   <?php

   $bg_dark = get_option( 'bg_dark' );

   	if ( $bg_dark !== "#2c2c2c" && $bg_dark !== false ) {

    ?>
   #blog, .blog-panel, #comments {
   	background: <?php echo $bg_dark; ?>;
   }
   #blog::before, .blog-panel::before {
   	border-bottom: 20px solid <?php echo $bg_dark; ?>;
   }
   <?php

   	}
   ?>
   <?php

   $bg_light = get_option( 'bg_light' );

   	if ( $bg_light !== "#f2f2f2" && $bg_light !== false ) {

    ?>
   #about, .about-panel, body {
   	background-color: <?php echo $bg_light; ?> !important;
   }
   #about::before, .about-panel::before, .triangletop::before {
   	border-bottom: 20px solid <?php echo $bg_light; ?> !important;
   }
   <?php
   	}
   ?>

   	<?php
		$formatstatus_bkg_color = get_option( 'formatstatus_bkg_color' );

		if ( $formatstatus_bkg_color !== "#383430" && $formatstatus_bkg_color !== false ) {
	?>
	.view.format-status, .view.format-quote {
	background-color: <?php echo $formatstatus_bkg_color ?> !important;
	}
	<?php
		}
	?>

	<?php
	$formatlink_bkg_color = get_option( 'formatlink_bkg_color' );

	if ( $formatlink_bkg_color !== "#383430" && $formatlink_bkg_color !== false ) {
	?>
	.view.format-link {
	background-color: <?php echo $formatlink_bkg_color ?> !important;
	}
	<?php
		}
	?>

    <?php // FONTS //

     $font_main = get_option( 'font_main' );

    if ( $font_main !== "PT Serif" && $font_main !== false ) {

     ?>
        body,ul,ol,dl,td,th,caption,pre,p,blockquote,input,textarea,label {
        	font-family: <?php echo $font_main; ?>;
        }

    <?php } ?>
    <?php $font_headings = get_option( 'font_headings' );

    if ( $font_headings !== "Oswald" && $font_headings !== false ) {

     ?>
        h1,h2,h3,h4,h5,h6,
        .blog-title, .meta,
        a.btn,
        span.btn a,
        #container .form-submit input,
        a.up,
        .stats span,
        input[type="submit"],
        table th,
        .comment-author-name,
        #wp-calendar caption, .view.format-link .itemcontent a, .view.format-quote .itemcontent blockquote p, .view.format-status .itemcontent p {
        	font-family: <?php echo $font_headings; ?>;
        }
    <?php } ?>
    <?php $font_advanced_service_main = get_option( 'font_advanced_service_main' );

    if ( $font_advanced_service_main && $font_advanced_service_main !== false ) {

     ?>
       body,ul,ol,dl,td,th,caption,pre,p,blockquote,input,textarea,label {
        	font-family: <?php echo $font_advanced_service_main; ?>;
        	font-weight: <?php echo get_option( 'font_advanced_service_main_weight' ); ?>;
        	<?php
        	$font_advanced_service_main_oblique = get_option( 'font_advanced_service_main_oblique' );

        	if ( $font_advanced_service_main_oblique ) {

        	?>
        	font-style: oblique;
        	<?php } ?>
        }
    <?php } ?>

    <?php $font_advanced_service_headings = get_option( 'font_advanced_service_headings' );

    if ( $font_advanced_service_headings && $font_advanced_service_headings !== false ) {

     ?>
        h1,h2,h3,h4,h5,h6,
        .blog-title, .meta,
        a.btn,
        span.btn a,
        #container .form-submit input,
        a.up,
        .stats span,
        input[type="submit"],
        table th,.view.format-link .itemcontent a, .view.format-quote .itemcontent blockquote p, .view.format-status .itemcontent p {
        	font-family: <?php echo $font_advanced_service_headings; ?>;
        	font-weight: <?php echo get_option( 'font_advanced_service_heading_weight' ); ?>;
        	<?php
        	$font_advanced_service_heading_oblique = get_option( 'font_advanced_service_heading_oblique' );

        	if ( $font_advanced_service_heading_oblique ) {

        	?>
        	font-style: oblique;
        	<?php } else { ?>
        	font-style: normal;
        	<?php } ?>
        }
    <?php } ?>
    <?php if( get_option( 'font_uppercase' , '1' ) === '1' ) {
    ?>
    h1, .blog-title, h2.title, .meta .tags, #wp-calendar tfoot #next, #wp-calendar tfoot #prev a, a.btn, span.btn a,#container .form-submit input, a.up, .view h3, input[type="submit"], .tagcloud a, .view.postlink, .view.format-link .itemcontent a, .view.format-quote .itemcontent blockquote p, .view.format-status .itemcontent p, .sidebar .widget h3 {
    	text-transform: uppercase;
    }
    <?php } ?>
    <?php $body_background_tile_image = get_option( 'body_background_tile_image' );

    if ( $body_background_tile_image !== "" && $body_background_tile_image !== false ) {

     ?>
        body {
        	background-image: url(<?php echo $body_background_tile_image; ?>);
        }

    <?php } ?>
    <?php $body_background_cover_image = get_option( 'body_background_cover_image' );

    if ( $body_background_cover_image !== "" && $body_background_cover_image !== false ) {

     ?>
        body {
        	background-image: url(<?php echo $body_background_cover_image; ?>);
        	background-position: center center;
        	background-size: cover;
        }

    <?php } ?>

    <?php

		$mobileHeight = get_option( 'header_mobile_height', '270px' );
		$tabletHeight = get_option( 'header_tablet_height', '350px' );
		$desktopHeight = get_option( 'header_desktop_height', '500px' );

	if ( $mobileHeight !== "270px" && $mobileHeight !== false  ) { ?>

	@media only screen and (max-width: 40em) { /* 768px */

		.articleheader {
			height: <?php echo $mobileHeight; ?>;
		}

	}

	<?php }

	if ( $tabletHeight !== "350px" && $tabletHeight !== false  ) { ?>

		@media only screen and (min-width: 40em) { /* 768px */

			.articleheader {
				height: <?php echo $tabletHeight; ?>;
			}

		}

	<?php }

	if ( $desktopHeight !== "500px" && $desktopHeight !== false  ) { ?>

		@media only screen and (min-width: 60em) { /* 960px */

			.articleheader {
				height: <?php echo $desktopHeight; ?>;
			}

		}

	<?php } ?>


    <?php // CUSTOM CSS //
    echo get_option( 'custom_css', '' );
    ?>
    </style>
    <?php
}
add_action( 'wp_head', 'wearesupa_customizer_css' );

?>
