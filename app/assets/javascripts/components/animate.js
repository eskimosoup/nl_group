/*
  Potential usage: data-animation-type="slideInUp" data-animation-delay="500"
  e.g.
    <div data-animation-type="slideInUp" data-animation-delay="500">Animate</div>
  animation-delay is optional
    <div data-animation-type="slideInUp">Animate</div>

  Requirements:
  jQuery onScreen:
    https://github.com/silvestreh/onScreen

  Animate.css
    https://github.com/daneden/animate.css
*/

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
      //doOut: animateOut
    });
  });

  // http://stackoverflow.com/questions/21182535/animate-css-in-hover
  $(document).on('mouseover', '.css-animated-hover', function () {
    var animateClass = $(this).attr('data-class');
    $(this).addClass('animated ' + animateClass);
  });

  $('.css-animated-hover').bind('animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd', function() {
    var animateClass = $(this).attr('data-class');
    $(this).removeClass('animated ' + animateClass);
  });
}
