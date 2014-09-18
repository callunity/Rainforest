$(document).on('ready page:load', function() {
  $('#product_form').hide();

  if ( $('.pagination').length ) {
    $(window).scroll(function() {
      url = $('.pagination span.next').children().attr('href');
      if ( url && $(window).scrollTop() > $(document).height() - $(window).height() - 50 ) {
        $('.pagination').text('Fetching more products…');
        $.getScript(url);
      }
    });
  };

  $('#search-form').on('submit',function(e) {
    e.preventDefault();
    var searchValue = $('#search').val();
    
    $.getScript('/products?search=' + searchValue)
    .done(function(data) {
      $('#all_products').html(data);
    });
  });

  $('#add_new_product').on('click', function(e) {
    e.preventDefault();

    $('#product_form').toggle();
  });



  $('#submit_review').on('click', function(e) {
    e.preventDefault();

    $('#reviews').toggle();
  });


});