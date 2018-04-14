# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

cancel1 = ->
  $('#cancel1').on 'click', ->
    $('#cancel_form').removeClass('hide')
    $('#cancel_form').toggle
    false
  false
  $('#cancel1_finish').on 'click', ->
    $('#cancel_form').addClass('hide')
    $('#cancel_form').toggle
    false
  false

$(document).on 'turbolinks:load', cancel1
