<?php

// Use archive based content for the loop

if ( !is_single() ) {

	// Set up post class

	$postClass = "view post";

	// If no featured image add no-image class

	if ( !has_post_thumbnail() ) {

		$postClass = "view post no-image";

	 }

 ?>


<div class="item">

	<section <?php post_class($postClass); ?> id="post-<?php the_ID(); ?>">
		<a href="<?php the_permalink(); ?>" class="itemcontent" title="<?php the_title(); ?>">
			<i class="fa fa-comment"></i>
			<?php the_content(); ?>
		</a>
		<?php if ( has_post_thumbnail() ) { ?><a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"> <?php get_template_part( '_part', 'featured-image' ); ?></a> <?php } ?>

		<?php get_template_part( '_part', 'meta-archive' ); ?>
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
	<section class="articlecontent largetext">

		<?php the_content(); ?>
		<?php wp_link_pages( array( 'before' => '<nav class="pagination">' . __( '<span>Pages:</span>', 'wearesupa' ), 'after' => '</nav>' ) ); ?>

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
