<?php if( !is_page() ) { ?>
<footer>
    <section class="clearfix">
    	<div class="left">
	
		<?php 
		
		// Hide comments
		
		if( false === get_option( 'hide_comments' ) ) { ?>
		
		<i class="fa fa-comments"></i><?php comments_popup_link( __( '0','wearesupa' ), __( '1','wearesupa' ), __( '%','wearesupa' ) ); ?>
		
		<?php } ?>
			
		
		</div> 
	
	
		<div class="right">
		
			<i class="fa fa-pencil"></i> 
			
			<time class="post-date updated" datetime="<?php the_time('Y-m-d', '', ''); ?>"><?php the_time(get_option('date_format')); ?></time>
		
		</div>
	
    </section>
</footer>
<?php } ?>
