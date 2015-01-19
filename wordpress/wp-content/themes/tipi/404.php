<?php get_header(); ?>
		
		<!-- ==============================================
		Cover
		=============================================== -->
		<div id="cover">
		    <div class="inner">
		        <div class="col span3of3">
		            <div id="logo">
		            	
		            	<?php
		            	
		            	// Get a logo if there is one from theme options
		            	$logo = get_option( 'wearesupa_logo_image' );
		            	$logo_retina = get_option( 'wearesupa_logo_image_retina' );
		            	
		            	if ( $logo ) { ?>
		            	  <a href="<?php echo get_home_url(); ?>/" title="<?php echo get_option( 'text_logo_title' , 'Go to Home' ); ?>"><img id="site-logo" src="<?php echo $logo; ?>" alt="<?php echo get_option( 'text_logo_alt' , 'Logo' ); ?>" <?php if ($logo_retina) { echo ' data-fullsrc="' . $logo_retina . '"'; } ?> /></a>
		            	<?php } // end if ?>
		            	
		            	
		            	
		            	<?php
		            	
		            	// Hide the site title based on theme options
		            	
		            	if( !get_option( 'hide_logo_text' , '0' ) ) { ?>
		            	
		            		<div class="blog-title"><a href="<?php echo get_home_url(); ?>/" title="<?php _e('Go to Home', 'wearesupa'); ?>">
		            		<?php
		            		// Check theme options to push logo text or logo image in
		            		?>
		            		<?php bloginfo('name'); ?>								
		            		
		            		</a></div>
		            		
		            	<?php } ?>	
		            	
		            	
		            	<?php
		            	// Check theme options for whether to show tagline
		            	
		            	if( !get_option( 'hide_tagline', '1' ) ) { ?>
		            	
		            		<div class="blog-tagline"><?php bloginfo('description'); ?></div>
		            		
		            		
		            		<?php } ?>
		            	
		            	
		            </div>
		
		            <h1><?php _e( '<span>Oh No!</span> A 404 Page' , 'wearesupa' ); ?></h1>
		
		            <p><?php _e( 'Click on the menu link top right' , 'wearesupa' ); ?></p>
		        </div>
		    </div>
		</div>
		<!--/ Cover -->
	
<?php get_footer();  ?>