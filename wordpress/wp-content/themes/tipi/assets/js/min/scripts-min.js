jQuery.noConflict(),function($){$(window).load(function(){"use strict";$(".photosetgrid img").each(function(){var t=$(this).attr("alt");$(this).parent().attr("title",t)});var t=$("#site-logo"),e=t.attr("data-fullsrc");t.attr("width",t.width()),t.attr("height",t.height()),window.devicePixelRatio>=1.5&&t.attr("src",e)}),$(document).ready(function(){"use strict";function t(){var t=$(window).width();if(t>=700){var e=$(window).scrollTop();$(".parallaxbkg").css("background-position","center -"+.2*e+"px"),$(".parallax").css("bottom","+"+.2*e+"px")}}function e(){$("#pagination .inner").remove(),$("#pagination").load(i+" #pagination .inner",function(t,e,i){if("error"===e){var a="Sorry but there was an error: ";$(this).append(a+i.status+" "+i.statusText)}}).hide(),setTimeout(function(){var t=$("#pagination .btn.next a").attr("href");t&&void 0!==t||$(".btn.load").animate({opacity:1})},1e3)}$("#home").css("height",$(window).height()),$(".photosetgrid").photosetGrid({highresLinks:!0,rel:"gallery",gutter:"5px",onComplete:function(){$(".photosetgrid").attr("style",""),$(".photosetgrid a").swipebox({hideBarsOnMobile:!1})}}),$(window).bind("scroll",function(e){t()}),jQuery(window).scroll(function(){jQuery(this).scrollTop()>100?jQuery(".scrollup").fadeIn():jQuery(".scrollup").fadeOut()}),$(".swipebox").swipebox({hideBarsOnMobile:!1}),$(".stats-panel").waypoint(function(t){$(".timer").countTo()},{triggerOnce:!0,offset:"65%"}),$("a").smoothScroll(),$("#menuoverlay").css({height:$(window).height()}),$("#navtrigger").click(function(){$("#menuoverlay").toggleClass("active"),$("#navtrigger").toggleClass("selected")});var i=$("#pagination .btn.next a").attr("href");i&&!$("body").is(".single")&&$("#pagination").hide(),$(".btn.load").on("click",function(t){t.preventDefault(),i=$("#pagination .btn.next a").attr("href");var a=i+" .blog-panel .inner .item";$(this).parent().find(".load-panel").append($("<div />").load(a,function(t,e,i){if("error"===e){var a="Sorry but there was an error: ";$(this).append(a+i.status+" "+i.statusText)}})),$(this).parent().find(".load-panel").delay(500).animate({opacity:1}),e()}),$(document).ajaxComplete(function(){$(".load-panel .owl-carousel").owlCarousel({autoPlay:5e3,items:1,stopOnHover:!0,singleItem:!0})}),$(".gallery-panel img, .gallery-item a img").each(function(){var t=$(this).attr("alt");$(this).parent().find(".btn.swipebox").attr("title",t)}),$("input, textarea").placeholder(),$("#contentwrap").fitVids()})}(jQuery);