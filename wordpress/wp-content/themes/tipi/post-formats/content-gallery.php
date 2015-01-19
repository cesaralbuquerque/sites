<?php

// Use archive based content for the loop

if ( !is_single() ) {

	// Set up post class

	$postClass = "view post format-gallery";

	// If no featured image add no-image class

	if ( !has_post_thumbnail() ) {

		$postClass = "view post format-gallery no-image";

	 }

 ?>


<div class="item">

	<section <?php post_class($postClass); ?> id="post-<?php the_ID(); ?>">
			<a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"><?php get_template_part( '_part', 'gallery' ); ?></a>
			<script>

				jQuery(document).ready(function() {
				jQuery('.post-<?php the_ID(); ?> .owl-carousel').owlCarousel({
					autoPlay: 5000,
					items : 1,
					stopOnHover : true,
					singleItem : true
				});

				});
			</script>
	</section>

</div>

<?php } ?>

<?php

// Single Post layout

if ( is_single() ) {

// Set up post class
	$layout = get_post_meta( get_the_ID(), '_wearesupa_select_layout', true );

	$postClass = "row triangletop post clearfix $layout";

	// If no featured image add no-image class

	if ( !has_post_thumbnail() ) {

		$postClass = "row triangletop post no-image clearfix $layout";

	}
?>

<!-- Article -->
<article <?php post_class($postClass); ?>>

	<!-- Article Header -->
	<header>
		<h1 class="title entry-title post-title"><?php the_title(); ?></h1>

		<?php get_template_part( '_part' , 'meta-top' ); ?>
	</header>
	<!--/ Article Header -->


	<!-- Article content -->
	<section class="articlecontent textleft">

		<?php get_template_part( '_part', 'gallery' ); ?>
		<?php the_content(); ?>
		<?php wp_link_pages( array( 'before' => '<nav class="pagination">' . __( '<span>Pages:</span>', 'wearesupa' ), 'after' => '</nav>' ) ); ?>

		<script>

			jQuery(document).ready(function() {
			jQuery('.post-<?php the_ID(); ?> .owl-carousel').owlCarousel({
				autoPlay: 5000,
				items : 1,
				stopOnHover : true,
				singleItem : true,
				autoHeight : true
			});

			});
		</script>
	</section>


	<?php if (
		( $layout == 'contentright' ) ||
		( $layout == 'contentleft' ) )
		{
	?>
	<aside class="sidebar">
		<?php
		// Load widgets
		if (!function_exists('dynamic_sidebar') || !dynamic_sidebar('Blog Article Sidebar')) {
		} ?>
	</aside>
	<?php } ?>

</article>
<?php } ?>
