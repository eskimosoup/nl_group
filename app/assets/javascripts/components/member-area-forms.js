function blockLabels() {
  $('.date-select').each(function() {
    $this = $(this);
    $label = $this.prev('label');
    if ($label.length > 0 ) {
      $label.addClass('display-block');
    }
  });
}

$(function() {
  blockLabels();
});
