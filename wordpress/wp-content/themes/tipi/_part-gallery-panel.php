<?php
     // Get the attachments, grab the cropped image URL and the full image URL (which is needed for the swipebox plugin)
     $gallery_images = get_post_meta( get_the_ID(), '_wearesupa_gallery_images', true ); ?>
     <?php if ( ! empty( $gallery_images ) ) { ?>
			
             <div class="gallery-panel clearfix" id="panel-<?php the_ID(); ?>">
                 	<ul>
             <?php foreach ( $gallery_images as $gallery_image ) : 
             
             	$image_url = wp_get_attachment_image_src( $gallery_image, 'blog_square' );
             	$image_full_url = wp_get_attachment_image_src( $gallery_image, 'wide' );
             	
             	$attachment_meta = wp_get_attachment($gallery_image);
             	
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
         <!-- /Gallery -->
     <?php } ?>
