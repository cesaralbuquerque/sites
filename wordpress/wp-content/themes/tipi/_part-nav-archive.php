<?php if ( $wp_query->max_num_pages > 1 ) { ?>
	<!-- Pagination -->
	<div id="pagination">
		<div class="inner">
			<div class="col span3of3 clearfix">
				<span class="btn left prev"><?php previous_posts_link( __( 'Prev', 'wearesupa' ) ); ?></span>
				<span class="btn right next"><?php next_posts_link( __( 'Next', 'wearesupa' ) ); ?></span>
			</div>
		</div>
	</div>
	<!--/ Pagination -->

	<a href="" class="btn load clear"><?php _e( 'Load More' , 'wearesupa' ); ?></a>
<?php } ?>
