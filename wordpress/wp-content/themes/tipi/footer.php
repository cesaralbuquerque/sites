<?php if ( !is_404() ) { ?>

	<!-- Footer -->
			<div id="footer" class="row">
		        <div class="inner clearfix">
		            <div class="textblock">
		            	<!-- Social Links -->
					    <div class="sociallinks">
					    	<?php echo get_option( 'footer_socials' , '<ul>
					    		<li><a href="http://twitter.com" title="Twitter" class="btn btndark">Twitter</a></li>
					    		<li><a href="http://facebook.com" title="Facebook" class="btn btndark">Facebook</a></li>
					    		<li><a href="http://instagram.com" title="Instagram" class="btn btndark">Instagram</a></li>
					    		<li><a href="http://foursquare.com" title="Foursquare" class="btn btndark">Foursquare</a></li>
					    		<li><a href="http://youtube.com" title="Youtube" class="btn btndark">Youtube</a></li>
					    	</ul>' ); ?>
					    </div>
					    <!--/ Social Links -->

						<span id="footer-text" class="copyright"><?php echo get_option( 'footer_copyright' , '&copy; 2014 Tipi. Built by <a href="http://www.wearesupa.com" target="_blank">Supa</a>' ); ?></span>

		            </div>
		        </div>
		    </div>
			<!--/ Footer -->


		<a href="#container" class="up scrollup"><?php _e( 'Subir' , 'wearesupa' ); ?></a>
	</div>

<?php } ?>

<?php if( get_option( 'hide_main_border' ) !== "1" ) { ?>
<!-- Page border -->
<b id="tborder"></b><b id="rborder"></b><b id="bborder"></b><b id="lborder"></b>
<?php } ?>


<script> var ie9 = false; </script>
<!--[if lte IE 9 ]>
<script> var ie9 = true; </script>
<![endif]-->

<?php wp_footer(); ?>

<?php if( get_option( 'disable_preloader' ) !== "1" ) { ?>
<script>
jQuery.noConflict();
(function ($) {
$(window).load(function() {
"use strict";

	/** Preloader **/
	var preloaderDelay = 350,
		preloaderFadeOutTime = 800;

	function hidePreloader() {
		var loadingAnimation = $('#loading-animation'),
			preloader = $('#preloader');
		loadingAnimation.fadeOut();
		preloader.delay(preloaderDelay).fadeOut(preloaderFadeOutTime);
	}
	hidePreloader();
});
}(jQuery));
</script>
<?php } ?>
</body>
</html>
