<?php

$bg_color_stats = get_post_meta( get_the_ID(), '_wearesupa_bg_color_stats', true );
$color_stats_title = get_post_meta( get_the_ID(), '_wearesupa_text_color_stats_title', true );
$color_stats = get_post_meta( get_the_ID(), '_wearesupa_text_color_stats', true );


if ( $bg_color_stats || $color_stats_title || $color_stats || has_post_thumbnail() ) {

 ?>
 
<?php 
if ( $bg_color_stats ) { ?>
	#panel-<?php the_ID(); ?>.stats-panel { 
		background-color: <?php echo $bg_color_stats; ?>; 
	}	
	#panel-<?php the_ID(); ?>.stats-panel::before {
		border-bottom: 20px solid <?php echo $bg_color_stats; ?>; 
	}	
<?php }
if ( $color_stats ) { ?>	
	#panel-<?php the_ID(); ?>#stats .col,
	#panel-<?php the_ID(); ?>.stats-panel .col,
	#panel-<?php the_ID(); ?>.stats-panel,
	#panel-<?php the_ID(); ?>.stats-panel .col h2
	{
		color: <?php echo $color_stats; ?>;
	}
<?php }
if ( $color_stats_title ) { ?>	
	#panel-<?php the_ID(); ?>.stats-panel h2,
	#panel-<?php the_ID(); ?>.stats-panel .col h2 {
		color: <?php echo $color_stats_title; ?>;
	}
	#panel-<?php the_ID(); ?>#stats h2::before,#panel-<?php the_ID(); ?>#stats h2::after,
	#panel-<?php the_ID(); ?>.stats-panel h2::before,#panel-<?php the_ID(); ?>.stats-panel h2::after
	{
		background-color: <?php echo $color_stats_title; ?>;
	}
<?php } ?>
<?php if ( has_post_thumbnail() ) { 
	
		$get_image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'wide' );
	
	?>
	#panel-<?php the_ID(); ?>.stats-panel {
		background-image: url(<?php echo $get_image[0]; ?>);
	}
	
<?php } ?>
<?php } ?>