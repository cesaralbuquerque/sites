(function( $ ) {
    "use strict";

    //
    // Kill body animations
    //
    $('html > body').css('-webkit-animation-delay' , 0)
    .css('-moz-animation-delay' , 0)
    .css('-o-animation-delay' , 0)
    .css('-ms-animation-delay' , 0)
    .css('animation-delay' , 0);

 	//
 	// Colours
 	//
 	wp.customize( 'color_main', function( value ) {
 	    value.bind( function( to ) {
 	        $( 'body' ).css( 'color', to );
 	    } );
 	});



    //
    //  Colours
    //

	/*
	wp.customize( 'color_body', function( value ) {
	    value.bind( function( to ) {
	        $( 'body,ul,ol,dl,td,th,caption,pre,p,blockquote,input,textarea,label' ).css( 'color', to );
	    } );
	});
	*/
    //
    // Font Options
    //
    var hFont = 'Oswald';
    wp.customize( 'font_headings', function( value ) {
        value.bind( function( to ) {

            switch( to.toString().toLowerCase() ) {



            	case 'Oswald':
            	    hFont = 'Oswald';
            	    break;

            	case 'PT Serif':
            	    hFont = 'PT Serif';
            	    break;

                case 'times':
                    hFont = 'Times New Roman';
                    break;

                case 'arial':
                    hFont = 'Arial';
                    break;

  				case 'helvetica':
  				    hFont = 'Helvetica';
  				    break;

  				case 'verdana':
  				    hFont = 'Verdana';
  				    break;

  				case 'georgia':
  				    hFont = 'Georgia';
  				    break;

                case 'courier':
                    hFont = 'Courier New, Courier';
                    break;

                case 'Helvetica Neue':
                    hFont = 'Helvetica Neue';
                    break;

                default:
                    hFont = 'Oswald';
                    break;

            }

            $( 'h1,h2,h3,h4,h5,h6,.blog-title,.meta,a.btn,span.btn a,#container .form-submit input,a.up,.stats span,input[type="submit"],table th,.view a.itemcontent, .view.format-link .itemcontent a, .view.format-quote .itemcontent blockquote p, .view.format-status .itemcontent p' ).css({
                fontFamily: hFont
            });

        });

    });

    // Main Font Options
    var mFont = 'PT Serif';
    wp.customize( 'font_main', function( value ) {
        value.bind( function( to ) {

            switch( to.toString().toLowerCase() ) {



            	case 'PT Serif':
            	    mFont = 'PT Serif';
            	    break;

                case 'times':
                    mFont = 'Times New Roman';
                    break;

                case 'arial':
                    mFont = 'Arial';
                    break;

    				case 'helvetica':
    				    mFont = 'Helvetica';
    				    break;

    				case 'verdana':
    				    mFont = 'Verdana';
    				    break;

    				case 'georgia':
    				    mFont = 'Georgia';
    				    break;

                case 'courier':
                    mFont = 'Courier New, Courier';
                    break;

                case 'Helvetica Neue':
                    mFont = 'Helvetica Neue';
                    break;

                default:
                    mFont = 'PT Serif';
                    break;

            }

            $( 'body,ul,ol,dl,td,th,caption,pre,p,blockquote,input,textarea,label' ).css({
                fontFamily: mFont
            });

        });

    });

    //
    // Logo images
    //

    wp.customize( 'wearesupa_logo_image', function( value ) {
        value.bind( function( to ) {

            0 === $.trim( to ).length ?
                $( '#logo img' ).remove() :
                $( '#logo' ).prepend( '<img src="' + to + '" />' );

        });
    });


    //
    // Background images
    //

    wp.customize( 'header_image', function( value ) {
        value.bind( function( to ) {

            0 === $.trim( to ).length ?
                $( '.articleheader' ).css( 'background-image', '' ) :
                $( '.articleheader' ).css( 'background-image', 'url( ' + to + ')' );

        });
    });

    wp.customize( 'body_background_tile_image', function( value ) {
        value.bind( function( to ) {

            0 === $.trim( to ).length ?
                $( 'body' ).css( 'background-image', '' ) :
                $( 'body' ).css( 'background-image', 'url( ' + to + ')' );

        });
    });


    wp.customize( 'body_background_cover_image', function( value ) {
        value.bind( function( to ) {


        if ( true === to ) {

     		$( 'body' ).css( 'background-image', 'url( ' + to + ')' );
     		$( 'body' ).css( 'background-size', 'cover' );
     		$( 'body' ).css( 'background-position', 'center center' );

     	} else {

                $( 'body' ).css( 'background-image', '' );
				$( 'body' ).css( 'background-size', 'none' );
				$( 'body' ).css( 'background-position', '0 0' );

        }

        });
    });


    // Display Options

    wp.customize( 'footer_tagline', function( value ) {
        value.bind( function( to ) {
            $( '#footer-text' ).html( to );
        });
    });


     wp.customize( 'hide_logo_text', function( value ) {
        value.bind( function( to ) {
            true === to ? $( '.blog-title' ).hide() : $( '.blog-title' ).show();
        } );
    } );

    wp.customize( 'hide_tagline', function( value ) {
        value.bind( function( to ) {
            true === to ? $( '.blog-tagline' ).hide() : $( '.blog-tagline' ).show();
        } );
    } );

    wp.customize( 'hide_main_border', function( value ) {
        value.bind( function( to ) {


        if ( true === to ) {

        		$( 'b#tborder, b#bborder, b#lborder, b#rborder' ).hide();
        		$( '#container' ).css('padding-left', 0).css('padding-right', 0);

        	} else {

            	$( 'b#tborder, b#bborder, b#lborder, b#rborder' ).show();
        		$( '#container' ).css('padding-left', '12px').css('padding-right', '12px');
        	}

        });

    } );

    wp.customize( 'header_desktop_height', function( value ) {
        value.bind( function( to ) {
            $( '.articleheader' ).animate( {height: to } );
        } );
    });


   //
   // Uppercase Fonts
   //
   wp.customize( 'font_uppercase', function( value ) {
           value.bind( function( to ) {

               if ( true === to ) {

               	$( 'h1, .blog-title, h2.title, .meta .tags, #wp-calendar tfoot #next, #wp-calendar tfoot #prev a, a.btn, span.btn a,#container .form-submit input, a.up, .view h3, input[type="submit"], .tagcloud a, .view.format-link .itemcontent a, .view.format-quote .itemcontent blockquote p, .view.format-status .itemcontent p' ).css( 'text-transform' , 'uppercase' );

               } else {

               	$( 'h1, .blog-title, h2.title, .meta .tags, #wp-calendar tfoot #next, #wp-calendar tfoot #prev a, a.btn, span.btn a,#container .form-submit input, a.up, .view h3, input[type="submit"], .tagcloud a, .view.format-link .itemcontent a, .view.format-quote .itemcontent blockquote p, .view.format-status .itemcontent p' ).css( 'text-transform' , 'none' );

               }


           } );
       } );








})( jQuery );
