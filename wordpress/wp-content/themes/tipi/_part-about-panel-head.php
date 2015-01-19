<?php

$bg_color_about = get_post_meta( get_the_ID(), '_wearesupa_bg_color_about', true );
$color_about_title = get_post_meta( get_the_ID(), '_wearesupa_text_color_about_title', true );
$color_about = get_post_meta( get_the_ID(), '_wearesupa_text_color_about', true );


if ( $bg_color_about || $color_about_title || $color_about || has_post_thumbnail() ) {

 ?>
<?php 
if ( $bg_color_about ) { ?>
	#panel-<?php the_ID(); ?>.about-panel { 
		background-color: <?php echo $bg_color_about; ?>; 
	}	
	#panel-<?php the_ID(); ?>.about-panel::before {
		border-bottom: 20px solid <?php echo $bg_color_about; ?>; 
	}
<?php }
if ( $color_about ) { ?>	
	#panel-<?php the_ID(); ?>#about .col,
	#panel-<?php the_ID(); ?>.about-panel .col,
	#panel-<?php the_ID(); ?>.about-panel,
	#panel-<?php the_ID(); ?>.about-panel .col h2
	{
		color: <?php echo $color_about; ?>;
	}
<?php }
if ( $color_about_title ) { ?>	
	#panel-<?php the_ID(); ?>.about-panel h2,
	#panel-<?php the_ID(); ?>.about-panel .col h2 {
		color: <?php echo $color_about_title; ?>;
	}
	#panel-<?php the_ID(); ?>#about h2::before,#panel-<?php the_ID(); ?>#about h2::after,
	#panel-<?php the_ID(); ?>.about-panel h2::before,#panel-<?php the_ID(); ?>.about-panel h2::after
	{
		background-color: <?php echo $color_about_title; ?>;
	}
<?php } ?>

	<?php if ( has_post_thumbnail() ) { 
	
		$get_image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'wide' );
	
	?>
	#panel-<?php the_ID(); ?>.about-panel { 	
		background-image: url(<?php echo $get_image[0]; ?>);
	}
	#panel-<?php the_ID(); ?>.about-panel::before {
		border-bottom: none !important; 
	}	

<?php } ?>
<?php } ?>