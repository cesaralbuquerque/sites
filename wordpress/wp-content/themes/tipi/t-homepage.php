<?php
/**
 Template Name: Homepage
 *
 * @package WordPress
 * @subpackage Tipi
 * @since Tipi 1.0
 */
get_header(); ?>
<?php if ( have_posts() ) while ( have_posts() ) : the_post(); ?>
  
<!-- ==============================================
Cover
=============================================== -->
<div id="cover">
    <div class="inner">
        <div class="col span3of3 parallax">
            
            <?php get_template_part( '_part' , 'logo' ); ?>
            
            <?php $hero_title_small_text = get_post_meta( get_the_ID(), '_wearesupa_hero_title_small_text', true ); 
	              $hero_title_text = get_post_meta( get_the_ID(), '_wearesupa_hero_title_text', true );
            ?>
            
            <?php if ( $hero_title_text ) { ?>

           		<h1><?php if ($hero_title_small_text) { ?><span><?php echo $hero_title_small_text; ?></span><?php } ?><?php echo $hero_title_text; ?></h1>
            
            <?php } ?>
			
			<?php 
				
				// If hero has button text, show button
				$hero_button_text = get_post_meta( get_the_ID(), '_wearesupa_hero_button_text', true );
				
				if ( $hero_button_text ) {
				
			 ?>
			
            	<a href="#contentwrap" class="btn down"><?php echo $hero_button_text; ?></a>
            
            <?php } ?>
            
            
            
        </div>
    </div>
    
    <?php
    	
    	// Only show the overlay if it exists
    	$cover_image_overlay = get_post_meta( get_the_ID(), '_wearesupa_cover_image_overlay', true ); 
    	$cover_image_overlay_alt = get_post_meta( get_the_ID(), '_wearesupa_cover_image_overlay_alt', true );
    	$cover_image_overlay_position = get_post_meta( get_the_ID(), '_wearesupa_cover_image_overlay_position', true );
    	
    	if ( $cover_image_overlay ) { ?>
    
   				 <div class="coverimg" style="<?php echo $cover_image_overlay_position; ?>: 0; <?php if ( $cover_image_overlay_position === "right" ) { ?> left:auto; <?php } ?>"><img href="http://ecohospedagem.com/" target="_blank" src="<?php echo $cover_image_overlay; ?>" alt="<?php echo $cover_image_overlay_alt; ?>" /></div>
    
    	<?php } ?>
</div>
<!--/ Cover -->

<div id="home"></div>

<?php

	// Cover Gallery images
	$gallery_images = get_post_meta( get_the_ID(), '_wearesupa_gallery_images', true ); 
	
?>
<?php if ( ! empty( $gallery_images ) ) : ?>
 
	<script>
		jQuery(document).ready(function () {
			jQuery('body.page-template-t-homepage-php').backstretch([<?php foreach ( $gallery_images as $gallery_image ) : ?>
			    "<?php echo wp_get_attachment_url( $gallery_image, 'wide' ); ?>",
			<?php endforeach; ?>], {
				duration: 4000,
				fade: 750
			});
		});
	</script>
    
<?php endif; ?>    
    
<?php endwhile; ?>

<!-- ==============================================
Main Content
=============================================== -->
<div id="contentwrap">

	<?php
	
				$main_query = new WP_Query( array ( 'post_type' => 'wearesupa-homepage', 'posts_per_page' => '99' ) );	
					
				while ( $main_query->have_posts() ) : $main_query->the_post();
					
						// Get the right layout and load corresponding template part
						$choose_layout = get_post_meta( get_the_ID(), '_wearesupa_choose_layout', true );
	
				   		if ( $choose_layout === "blog" ) {
				   		
				   			get_template_part( '_part', 'blog-panel' );
				   		
				   		}
				   		
				   		if ( $choose_layout === "about" ) {
				   		
		   		   			get_template_part( '_part', 'about-panel' );
		   		   		
		   		   		}
		   		   		
		   		   		if ( $choose_layout === "stats" ) {
		   		   		
	   		   				get_template_part( '_part', 'stats-panel' );
	   		   			
	   		   			}
	   		   			
	   		   			if ( $choose_layout === "gallery" ) {
		   		   		
	   		   				get_template_part( '_part', 'gallery-panel' );
	   		   			
	   		   			}
				   		
				
				
					endwhile;
			?>

</div><!-- /contentwrap -->    



<?php get_footer(); ?>

