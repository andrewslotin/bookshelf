# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).bind "page:change", (event) =>
    $('#book_cover, #book_remove_cover').change (event) => 
      console.log(event.target.form.submit())
  
  $(document).trigger "page:change"