// http://craftedpixelz.co.uk/blog/conditional-js-with-modernizr-mq/

function updateScroll() {
  if($(document).scrollTop() > offsetHeight) {
    $header.addClass('scroll');
  } else {
    $header.removeClass('scroll');
  }
}

// http://stackoverflow.com/questions/7717527/jquery-smooth-scrolling-when-clicking-an-anchor-link
var $root, $header, offsetHeight, $header, $offsetBase;

function smoothScroll(elem) {
  var $offset = $('.fixed-wrap');
  $root.animate({
    scrollTop: $(elem).offset().top - $offset.height()
  }, 500, function () {
    window.location.hash = elem;
    updateScroll();
  });
}

$(function() {
  $root = $('html, body');

  if (Modernizr.mq('only screen and (min-width: 1200px)')) {
    $header = $('.fixed-wrap');
    $offsetBase = $('.top-header');
    offsetHeight = parseInt( $offsetBase.height() );
  }

  var windowAnchor = window.location.hash;
  if(windowAnchor !== undefined && $(windowAnchor).length === 1) {
    smoothScroll(windowAnchor);
  }
});

$(document).on('click', 'a.smooth-scroll', function() {
  var elem = $.attr(this, 'href').replace('/', '');
  smoothScroll(elem);
  return false;
});

if (Modernizr.mq('only screen and (min-width: 1200px)')) {
  $(window).scroll(function() {
    updateScroll();
  });
}
