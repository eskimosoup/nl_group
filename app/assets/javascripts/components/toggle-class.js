$(document).on("click", ".toggle-class", function(e) {
  var toggleContainer = $(this).attr('data-container');
  var toggleClass     = $(this).attr('data-class');
  var dataReturn      = $(this).attr('data-return');

  $(toggleContainer).toggleClass(toggleClass);

  if (dataReturn === 'false') {
    e.preventDefault();
  }
});

$(document).on("click", ".slide-toggle", function(e) {
  var toggleContainer = $(this).attr('data-container');
  var dataReturn      = $(this).attr('data-return');

  $(toggleContainer).slideToggle(250);
  $(this).children('.fa-chevron-circle-up, .fa-chevron-circle-down').toggleClass('fa-chevron-circle-up fa-chevron-circle-down');

  if (dataReturn === 'false') {
    e.preventDefault();
  }
});
