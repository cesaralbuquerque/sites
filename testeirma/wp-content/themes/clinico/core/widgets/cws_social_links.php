<?php
	/**
	 * Social Links Widget Class
	 */
class CWS_Social_Links extends WP_Widget {

	function __construct() {
		$widget_ops = array('classname' => 'widget_cws_social_links', 'description' => __('CWS Social Links', 'THEME_SLUG') );
		parent::__construct('cws-social_links', __('CWS Social Links', 'THEME_SLUG'), $widget_ops);
		$this->alt_option_name = 'widget_cws_social_links';
	}

	function not_empty ($s){
		if( (isset($s)) && (strlen(strval($s))) ){
			return true;
		}
		else{
			return false;
		}
	}

	function widget( $args, $instance ) {
		extract($args);
		extract($instance);
		$title = apply_filters( 'widget_title', empty( $title ) ? '' : $title, $this->id_base );
		ob_start();
		echo $before_widget;
		/* ICON OUTPUT */
		$args = array("title_select"=>$title_select,"title_fa"=>$title_fa,"title_img"=>$title_img);
		cws_widget_icon_rendering($args);
		/* ICON OUTPUT */
		?>
		<div class="cws-widget-content <?php echo (isset($backlight)&&($backlight)=='on') ? 'backlight' : ''; ?>">
		<?php
			if ( !empty( $title ) ) { echo $before_title . $title . $after_title; } 
			$icons = cws_get_option('social-group');
			if ( count($icons)>0 ):
				echo "<div class='social-icons'>";
				foreach ( $icons as $i => $icon ){
					if ( ($this->not_empty($icon['soc-select-fa'])) && ($this->not_empty($icon['soc-url'])) ) {
						?>
						<span class="icon">
							<a href="<?php echo $icons[$i]['soc-url'] ?>">
								<i class="fa fa-<?php echo $icons[$i]['soc-select-fa']; ?>"></i>
							</a>
						</span>
						<?php
					}
				}
				echo "</div>";
			endif;
		?>
		</div>
		<?php
		echo $after_widget;
		ob_end_flush();
	}

	function update( $new_instance, $old_instance ) {
		$instance = $old_instance;
		$instance['title'] = strip_tags($new_instance['title']);
		$instance['backlight'] = $new_instance['backlight'];
		/* ICON VARIABLES */
		$instance['title_select'] = $new_instance['title_select'];
		$instance['title_fa'] = strip_tags($new_instance['title_fa']);
		$instance['title_img'] = strip_tags($new_instance['title_img']);
		$instance['show_icon_options'] = $new_instance['show_icon_options'];
		/* ICON VARIABLES */
		return $instance;
	}

	function form( $instance ) {
		$title 	= isset( $instance['title'] ) ? esc_attr( $instance['title'] ) : 'Social Links';
		$backlight = isset( $instance['backlight'] ) ? $instance['backlight'] : false; 
		/* ICON VARIABLES */
		$title_select = isset( $instance['title_select'] ) ? strval($instance['title_select']) : 'fa';
		$title_fa = isset( $instance['title_fa'] ) ? strip_tags($instance['title_fa']) : '';
		$title_img = isset( $instance['title_img'] ) ? strval($instance['title_img']) : '';
		$display_none = ' style="display:none"';
		$thumb_url = $title_img ? '="' . wp_get_attachment_thumb_url($title_img) . '"' : '';
		$show_icon_options = isset($instance['show_icon_options']) ? $instance['show_icon_options'] : false;
		/* ICON VARIABLES */
		?>

		<p><label for="<?php echo $this->get_field_id('title'); ?>"><?php _e("Title: ", THEME_SLUG); ?></label>
		<input type="text" id="<?php echo $this->get_field_id('title'); ?>" name="<?php echo $this->get_field_name('title'); ?>" value="<?php echo $title; ?>" />
		</p>

		<p>
		<input type="checkbox" class="show_icon_options" id="<?php echo $this->get_field_id('show_icon_options'); ?>" name="<?php echo $this->get_field_name('show_icon_options'); ?>" <?php echo $show_icon_options == 'on' ? 'checked' : ''; ?> />
		<label for="<?php echo $this->get_field_id('show_icon_options'); ?>"><?php _e("Show icon options", THEME_SLUG); ?></label>
		</p>

		<!-- ICON SELECTION -->
				<?php $args = array('title_select'=>$title_select,'title_fa'=>$title_fa,'title_img'=>$title_img,'thumb_url'=>$thumb_url,'display_none'=>$display_none,'show_icon_options'=>$show_icon_options,'_this'=>$this);
				cws_widget_icon_selection($args);
				?>
		<!-- ICON SELECTION -->

		<p><input id="<?php echo $this->get_field_id('backlight'); ?>" name="<?php echo $this->get_field_name('backlight'); ?>" type="checkbox" <?php echo (isset($backlight) && ($backlight=="on")) ? "checked" : '' ?> />
		<label for="<?php echo $this->get_field_id('backlight'); ?>"><?php _e('Highlight this widget', THEME_SLUG); ?></label></p>
		<?php
	}
}
?>