# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#book_user_id').autocomplete
    minLength: 3,
    delay: 1,
    source: $('#book_user_id').data('autocomplete-source')