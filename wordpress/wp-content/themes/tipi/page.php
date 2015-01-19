<?php get_header(); ?>
<?php if ( have_posts() ) while ( have_posts() ) : the_post(); ?>


	<div class="inner">
	
		<?php 
		       get_template_part( '_part' , 'content-page' );
		 ?>
	
	</div><!--/ inner -->
	

<?php endwhile; ?>
<?php get_footer(); ?>