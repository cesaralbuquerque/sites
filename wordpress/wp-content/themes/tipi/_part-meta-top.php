<div class="meta">
	<?php _e( 'Posted' , 'wearesupa' ); ?> <time class="post-date updated" datetime="<?php the_time('Y-m-d', '', ''); ?>"><?php the_time(get_option('date_format')); ?></time>
	<span class="tags"><?php the_category('&bull;' , ''); ?></span>
	<span class="tags"><?php the_tags( '' , '&bull;' , '' ); ?></span>
</div>

