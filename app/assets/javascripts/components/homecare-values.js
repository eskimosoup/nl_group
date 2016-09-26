// http://stackoverflow.com/a/20608147
function truncateString(str, length) {
  return str.length > length ? str.substring(0, length - 3) + '...' : str
}

$(document).ready(function() {
  var truncateLength;

  $('.homecare-value-content p').each(function() {
    var thisLength = $(this).html().length;
    if(truncateLength > thisLength || truncateLength === undefined) {
      truncateLength = $(this).html().length;
    }
  });

  $('.homecare-value-content p').each(function() {
    // http://stackoverflow.com/a/4637957
    var text = $(this).html();

    if(text.length > truncateLength) {
      $(this).attr('data-full-text', text);
      $(this).parent().parent().attr('data-truncated', true);
    }

    var shortText = truncateString(text, truncateLength);

    $(this).html(shortText);
  });

  $('.homecare-value-content[data-truncated=true]').each(function() {
    var html = $(this).html();
    var button = '<a href="#" class="dark-action-button compact expand-truncation">More</a>';
    $(this).html(html + button);
  });
});

$(document).on('click', '.expand-truncation', function() {
  var $truncatedParagraph = $(this).closest('div').find('p');
  var newText = $truncatedParagraph.data('full-text');
  $truncatedParagraph.html(newText);
  $(this).hide();
  return false;
})
