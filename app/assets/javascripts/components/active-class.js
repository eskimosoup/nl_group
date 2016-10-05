// Adapted from
// http://stackoverflow.com/a/9980042 & http://jsfiddle.net/mekwall/up4nu/

// Cache selectors
var lastId,
  topMenu = $(".fixed-wrap"),
  topMenuHeight = topMenu.height(),
  // All list items
  menuItems = topMenu.find('.menu-link'),
  // Anchors corresponding to menu items
  scrollItems = menuItems.map(function() {
    var href = $(this).attr('href');
    if(href.indexOf('#') === 1) {
      var item = $(href.replace('/', ''));
      if (item.length) {
        return item;
      }
    }
  });

// Bind to scroll
$(window).scroll(function() {
  // Get container scroll position
  var fromTop = $(this).scrollTop() + topMenuHeight;

  // Get id of current scroll item
  var cur = scrollItems.map(function() {
    if ($(this).offset().top < fromTop)
      return this;
  });

  // Get the id of the current element
  cur = cur[cur.length - 1];
  var id = cur && cur.length ? cur[0].id : "";

  if (lastId !== id) {
    lastId = id;
    // Set/remove active class
    menuItems.removeClass('active');
      $('[href="#' + id + '"]').addClass('active');
  }
});
