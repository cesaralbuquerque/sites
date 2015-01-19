


<div id="blog" class="blog-panel row">



       	<div class="col span3of3">

       			<?php if ( !is_archive() && !is_author() && !is_search() ) { ?>

	            <h2 class="title"><?php echo get_option( 'text_blog_section_title' , 'My Adventures' ); ?></h2>

	            <?php } ?>

	            <?php
		             // If this is an archive
		             if ( is_archive() ) { ?>

		            <?php if ( have_posts() ) { ?>
		            <h2 class=" title searching" name="categoria">
		            	<?php if ( is_day() ) { ?>
		            			<?php printf( __( "%s" , "wearesupa" ), get_the_date() ); ?>
		            	<?php } elseif ( is_month() ) { ?>
		            			<?php printf( __( "%s" , "wearesupa" ), get_the_date('F Y') ); ?>
		            	<?php } elseif ( is_year() ) { ?>
		            			<?php printf( __( "%s" , "wearesupa" ), get_the_date('Y') ); ?>
		            	<?php } else { ?>
		            			<?php echo single_cat_title(); ?>
		            	<?php }

		            	wp_reset_query(); ?></h2>
		            <?php } else { ?>
		            	<h2 class="searching"><?php printf( __( 'Nothing Found for: %s', 'wearesupa' ), '<span>' . get_search_query() . '</span>' ); ?></h2><span class="further"><?php _e( 'Sorry, but nothing matched your search criteria. Please try again with some different keywords.', 'wearesupa' ); ?></span>

		            	<?php get_search_form(); ?>
		            <?php } ?>

		        <?php } ?>


	            <?php
	            	// If this is an author archive
		            if ( is_author() ) { ?>

	            	<?php if ( have_posts() ) { ?>

		            <h2 class="title searching"><?php

		            $curauth = (get_query_var('author_name')) ? get_user_by('slug', get_query_var('author_name')) : get_userdata(get_query_var('author'));

		             echo $curauth->display_name; ?></h1>
		            <?php } else { ?>
		            	<h2 class="title searching"><?php printf( __( 'Nothing Found for: %s', 'wearesupa' ), '<span>' . get_search_query() . '</span>' ); ?></h2><span class="further"><?php _e( 'Sorry, but nothing matched your search criteria. Please try again with some different keywords.', 'wearesupa' ); ?></span>

		            	<?php get_search_form(); ?>
		            <?php } ?>

	            <?php } ?>


	            <?php
	            	// If this is a search archive
	            	if ( is_search() ) { ?>

		            <?php if ( have_posts() ) { ?>
		            <h2 class="title searching"><?php printf( __( 'Search Results for: %s', 'wearesupa' ), '<span>' . get_search_query() . '</span>' ); ?></h2>
		            <?php } else { ?>
		            	<h2 class="title"><?php printf( __( 'Nothing Found for: %s', 'wearesupa' ), '<span>' . get_search_query() . '</span>' ); ?></h2><span class="further"><?php _e( 'Sorry, but nothing matched your search criteria. Please try again with some different keywords.', 'wearesupa' ); ?></span>

		            	<?php get_search_form(); ?>
		            <?php } ?>

	            <?php } ?>


       	</div>

            <div class="col span3of3">
      		<div class="inner" id="aqui">

      		<?php
      			rewind_posts();
				

      			if ( is_front_page() ) {

      					$paged = (get_query_var('page')) ? get_query_var('page') : 1;

      				} else {

      					$paged = (get_query_var('paged')) ? get_query_var('paged') : 1;

      				}

      			if ( is_page_template('t-index.php') ) {
  					query_posts('&posts_per_page&paged=' . $paged);
      			}


/**
Teste video
*/

			//$categoria=single_cat_title("", false);

			$category = get_the_category();
			
			//VIDEOS
			if($category[0]->cat_ID == 2){
				 $wp_query = new WP_Query();
				 $my_query = new WP_Query( "cat=2" );
				   if ( $my_query->have_posts() ) {
					  ?> 
					  <div class="col span3of3">
					  <h2 class="title searching"> Videos Regi&atildeo 1 </h2></div><?php
					   while ( $my_query->have_posts() ) { 
						   $my_query->the_post();
						   if(!get_post_format()) {
								   get_template_part('post-formats/content');
								} else {
								   get_template_part('post-formats/content', get_post_format());
								}
					   }
				   }

				 $wp_query = new WP_Query();
				 $my_query = new WP_Query( "cat=2&tag=video_regiao_2" );
				   if ( $my_query->have_posts() ) {
					  ?> 
					  <div class="col span3of3">
					  <h2 class="title searching"> Videos Regi&atildeo 2 </h2></div><?php
					   while ( $my_query->have_posts() ) { 
						   $my_query->the_post();
						   if(!get_post_format()) {
								   get_template_part('post-formats/content');
							} else {
								   get_template_part('post-formats/content', get_post_format());
							}
					   }
				   }

				 $wp_query = new WP_Query();
				 $my_query = new WP_Query( "cat=2&tag=video_regiao_3" );
				   if ( $my_query->have_posts() ) {
					  ?> 
					  <div class="col span3of3">
					  <h2 class="title searching"> Videos Regi&atildeo 3 </h2></div><?php
					   while ( $my_query->have_posts() ) { 
						   $my_query->the_post();
						   if(!get_post_format()) {
								   get_template_part('post-formats/content');
								} else {
								   get_template_part('post-formats/content', get_post_format());
								}
					   }
					}

			}
			 
			 //MATERIAS
			if($category[0]->cat_ID == 3){
				$wp_query = new WP_Query();
				$my_query = new WP_Query( "cat=3&tag=materia_regiao_1" );
			   if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="col span3of3">
				  <h2 class="title searching"> Mat&eacuterias Regi&atildeo 1 </h2></div><?php
				   while ( $my_query->have_posts() ) { 
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
				}
				
				$wp_query = new WP_Query();
				$my_query = new WP_Query( "cat=3&tag=materia_regiao_2" );
				if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="col span3of3">
				  <h2 class="title searching"> Mat&eacuterias Regi&atildeo 2 </h2></div><?php
				   while ( $my_query->have_posts() ) { 
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
				}
				
				$wp_query = new WP_Query();
				$my_query = new WP_Query( "cat=3&tag=materia_regiao_3" );
				if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="col span3of3">
				  <h2 class="title searching"> Mat&eacuterias Regi&atildeo 3 </h2></div><?php
				   while ( $my_query->have_posts() ) { 
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
				}
				
			}
			
			
			
			
			
			


      			if (have_posts()) :
      			while (have_posts()) : the_post();

      			if(!get_post_format()) {
      			   get_template_part('post-formats/content');
      			} else {
      			   get_template_part('post-formats/content', get_post_format());
      			}
      			endwhile;
      			endif;
      		?>

      			<div class="blog-load load-panel"></div>


      	<?php

      		// get older/newer pagination

      		get_template_part('_part', 'nav-archive');


      	?>

      	     </div><!-- /inner -->
            </div>
</div> <!-- / blog -->


<?php wp_reset_query(); ?>
