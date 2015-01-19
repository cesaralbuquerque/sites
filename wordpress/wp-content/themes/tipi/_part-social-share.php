<?php 

	$twitter_username = get_option( 'twitter_username');
	
	$twitterVia = "";
	
	if ( $twitter_username ) {

		$twitterVia = '&amp;via=' . $twitter_username; 
	
	}

    $image_single = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'default' ); 

?>

<?php 

if( !get_option( 'hide_social_share' , '0' ) ) {

?>

<!-- Share -->
<div class="inner">
	<div class="sharelinks col span3of3">
		<h3><?php _e( 'Share on' , 'wearesupa' ); ?></h3>
    	<ul>
    		<li><a target="blank" title="<?php echo urlencode( get_the_title() ); ?>" href="https://twitter.com/share?text=<?php echo urlencode( get_the_title() ); ?>%20-%20&amp;url=<?php the_permalink(); ?><?php echo $twitterVia; ?>" onclick="window.open('https://twitter.com/share?text=<?php echo urlencode( get_the_title() ); ?>%20-%20&amp;url=<?php the_permalink(); ?><?php echo $twitterVia; ?>','twitter','width=450,height=300,left='+(screen.availWidth/2-375)+',top='+(screen.availHeight/2-150)+'');return false;" class="btn btndark social twitter <?php if( !get_option( 'use_black_social_share', '0' ) ) echo " white"; ?>">
    		 <?php _e('<i class="fa fa-twitter"></i>' , 'wearesupa'); ?>
    		 </a></li>
    		<li><a target="blank" title="<?php echo urlencode( get_the_title() ); ?>" href="http://www.facebook.com/share.php?u=<?php the_permalink(); ?>" onclick="window.open('http://www.facebook.com/share.php?u=<?php the_permalink(); ?>','facebook','width=450,height=300,left='+(screen.availWidth/2-375)+',top='+(screen.availHeight/2-150)+'');return false;" class="btn btndark social facebook <?php if( !get_option( 'use_black_social_share', '0' ) ) echo " white"; ?>">
    		<?php _e('Facebook' , 'wearesupa'); ?>
    		</a></li>
    		<li><a href="http://pinterest.com/pin/create/button/?url=<?php the_permalink(); ?>&amp;media=<?php echo $image_single[0]; ?>&amp;description=<?php echo urlencode( get_the_title() ); ?>" target="_blank" class="btn btndark social pinterest <?php if( !get_option( 'use_black_social_share', '0' ) ) echo " white"; ?>">
    		 <?php _e('Pinterest' , 'wearesupa'); ?>
    		 </a></li>
    		 <li><a onclick="window.open('https://plus.google.com/share?url=<?php the_permalink(); ?>','gplusshare','width=450,height=300,left='+(screen.availWidth/2-375)+',top='+(screen.availHeight/2-150)+'');return false;" href="https://plus.google.com/share?url=<?php the_permalink(); ?>" class="btn btndark social googleplus <?php if( !get_option( 'use_black_social_share', '0' ) ) echo " white"; ?>">
    		  <?php _e('Google+' , 'wearesupa'); ?>
    		  </a></li>
    	</ul>
    </div>
</div>
<!--/ Share -->

<?php 


} // hide social if

 ?>