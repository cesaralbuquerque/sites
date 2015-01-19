jQuery(document).ready(function($) {

	

	function hideMeta() {
		// Hide Meta Boxes by default
		$('#homepage_item_blog_metabox, #homepage_item_about_metabox, #homepage_item_stats_metabox, #homepage_item_stats_counter_metabox, #homepage_item_gallery_metabox').hide();
	}
	hideMeta();
	
	
	function showMeta() {
		// Get selected value
		var metaSelected = $('select#_wearesupa_choose_layout option:selected').val();
		
		// Show/hide relevant ones
		if ( metaSelected === "about" ) {
			
			$('#homepage_item_about_metabox').fadeIn();
		
		}
		
		if ( metaSelected === "stats" ) {
		
			$('#homepage_item_stats_metabox, #homepage_item_stats_counter_metabox').fadeIn();
		}
		
		if ( metaSelected === "blog" ) {
		
			$('#homepage_item_blog_metabox').fadeIn();
		
		}
		
		if ( metaSelected === "gallery" ) {
		
			$('#homepage_item_gallery_metabox').fadeIn();
		
		}
	}
	showMeta();
	
	
	$('select#_wearesupa_choose_layout').change(function(){
	
		hideMeta();
		showMeta()
			
	});
	
	
	
	
});