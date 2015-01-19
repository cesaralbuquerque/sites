/*! @Copyright Supa 2014 - Tipi 1.0.8 */

jQuery.noConflict();
(function ($) {

	$(window).load(function() {
	"use strict";


		/* ==============================================
		Grab captions
		=============================================== */
		$('.photosetgrid img').each( function() {

			var imageCaption = $(this).attr("alt");


			$(this).parent().attr("title" , imageCaption);

		});


		/* ==============================================
		Retina Logo
		=============================================== */
		var logo = $( '#site-logo' );
		var logoRetina = logo.attr('data-fullsrc');

		logo.attr( 'width' , logo.width() );
		logo.attr( 'height' , logo.height() );

		if( window.devicePixelRatio >= 1.5 ){
		   logo.attr( 'src' , logoRetina );
		}


	});

	$(document).ready(function() {
	"use strict";
		/* ==============================================
		Full Page Image Slider
		=============================================== */

		$('#home').css('height', $(window).height());

		/* ==============================================
		Article Photo Set Grid Plugin
		=============================================== */

		$('.photosetgrid').photosetGrid({
			highresLinks: true,
			rel: 'gallery',
			gutter: '5px',
			onComplete: function() {
				$('.photosetgrid').attr('style', '');
				$('.photosetgrid a').swipebox({hideBarsOnMobile : false});
			}
		});

		/* ==============================================
		Parallax
		=============================================== */

		$(window).bind('scroll', function(e) {

			parallaxScroll();
		});


		function parallaxScroll() {

			var currWidth = $(window).width();

			if (currWidth >= 700) {

				var scrolledY = $(window).scrollTop();
				$('.parallaxbkg').css('background-position', 'center -' + ((scrolledY * 0.2)) + 'px');
				$('.parallax').css('bottom', '+' + ((scrolledY * 0.2)) + 'px');

			}

		}

		/* ==============================================
		Scroll up button
		=============================================== */
		jQuery(window).scroll(function() {
			if (jQuery(this).scrollTop() > 100) {
				jQuery('.scrollup').fadeIn();
			} else {
				jQuery('.scrollup').fadeOut();
			}
		});

		/* ==============================================
		Lightbox
		=============================================== */
		$('.swipebox').swipebox({hideBarsOnMobile : false});

		/* ==============================================
		Animated Elements
		=============================================== */
		$('.stats-panel').waypoint(function(direction) {
			$('.timer').countTo();
			}, {triggerOnce: true, offset: '65%'
		});

		/* ==============================================
		Smooth Scroll
		=============================================== */
		$('a').smoothScroll();

		/* ==============================================
		Navigation
		=============================================== */

		$('#menuoverlay').css({
		height: $(window).height(),
		});

		$('#navtrigger').click(function() {
			$('#menuoverlay').toggleClass('active');
			$('#navtrigger').toggleClass('selected');
		});

		/* ==============================================
		Load More Ajax
		=============================================== */

		var getNextLink = $( '#pagination .btn.next a' ).attr('href');

		if ( getNextLink && !$('body').is('.single') ) {

			$( '#pagination' ).hide();

		}


		$('.btn.load').on( 'click' , function ( e ) {

			e.preventDefault();

			getNextLink = $( '#pagination .btn.next a' ).attr('href');

			var buttonUrl = getNextLink + ' .blog-panel .inner .item';

			$(this).parent().find( '.load-panel' ).append($('<div />').load( buttonUrl, function( response, status, xhr ) {
			  if ( status === "error" ) {
			    var msg = "Sorry but there was an error: ";
			    $( this ).append( msg + xhr.status + " " + xhr.statusText );
			  }
			}));

			$(this).parent().find( '.load-panel' ).delay(500).animate( { opacity: 1 } );

			updateButtonUrl();

		});


		function updateButtonUrl() {

			// Update load more link
			$( '#pagination .inner' ).remove();
			$( '#pagination' ).load( getNextLink + ' #pagination .inner', function( response, status, xhr ) {
			  if ( status === "error" ) {
			    var msg = "Sorry but there was an error: ";
			    $( this ).append( msg + xhr.status + " " + xhr.statusText );
			  }
			}).hide();

			// Check ahead for next link
			setTimeout(function() {
				var checkNextLink = $( '#pagination .btn.next a' ).attr('href');
				if ( !checkNextLink || checkNextLink === undefined ) {
					$('.btn.load').animate( { opacity: 1 });
				}
			}, 1000);
		}



		$( document ).ajaxComplete(function() {
			$('.load-panel .owl-carousel').owlCarousel({
					autoPlay: 5000,
					items : 1,
					stopOnHover : true,
					singleItem : true
			});
		});


		/* ==============================================
		Grab ALT for swipebox
		=============================================== */
		$('.gallery-panel img, .gallery-item a img').each( function() {

			var imageCaption = $(this).attr("alt");

			$(this).parent().find('.btn.swipebox').attr("title" , imageCaption);

		});

		/* ==============================================
		Form input placeholder
		=============================================== */
		$('input, textarea').placeholder();

		/* ==============================================
		Fitvids
		=============================================== */
		$("#contentwrap").fitVids();

	});

}(jQuery));
