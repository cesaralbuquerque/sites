<div class="flexslider">
		<ul class="slides">
	     
	
	<?php 
	// strip attachments and add into gallery rotator
			
			$args = array(
			    'orderby' => 'menu_order',
			    'post_type' => 'attachment',
			    'post_parent' => $post->ID,
			    'post_mime_type' => 'image',
			    'post_status' => null,
			    'numberposts' => -1
			);
			$attachments = get_posts($args);
			if( !empty($attachments) ) {
			    $i = 0;
			    $thumbid = "";
			    $posttitle = "";
			    foreach( $attachments as $attachment ) {
			        if( $attachment->ID == $thumbid ) continue;
			        $image_single = wp_get_attachment_image_src( $attachment->ID, "blog_square" );
						
					if ( is_single() )	{
					
						$image_single = wp_get_attachment_image_src( $attachment->ID, "single" );
					
					}

			        $caption = '<p class="flex-caption">' . $attachment->post_excerpt . '</p>' ;
			        
			        if ( ( $attachment->post_excerpt == "" ) ) {
			        
			        	$caption = "";
			        
			        }
			        
			        $alt = ( !empty($attachment->post_content) ) ? $attachment->post_content : $attachment->post_title;
			        $the_title = get_the_title();
			        $the_permalink = get_permalink();
			        
			        echo "<li><img class='img-width featured-image' src='$image_single[0]' alt='$alt' /></li>";
			        
			        $i++;
			    }
			}			
					?>	
	
	</ul>
	<div class="flex-container"></div>	             
	    	
	</div><!-- /flexslider -->		
	
<script>
	jQuery(window).load(function() {
	  jQuery('.post-<?php the_ID(); ?> .flexslider').flexslider({
	    smoothHeight: true,
	    animation: "slide",
	    slideshow: false,
	    slideshowSpeed: 7000,
	    directionNav: true, 
	    controlsContainer: '.post-<?php the_ID(); ?> .flex-container',
	    <?php if ( !is_single() ) { ?>directionNav: false,<?php } ?>
	    prevText: "&larr;",
	    nextText: "&rarr;"//,
	   // start: function(){ sideBarHeight(); }
	  });
	});
</script>