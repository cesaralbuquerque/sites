<style type="text/css">
<?php

	$main_query = new WP_Query( array ( 'post_type' => 'wearesupa-homepage', 'posts_per_page' => '99' ) );	
		
	while ( $main_query->have_posts() ) : $main_query->the_post();
		
			// Get the right layout and load corresponding template part
			$choose_layout = get_post_meta( get_the_ID(), '_wearesupa_choose_layout', true );

	   		if ( $choose_layout === "blog" ) {
	   		
	   			get_template_part( '_part', 'blog-panel-head' );
	   		
	   		}
	   		
	   		if ( $choose_layout === "about" ) {
	   		
		   			get_template_part( '_part', 'about-panel-head' );
		   		
		   		}
		   		
		   		if ( $choose_layout === "stats" ) {
		   		
	   				get_template_part( '_part', 'stats-panel-head' );
	   			
	   			}
	   			
	   			if ( $choose_layout === "gallery" ) {
		   		
	   				get_template_part( '_part', 'gallery-panel-head' );
	   			
	   			}
	   		
	
	
		endwhile;
?>
</style>