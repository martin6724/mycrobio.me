// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// ****** Image Animation ***** //
// function myFunction() {
//    location.reload();
// }

// Wrap every letter in a span
$(function() {
  $('.intro').addClass('go');

  $('.reload').click(function() {
    $('.intro').removeClass('go').delay(200).queue(function(next) {
      $('.intro').addClass('go');
      next();
    });

  });
})
