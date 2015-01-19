<?php get_header(); ?>
<?php if ( have_posts() ) while ( have_posts() ) : the_post(); ?>



	<div class="inner">

    <?php
    // decide on post format and load it if you find it

        if(!get_post_format()) {
           get_template_part('post-formats/content', 'standard');
        } else {
           get_template_part('post-formats/content', get_post_format());
        }

     ?>
<?php endwhile; ?>


	<?php

	 if ( get_the_author_meta( 'description' ) ) { // If a user has filled out their description, show a bio on their entries  ?>


	<div class="author-wrap clear">
		<span class="author-avatar"><?php echo get_avatar( get_the_author_meta( 'ID' ), 150 ); ?></span>
		<div class="author-bio">
	        <h6><?php _e('Posted by' , 'wearesupa'); ?> <a href="<?php echo get_author_posts_url(get_the_author_meta( 'ID' )); ?>"><?php the_author_meta('display_name'); ?></a></h6>
	        <p><?php the_author_meta( 'description' ); ?></p>
	    </div>
	</div>

	<?php } ?>


	</div><!--/ inner -->



<?php get_template_part('_part', 'social-share'); ?>

<?php

	// Load comments template
	comments_template();

?>


<?php get_template_part('_part', 'nav-prev-next'); ?>
<?php get_footer(); ?>
