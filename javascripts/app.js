/*!
 * Start Bootstrap - Grayscale Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

// jQuery to collapse the navbar on scroll

var wh = $(window).height();

$(window).scroll(function() {
    if ($(".intro").offset().top > wh - 60) {
        $(".navbar").addClass("isfixed");
        $(".intro").addClass("disable");
    } else {
        $(".navbar").removeClass("isfixed");
        $(".intro").removeClass("disable");
    }
});

// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 300, 'easeInOutExpo');
        event.preventDefault();
    });
});

$('#myAffix').affix({
  offset: {
    top: $(window).height(),
    bottom: function () {
      return (this.bottom = $('.footer').outerHeight(true))
    }
  }
});


// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function() {
    $('.navbar-toggle:visible').click();
});

// residual js
// function countChar(val) {
//  var len = val.value.length;
//  var maxl = 90
//  if (len >= maxl) {
//  } else {
//      $('#charNum').text(maxl - len);
//  }
// };

// $('.img-holder').imageScroll();
// $('.img-holder').imageScroll({
//     coverRatio: 0.5
// });

// var touch = Modernizr.touch;
// $('.img-holder').imageScroll({
//     imageAttribute: (touch === true) ? 'image-mobile' : 'image',
//     touch: touch
// });
