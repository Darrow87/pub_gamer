$(document).ready(function() {
  $('.venue-create-game').on('click', function(event){
    clicked_div = event.target.closest('.venue-create-game')
    $(clicked_div).toggleClass('select-venue-game');
    $(clicked_div).find('input').prop('checked', !$(clicked_div).find('input').prop('checked'));
  })
});
  // $("#event-create-container").dialog({
  //   modal: true,
  //   autoOpen: false,
  //   minHeight: 500,
  //   width: 500,
  //   // appendTo: '#event-create-ajax-div',
  //   position: ({ my:"top", at: "bottom", of: "#header-row"}),
  //   show: {
  //       effect: "blind",
  //       duration: 1000
  //   },
  //   hide: {
  //       effect: "explode",
  //       duration: 1000
  //   }
  // });

  // $('#event-create-link').on('click', function(event){
    // event.preventDefault()
    // if (window.location.pathname.includes("venue") ) {
    //   barName = $('#venue-name').text()
    //   barAddress = $('#venue-address').text()
    //   $('#event_location').val(barName);
    //   $('#event_location').prop('readonly', true);
    //   $('#event_address').val(barAddress);
    //   $('#event_address').prop('readonly', true);
    // }
    // $("#event-create-container").dialog('open');
  // })