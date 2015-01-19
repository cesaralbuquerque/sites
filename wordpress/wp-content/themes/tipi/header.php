<!doctype html>
<html class="no-js<?php page_bodyclass(); ?>" <?php language_attributes(); ?>>
<head>
	<title><?php
	if ( defined('WPSEO_VERSION') ) {
		
	 wp_title('');
	 
	 } else {
	 
	 	 if ( is_home() || is_front_page() ) { echo bloginfo('name'); ?> | <?php echo bloginfo('description'); } else { wp_title('| ', true, 'right'); echo bloginfo('name'); }
	 
	 }
	  ?></title>
	<meta charset="<?php bloginfo( 'charset' ); ?>" />
	<link rel="profile" href="http://gmpg.org/xfn/11" />
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<?php wp_head(); ?>
</head>
<?php

	// Global variables for background images
	$backgroundOn = get_option( 'wearesupa_background_image'); 	
	$header_image = get_option( 'header_image' );
	$error_image = get_option( 'error_image' );
	
	// If featured image exists on a PAGE or SINGLE, replace header_image variable
	if ( is_page() || is_single() ) {
	
		if ( has_post_thumbnail() ) {
			$header_image_thumbnail = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'default' ); 
			$header_image = $header_image_thumbnail[0]; 
		}
	
	}

 ?>
<body <?php body_class(); ?> id="top" <?php if ( is_404() ) { if ($error_image) { ?>style="background-image: url(<?php echo $error_image; ?>)"<?php } } ?>>      
<div id="container">
	<?php 
	
	// load preloader on just the homepage template
	if ( is_page_template( 't-homepage.php' ) ) { ?>
	
		<!-- ==============================================
				Preloader
				=============================================== -->
				<div id="preloader">
				    <div id="loading-animation"><i class="fa fa-spinner fa-spin fa-3x"></i></div>
				</div>
				<!--/ Preloader -->
	
	<?php } ?>
	<!-- ==============================================
	Menu Overlay
	=============================================== -->
	<div id="navtrigger"><span class="top"></span><span class="middle"></span><span class="middlecopy"></span><span class="bottom"></span></div>
	<div id="menuoverlay">
		<div class="menuoverlayinner">
		
			<div class="widget col span1of4">
				<?php 
					// Check for Menu text
					$text_menu = get_option( 'text_menu' , 'Menu' );
					if ($text_menu) {
				 ?>
				<h3><?php echo $text_menu; ?></h3>
				<?php } ?>
				<?php wp_nav_menu( array( 'theme_location' => 'primary', 'container' => false, 'menu_id' => false, 'menu_class' => false ) ); ?>
			</div>
			<?php
			
				// Load widgets
			
				if (!function_exists('dynamic_sidebar') || !dynamic_sidebar('Overlay Widget Area (Global)')) {  
				
				} ?>
				<!-- Contact -->
				<div  id="contact" class="row">
					<div class="col span3of3">
						<?php echo get_option( 'overlay_contact' , '<i class="fa fa-envelope-o"></i><a href="mailto:hello@wearesupa.com" title="Email me">you@youremail.com</a> | 07775 123456' ); ?>
					</div>
				</div>
				<!--/ Contact -->
			
		</div>
	</div>
	<!--/ Menu Overlay -->

<?php if ( !is_page_template( 't-homepage.php' ) ) { ?>
<!-- ==============================================
Main Content
=============================================== -->
<div id="contentwrap">
	
	
	<?php if ( !is_404() ) { ?>
	
	<div class="articleheader"<?php if ( $header_image !== "" && $header_image !== false ) { ?> style="background-image: url(<?php echo $header_image; ?>);"<?php } ?>>
		<div id="novaDivSemitransparente" style="height: inherit; background-color: rgba(221, 239, 201, 0.8);">
		<?php get_template_part( '_part' , 'logo' ); ?>
		</div>
	</div>

<?php } ?>

<?php } // End Homepage IF ?>		       