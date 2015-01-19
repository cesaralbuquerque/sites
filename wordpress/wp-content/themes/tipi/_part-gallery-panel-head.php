<?php

$bg_color_gallery = get_post_meta( get_the_ID(), '_wearesupa_bg_color_gallery', true );


if ( $bg_color_gallery || has_post_thumbnail() ) {

 ?>
<?php 
if ( $bg_color_gallery ) { ?>
	#panel-<?php the_ID(); ?>.gallery-panel { 
		background-color: <?php echo $bg_color_gallery; ?>; 
	}	
<?php }

if ( has_post_thumbnail() ) { 
	
		$get_image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'wide' );
	
	?>
	#panel-<?php the_ID(); ?>.gallery-panel { 	
		background: url(<?php echo $get_image[0]; ?>) no-repeat 50% fixed;
		background-size: cover;
	}
<?php } ?>
<?php } ?>