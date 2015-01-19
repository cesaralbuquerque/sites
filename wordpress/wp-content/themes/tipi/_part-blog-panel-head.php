<?php

$bg_color_blog = get_post_meta( get_the_ID(), '_wearesupa_bg_color_blog', true );
$color_blog_title = get_post_meta( get_the_ID(), '_wearesupa_text_color_blog_title', true );
$color_blog = get_post_meta( get_the_ID(), '_wearesupa_text_color_blog', true );

// More button link
$more_button = get_post_meta( get_the_ID(), '_wearesupa_more_button', true );
$more_button_link = get_post_meta( get_the_ID(), '_wearesupa_more_button_link', true );


if ( $bg_color_blog || $color_blog_title || $color_blog || has_post_thumbnail() ) {

 ?>
 
<?php 
if ( $bg_color_blog ) { ?>
	#panel-<?php the_ID(); ?>.blog-panel { 
		background-color: <?php echo $bg_color_blog; ?>; 
	}
	#panel-<?php the_ID(); ?>.blog-panel::before {
		border-bottom: 20px solid <?php echo $bg_color_blog; ?>; 
	}
<?php }
if ( $color_blog ) { ?>	
	#panel-<?php the_ID(); ?>#blog .col,
	#panel-<?php the_ID(); ?>.blog-panel .col,
	#panel-<?php the_ID(); ?>.blog-panel .col h2
	{
		color: <?php echo $color_blog; ?>;
	}
<?php }
if ( $color_blog_title ) { ?>	
	#panel-<?php the_ID(); ?>.blog-panel .col h2 {
		color: <?php echo $color_blog_title; ?>;
	}
	#panel-<?php the_ID(); ?>#blog h2::before,#panel-<?php the_ID(); ?>#blog h2::after,
	#panel-<?php the_ID(); ?>.blog-panel h2::before,.blog-panel h2::after
	{
		background-color: <?php echo $color_blog_title; ?>;
	}
<?php } ?>
<?php if ( has_post_thumbnail() ) { 
	
		$get_image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'wide' );
	
	?>
	#panel-<?php the_ID(); ?>.blog-panel { 
		background-image: url(<?php echo $get_image[0]; ?>);
	}
	#panel-<?php the_ID(); ?>.blog-panel::before {
		border-bottom: none !important; 
	}	

<?php } ?>

<?php } ?>
