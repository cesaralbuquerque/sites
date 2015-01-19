"use strict";

/**/
	/* MARK */
	/**/
	jQuery(document).ready(function ($){
		$(".stars").ready(function (){
			var stars_active = false;
			$(".woocommerce .stars").on("mouseover", function(){
				if (!stars_active){
					$(this).find("span:not(.stars-active)").append("<span class='stars-active' data-set='no'>&#xf005;&#xf005;&#xf005;&#xf005;&#xf005;</span>");
					stars_active = true;
				}
			});
			$(".woocommerce .stars").on("mousemove", function (e){
				var cursor = e.pageX;
				var ofs = $(this).offset().left;
				var fill = cursor - ofs;
				var width = $(this).width(); 
				var persent = Math.round(100*fill/width);
				$(".woocommerce .stars span a").css("width",String(width/5)+"px");
				$(".woocommerce .stars span a").css("line-height",String((width+1)/5)+"px");
				$(".woocommerce .stars span .stars-active").css("margin-top","0px");

			});
			$(".woocommerce .stars").on("mousemove", function (e){
				var cursor = e.pageX;
				var ofs = $(this).offset().left;
				var fill = cursor - ofs;
				var width = $(this).width(); 
				var persent = Math.round(100*fill/width);
				$(this).find(".stars-active").css('width',String(persent)+"%");
				$(".stars-active").removeClass("fixed-mark");
			});
			$(".woocommerce .stars").on("click", function (e){
				var cursor = e.pageX;
				var ofs = $(this).offset().left;
				var fill = cursor - ofs;
				var width = $(this).width(); 
				var persent = Math.round(100*fill/width);
				$mark = $(this).find(".stars-active");
				$mark.css('width',String(persent)+"%");
				$mark.attr("data-set",String(persent));
			});
			$(".woocommerce .stars").on("mouseleave", function (e){
				$mark = $(this).find(".stars-active");
				if ($mark.attr("data-set") == "no"){
					$mark.css("width","0");
				}
				else{
					var persent = $mark.attr("data-set");
					$mark.css("width",String(persent)+"%");
					$(".stars-active").addClass("fixed-mark");
				}
			});
		});
	})


/* Search icon hover */
jQuery(document).ready(function ($){
	$( "#searchform #searchsubmit" ).mouseover(function() {
  		$("#searchform div").addClass( "hover-search" );
	});
	$( "#searchform #searchsubmit" ).mouseout(function() {
  		$("#searchform div").removeClass( "hover-search" );
	});
});

/* Search icon hover */

/****************** \PB ********************/

/***********************************************/

/* jQuery(document).ready(function (){
	setTimeout(function (){
		jQuery("#tribe-bar-collapse-toggle").live("click",function (){
			jQuery(this).addClass("class-1 class-2");
			jQuery(".tribe-bar-filters").toggleClass("active");
			jQuery(this).live("click",function(){
				jQuery(".tribe-bar-filters").slideToggle(300);
			})
		});
	}, 2000);
}); */