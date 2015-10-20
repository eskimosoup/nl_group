// Potential usage: data-animation-type='slideInUp', data-animation-delay='500'
// https://daneden.github.io/animate.css/

function animateIn() {
  var $elem = $(this);
  var animationType  = $elem.attr('data-animation-type');
  var animationDelay = $elem.attr('data-animation-delay');

  if( animationDelay !== undefined )  {
    setTimeout(function() {
      $elem.removeClass('visibility-hidden').addClass('animated ' + animationType);
    }, animationDelay);
  } else {
    $elem.removeClass('visibility-hidden').addClass('animated ' + animationType);
  }
}

function animateOut() {
  var $elem = $(this);
  var animationType = $elem.attr('data-animation-type');
  $elem.removeClass('animated ' + animationType).addClass('visibility-hidden');
}

if (Modernizr.mq('only screen and (min-width: 768px)') && !$('html').hasClass('ie9')) {
  $(function() {
    $('[data-animation-type]').addClass('visibility-hidden');

    $('[data-animation-type]').onScreen({
      tolerance: 0,
      toggleClass: 'onScreen',
      doIn: animateIn,
      doOut: animateOut
    });
  });
}

// https://github.com/matthieua/WOW/issues/20
$(document).on('mouseover', '.animate-hover', function () {
  $(this).animate({
    width: "95%"
  }, 500, function() {
    $(this).animate({ width: "100%" }, 500);
  });
});
