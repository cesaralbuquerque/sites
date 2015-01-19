<?php

$bg_color_blog = get_post_meta( get_the_ID(), '_wearesupa_bg_color_blog', true );
$color_blog_title = get_post_meta( get_the_ID(), '_wearesupa_text_color_blog_title', true );
$color_blog = get_post_meta( get_the_ID(), '_wearesupa_text_color_blog', true );
$category_blog = get_post_meta( get_the_ID(), '_wearesupa_cat_select', true );


// More button link
$more_button = get_post_meta( get_the_ID(), '_wearesupa_more_button', true );
$more_button_link = get_post_meta( get_the_ID(), '_wearesupa_more_button_link', true );

 ?>

<!-- Blog Panel -->
    <div class="blog-panel row" id="panel-<?php the_ID(); ?>">


		<div class="inner">
			<div class="col span3of3">

			<?php
				// Get Custom Meta
				// posts per page
				$ppp = get_post_meta( get_the_ID(), '_wearesupa_blog_volume', true );


				// blog title
				$blog_title = get_post_meta( get_the_ID(), '_wearesupa_text_blog_title', true );

				// blog description (Apply filters the_content keeps paragraphs etc. in tact)
				$blog_description = apply_filters('the_content', get_post_meta( get_the_ID(), '_wearesupa_text_blog_description', true));


				if ( $blog_title ) { ?>

					<h2 class="title"><?php echo $blog_title; ?></h2>

				<?php }

				if ( $blog_description ) { ?>

					<div><?php echo $blog_description; ?></div>

				<?php } ?>

			</div>

	        <div class="articlelist">
		<?php

			$temp = $wp_query;  // re-sets query
			$wp_query = null;   // re-sets query
			$args = array( 'category__in' => $category_blog, 'posts_per_page' => $ppp );
			$wp_query = new WP_Query();
			$wp_query->query( $args );


			while ( $wp_query->have_posts() ) : $wp_query->the_post();

				if(!get_post_format()) {
				   get_template_part('post-formats/content', 'standard');

				} else {
				   get_template_part('post-formats/content', get_post_format());
				}

			endwhile;
		?>
            </div>	

	<?php


	   $wp_query = null;
	   $wp_query = $temp; // Reset

		wp_reset_postdata();


	?>


	<?php


	if ( $more_button && $more_button_link ) { ?>

		<a href="<?php echo $more_button_link; ?>" class="btn clear" title="<?php echo $more_button; ?>"><?php echo $more_button; ?></a>

	<?php } ?>

	</div><!-- /inner -->
</div> <!-- / blog -->
