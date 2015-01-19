<div id="logo">

	<div class="blog-title">
	
		<a href="<?php echo get_home_url(); ?>/" title="<?php echo get_option( 'text_logo_title' , 'Go to Home' ); ?>">
	
	<?php
	
	// Get a logo if there is one from theme options
	$logo = get_option( 'wearesupa_logo_image' );
	$logo_retina = get_option( 'wearesupa_logo_image_retina' );
	
	if ( $logo ) { ?>
		<div class="logo">
	  <img id="site-logo" src="<?php echo $logo; ?>" alt="<?php echo get_option( 'text_logo_alt' , 'Logo' ); ?>" <?php if ($logo_retina) { echo ' data-fullsrc="' . $logo_retina . '"'; } ?> /></div>
	<?php } // end if ?>
	
	
	
	<?php
	
	// Hide the site title based on theme options
	
	if( !get_option( 'hide_logo_text' , '0' ) ) { ?>
	
		
		<?php
		// Check theme options to push logo text or logo image in
		?>
		<?php bloginfo('name'); ?>								
		
		
		
	<?php } ?>	
	
		</a>
	</div>
	
	<?php
	// Check theme options for whether to show tagline
	
	if( !get_option( 'hide_tagline', '1' ) ) { ?>
	
		<div class="blog-tagline"><?php bloginfo('description'); ?></div>
		
		
		<?php } ?>
	
	
</div>