// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree ./vendor/foundation/libraries
//= require vendor/foundation/foundation.js
//= requrie vendor/foundation/foundation.equalizer.js
//= require slick.js/slick.js
//= require colorbox/jquery.colorbox.js
//= require components/toggle-class.js
//= require components/clients-slider.js
//= require components/sticky-scroll.js
//= require components/member-area-forms
//= require components/active-class
//= require components/modal
//= require vendor/matchheight.js
//= require vendor/uncomment.js
//= require cocoon

$(document).foundation();

$(function() {

  if (Modernizr.mq('only screen and (min-width: 768px)')) {
    $('.colorbox').colorbox({
      width: '70%',
      maxWidth: '960px',
      height: '70%',
      maxHeight: '960px'
    });

    $('.colorbox-iframe, a[href="/contacts/remote"]').colorbox({
      width: '70%',
      iframe: true,
      maxWidth: '960px',
      height: '70%',
      maxHeight: '960px'
    });
  } else {
    $('.home-team-members .colorbox').attr('href', '');
  }

  $('.reason-title').matchHeight({
    byRow: false,
    proprety: 'height'
  });

  $('.reason-content').matchHeight({
    byRow: false,
    proprety: 'height'
  });
});
