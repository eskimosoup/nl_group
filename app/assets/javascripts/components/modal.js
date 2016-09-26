$(document).on('click', '.modal-wrap', function(e) {
  if (e.target !== this)
    return;

  $(this).removeClass('visible');
});
