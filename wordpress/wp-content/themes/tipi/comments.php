 <?php if ( is_single() || is_page() ) { ?>

<?php 

// Hide comments

if( !get_option( 'hide_comments', '0' ) ) { ?>

	<!-- Comments -->
	<div id="comments" class="row">
		<div class="inner">
			<div class="col span3of3">
			    
		    <h5 id="respond-title"><?php comments_popup_link( __( 'Comments (0)','wearesupa' ), __( 'Comments (1)','wearesupa' ), __( 'Comments (%)','wearesupa' ) ); ?></h5>
			    <aside class="comments">
			<?php if ( post_password_required() ) : ?>
		    <p class="nopassword"><?php _e( 'This post is password protected. Enter the password to view any comments.', 'wearesupa' ); ?></p>
		
		<?php
		return; endif; ?>
		</aside>
		<?php if ( have_comments() ) : ?>
		
		<?php if ( get_comment_pages_count() > 1 && get_option( 'page_comments' ) ) : ?>
					<div class="navigation">
						<div class="nav-previous"><?php previous_comments_link( __( '<span class="meta-nav">&larr;</span> Older Comments', 'wearesupa' ) ); ?></div>
						<div class="nav-next"><?php next_comments_link( __( 'Newer Comments <span class="meta-nav">&rarr;</span>', 'wearesupa' ) ); ?></div>
					</div> 
		<?php endif; ?>
					<ol class="commentlist">
						<?php wp_list_comments( array( 'callback' => 'post_comments' ) ); ?>
					</ol>
		<?php if ( get_comment_pages_count() > 1 && get_option( 'page_comments' ) ) : ?>
		            <div class="navigation">
						<div class="nav-previous"><?php previous_comments_link( __( '<span class="meta-nav">&larr;</span> Older Comments', 'wearesupa' ) ); ?></div>
						<div class="nav-next"><?php next_comments_link( __( 'Newer Comments <span class="meta-nav">&rarr;</span>', 'wearesupa' ) ); ?></div>
					</div>
		<?php endif; ?>
		<?php else : if ( ! comments_open() ) : ?>
			<p class="nocomments"><?php _e( 'Comments are closed.', 'wearesupa' ); ?></p>
		<?php endif; ?>
		<?php endif; ?>
		<?php
		$req = get_option( 'require_name_email' );
		$aria_req = ( $req ? " aria-required='true'" : '' );
		$form_args = array( 
			
			'title_reply' => __( 'Leave a comment', 'wearesupa'),
			'comment_notes_before' => '<p class="comment-notes">' . __( 'Your email address will not be published. Required fields are marked <span class="required">*</span>' , 'wearesupa' ) . '</p>',
			'comment_notes_after' => '',
			'comment_field' => '<div class="comment-form-right"><p class="comment-form-comment"><label for="comment">' . __( 'Comment', 'wearesupa' ) .
			    '</label><textarea id="comment" name="comment" cols="45" rows="8" aria-required="true" placeholder="Enter your comment here">' .
			    '</textarea></p></div>',
			'label_submit' => __( 'Post Comment' , 'wearesupa' ),
			
			
			'fields' => apply_filters( 'comment_form_default_fields', array(
			
			    'author' =>
			      '<div class="comment-form-left"><p class="comment-form-author">' .
			      '<label for="author">' . __( 'Name', 'wearesupa' ) .  ( $req ? '<span class="required">*</span>' : '' ) . '</label> ' .
			      '<input id="author" name="author" type="text" value="' . esc_attr( $commenter['comment_author'] ) .
			      '" size="30"' . $aria_req . ' placeholder="Name *" /></p>',
			
			    'email' =>
			      '<p class="comment-form-email"><label for="email">' . __( 'Email', 'wearesupa' ) . ( $req ? '<span class="required">*</span>' : '' ) . '</label> ' .
			      '<input id="email" name="email" type="text" value="' . esc_attr(  $commenter['comment_author_email'] ) .
			      '" size="30"' . $aria_req . ' placeholder="Email *" /></p>',
			
			    'url' =>
			      '<p class="comment-form-url"><label for="url">' .
			      __( 'Website', 'wearesupa' ) . '</label>' .
			      '<input id="url" name="url" type="text" value="' . esc_attr( $commenter['comment_author_url'] ) .
			      '" size="30" placeholder="Website" /></p></div>'
			    )
			  ),
		 
		); 
		
		comment_form( $form_args );  ?>
		</div>	
	</div>
</div>	
	<?php } ?>

<?php } ?>
