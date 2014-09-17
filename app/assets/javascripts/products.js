$(document).on('ready page:load', function() {
  $('#search-form').submit(function(e) {
    e.preventDefault();
    var searchValue = $('#search').val();
    
    $.getScript('/products?search=' + searchValue)
      .done();
  });

 // $('FORMMMMM').submit(function(e) {
  //   e.preventDefault();

  // });

  if ( $('.pagination').length ) {
    $(window).scroll(function() {
      url = $('.pagination span.next').children().attr('href');
      if ( url && $(window).scrollTop() > $(document).height() - $(window).height() - 50 ) {
        $('.pagination').text('Fetching more products…');
        $.getScript(url);
      }
    });
  };

});