<?php

/* #######################################################################

	Tipi by Supa

	Theme Support & Content width

####################################################################### */

// Load editor CSS
add_editor_style();

// Grab general theme options
add_action('after_setup_theme', 'wearesupa_theme_setup');
function wearesupa_theme_setup(){
    load_theme_textdomain( 'wearesupa', get_template_directory().'/languages' );
}

$locale = get_locale();
$locale_file = get_template_directory()."/languages/$locale.php";
if ( is_readable($locale_file) )
	require_once($locale_file);

add_theme_support( 'menus' );
add_theme_support( 'post-thumbnails' );
add_theme_support( 'automatic-feed-links' );
add_theme_support( 'post-formats', array( 'gallery', 'image', 'link', 'quote', 'status', 'video', 'audio'));
add_theme_support( 'structured-post-formats', array( 'gallery', 'image', 'link', 'quote', 'status', 'video', 'audio'));


// Content width
if ( ! isset( $content_width ) ) $content_width = 900;

/* #######################################################################

	Filter home class out for all standard templates.

####################################################################### */

add_filter('body_class', 'remove_a_body_class', 20, 2);
function remove_a_body_class($wp_classes) {
if( is_page_template('t-archive.php') ) {
      foreach($wp_classes as $key => $value) {
      if ($value == 'home') unset($wp_classes[$key]);
      }
}
return $wp_classes;
}

/* #######################################################################

	Add paragraph around read more link

####################################################################### */

function add_p_tag($link){
	return "<p>$link</p>";
}
add_filter('the_content_more_link', 'add_p_tag');

/* #######################################################################

	Custom Image Sizes

####################################################################### */

add_image_size( 'default', 1680, 9999, false );
add_image_size( 'blog_square', 400, 400, true );
add_image_size( 'single', 1000, 9999, false );
add_image_size( 'wide', 1680, 9999, false );
add_image_size( 'rss-thumb', 300, 9999, false );


/* #######################################################################

	Get Image Caption

####################################################################### */

function the_post_thumbnail_caption() {
  global $post;
  $thumbnail_id    = get_post_thumbnail_id($post->ID);
  $thumbnail_image = get_posts(array('p' => $thumbnail_id, 'post_type' => 'attachment'));
  if ($thumbnail_image && isset($thumbnail_image[0])) {
    return $thumbnail_image[0]->post_excerpt;
  }
}

// Get attachments alts etc.
function wp_get_attachment( $attachment_id ) {

	$attachment = get_post( $attachment_id );
	return array(
		'alt' => get_post_meta( $attachment->ID, '_wp_attachment_image_alt', true ),
		'caption' => $attachment->post_excerpt,
		'description' => $attachment->post_content,
		'href' => get_permalink( $attachment->ID ),
		'src' => $attachment->guid,
		'title' => $attachment->post_title
	);
}


/* #######################################################################

	Register Menus

####################################################################### */

register_nav_menus( array(
	'primary' => 'Main Menu'
) );

/* #######################################################################

	Get the topmost ancestor of current page

####################################################################### */

if(!function_exists('get_post_top_ancestor_id')){
	/**
	 * @uses object $post
	 * @return int
	 */
	function get_post_top_ancestor_id(){
		global $post;

		if($post->post_parent){
			$ancestors = array_reverse(get_post_ancestors($post->ID));
			return $ancestors[0];
		}

		return $post->ID;
	}}

/* #######################################################################

	Comments & Password Protect Setup

####################################################################### */

add_filter('the_password_form','my_password_form');
function my_password_form($text){
$text='<div class="password-protect">'.$text.'</div>';
return $text;
}

function post_comments( $comment, $args, $depth ) {
	$GLOBALS['comment'] = $comment;
	switch ( $comment->comment_type ) :
	case '' :
?>
	<li <?php comment_class(); ?> id="li-comment-<?php comment_ID(); ?>">
		<div id="comment-<?php comment_ID(); ?>">

		<span class="author-avatar"><?php echo get_avatar( $comment, 130 ); ?></span>

		<?php if ( $comment->comment_approved == '0' ) : ?>
			<div class="comment-body"><em><?php _e( 'Your comment is awaiting moderation.', 'wearesupa' ); ?></em></div>
		<?php endif; ?>

		<div class="comment-body">
			<p><span class="comment-author-name"><?php comment_author_link(); ?></span>
			<a class="comment-date" href="<?php echo esc_url( get_comment_link( $comment->comment_ID ) ); ?>">
				<?php comment_date(); _e(' at ','wearesupa'); comment_time(); ?></a><?php edit_comment_link( __( '(Edit)', 'wearesupa' ), ' ' ); ?></p>
			<div class="comment-text"><?php comment_text(); ?></div>

		<div class="comment-reply">
			<?php comment_reply_link( array_merge( $args, array( 'depth' => $depth, 'max_depth' => $args['max_depth'] ) ) ); ?>
		</div>
		</div>
	</div>
	<?php
	break;
case 'pingback'  :
case 'trackback' :
?>

	<li class="post pingback">
		<p><?php _e( 'Pingback:','wearesupa' ); ?> <?php comment_author_link(); ?><?php edit_comment_link( __( '(Edit)', 'wearesupa' ), ' ' ); ?></p>
	<?php

	break;
	endswitch;
}

