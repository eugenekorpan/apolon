// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(function() {
	$(document).on('input', '#book_user_id', function() {
		var text = $('#book_user_id').val();

		if(text != '' && text.length >= 3) {
	    $.ajax({
	      type: "POST",
	      url: "/auto_complete/",
	      data: "data=" + $('#book_user_id').val(),
	    });

	    $('#book_user_id').autocomplete('enable');
	  } else {
	  	$('#book_user_id').autocomplete('disable');
	  }
  });
});