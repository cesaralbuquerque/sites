<?php
$about_gallery = get_post_meta( get_the_ID(), '_wearesupa_about_gallery', true );
?>
<div class="about-panel row <?php if ( $about_gallery === "on" ) { echo 'nopaddingbtm'; } ?>" id="panel-<?php the_ID(); ?>">
		    	<!-- About Intro -->
		        <div class="inner clearfix">
		        
		        		<?php
		        			// Get Custom Meta
		        			
		        			// about title
		        			$about_title = get_post_meta( get_the_ID(), '_wearesupa_text_about_title', true );
		        			
		        			// about content (Apply filters the_content keeps paragraphs etc. in tact)
		        			$about_content = apply_filters('the_content', get_post_meta( get_the_ID(), '_wearesupa_text_about_content', true));
		        			
		        			
		        			if ( $about_title ) { ?>
		        			
		        				<h2 class="title"><?php echo $about_title; ?></h2>
		        				
		        				<div class="clear"></div>
		        			
		        			<?php }
		        			
		        			if ( $about_content ) { ?>
		        			
		        				<div><?php echo $about_content; ?></div>
		        			
		        			<?php } ?>
		                
		        </div>
		        <!--/ About Intro -->
		        
		        
		     <?php
		     if ( $about_gallery === "on" ) {
		     
		     // Get the attachments, grab the cropped image URL and the full image URL (which is needed for the swipebox plugin)
		     $about_images = get_post_meta( get_the_ID(), '_wearesupa_about_images', true ); ?>
		     <?php if ( ! empty( $about_images ) ) { ?>
		         <div class="clearfix">
		             <div class="gallery-panel">
		                 <ul>
		             <?php foreach ( $about_images as $about_image ) : 
		             
		             	$image_url = wp_get_attachment_image_src( $about_image, 'blog_square' );
		             	$image_full_url = wp_get_attachment_image_src( $about_image, 'wide' );
		             	
		             	$attachment_meta = wp_get_attachment($about_image);
		             	
		             	// Grab an alt tag, if there isn't one fallback to the title
		             	
		             	$alt = $attachment_meta['alt'];
		             	if ( !$alt ) {
		             		$alt = $attachment_meta['title'];
		             	}	
		             	
		             	$the_title = get_the_title();
		             	
		             ?>
		                 	<li class="item"><section class="view"><a class="btn animated swipebox" href="<?php echo $image_full_url[0]; ?>" title="<?php _e( 'View' , 'wearesupa' ); ?>"><?php _e( 'View' , 'wearesupa' ); ?></a><img src="<?php echo $image_url[0]; ?>" alt="<?php echo $alt; ?>" /></section></li>
		             <?php endforeach; ?>
		        		 </ul>
		             </div>
		         </div>
		         <!-- /Gallery -->
		     <?php } 
			     }
		     ?>
		    </div>