/* #######################################################################

	Add page type to <body> class

####################################################################### */

function page_bodyclass() {
	global $wp_query;
	$page = '';
	$page = $wp_query->query_vars["pagename"];
	echo $page;
}

/* #######################################################################

	Control size of excerpts

####################################################################### */


function custom_excerpt_length( $length ) {

	// Get Excerpt length from theme options
	$excerptLength = get_option( 'auto_excerpt_length');

	if ( !$excerptLength ) {

		$excerptLength = 40;

	}

	return $excerptLength;
}
add_filter( 'excerpt_length', 'custom_excerpt_length', 999 );

/* #######################################################################

	Pagination, thanks for Kriesi (http://www.kriesi.at/archives/how-to-build-a-wordpress-post-pagination-without-plugin)

####################################################################### */

function wearesupa_pagination($pages = '', $range = 2)
{
     $showitems = ($range * 2)+1;

     global $paged;
     if(empty($paged)) $paged = 1;

     if($pages == '')
     {
         global $wp_query;
         $pages = $wp_query->max_num_pages;
         if(!$pages)
         {
             $pages = 1;
         }
     }

     if(1 != $pages)
     {
         echo "<nav class='pagination'><ul>";
         if($paged > 2 && $paged > $range+1 && $showitems < $pages) echo "<li><a href='".get_pagenum_link(1)."'>&laquo;</a></li>";
         if($paged > 1 && $showitems < $pages) echo "<li><a href='".get_pagenum_link($paged - 1)."'>&lsaquo;</a></li>";

         for ($i=1; $i <= $pages; $i++)
         {
             if (1 != $pages &&( !($i >= $paged+$range+1 || $i <= $paged-$range-1) || $pages <= $showitems ))
             {
                 echo ($paged == $i)? "<li><span class='current'>".$i."</span></li>":"<li><a href='".get_pagenum_link($i)."' class='inactive' >".$i."</a></li>";
             }
         }

         if ($paged < $pages && $showitems < $pages) echo "<li><a href='".get_pagenum_link($paged + 1)."'>&rsaquo;</a></li>";
         if ($paged < $pages-1 &&  $paged+$range-1 < $pages && $showitems < $pages) echo "<li><a href='".get_pagenum_link($pages)."'>&raquo;</a></li>";
         echo "</ul></nav>\n";
     }
}


add_action('wp_head', 'head_injection');

function head_injection() {

	global $post;

	// Show Facebook Open Graph tags
	if ( is_page() || is_single() ) {

	if ( has_post_thumbnail() ) {

	 $image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'wide' );

		echo '<meta name="og:image" content="' . $image[0] . '">';

		 }
	}

		// Check for Favicon and Apple Icon
		$favicon = get_option( 'favicon_image');
		$appleicon = get_option( 'appleicon_image');

	 if ( $favicon ) {

		echo '<link rel="icon" type="image/png" href="' . $favicon . '" />';

	}
	 if ( $appleicon ) {

		echo '<link rel="apple-touch-icon-precomposed" href="' . $appleicon . '" />';

	 }

	// IF homepage template, grab dynamic item styles
		if ( is_page_template( 't-homepage.php' ) ) {
			get_template_part( '_part' , 'homepage-styles' );
		}

		// Font Advanced JS/CSS
		echo get_option( 'font_advanced_service' );

		// Analytics JS
		echo get_option( 'google_analytics' );

}

/* #######################################################################

	Get attachment data

####################################################################### */

add_filter('wp_get_attachment_image_attributes','get_captions', 10, 2);

function get_captions($attr, $attachment){
	$attr['title'] = trim(strip_tags( $attachment->post_excerpt ));
	return $attr;
}

/* #######################################################################

	Include thumbnail + custom meta in RSS feed

####################################################################### */

function add_thumb_to_RSS($content) {
	global $post;
	$meta = "";
	if ( has_post_thumbnail( $post->ID ) ){
	$content = '<div>' . get_the_post_thumbnail( $post->ID, 'rss-thumb' ) . '</div>' . $content;
	}
	if ( get_post_meta($post->ID, 'single_format_audio', true) ) {
	$meta = '<p><strong>' . __('Audio Link: ', 'wearesupa'). '</strong><p>' . get_post_meta($post->ID, 'single_format_audio', true) . '</p><p>';
	}
	if ( get_post_meta($post->ID, 'single_format_video', true) ) {
	$meta = '<p><strong>' . __('Video Post: ', 'wearesupa') . '</strong>' . get_post_meta($post->ID, 'single_format_video', true) . '</p>';
	}
	if ( get_post_meta($post->ID, 'single_format_link_url', true) ) {
	$meta = '<p><strong>' . __('Link Post: ', 'wearesupa') . '</strong>' . get_post_meta($post->ID, 'single_format_link_url', true) . '</p><p>';
	}
	if ( get_post_meta($post->ID, 'single_format_quote', true) ) {
	$meta = '<p><strong>' . __('Quote Source: ', 'wearesupa') . '</strong>' . get_post_meta($post->ID, 'single_format_quote', true) . '</p>';
	}
	return $content . $meta;
}
add_filter('the_excerpt_rss', 'add_thumb_to_RSS');
add_filter('the_content_feed', 'add_thumb_to_RSS');

?>
