# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


@day_btn_f = ->
  $('.day_btn').on 'click', (e) ->
    spn = $(this).closest('.box50')
    inp = spn.find('input')
    hrf = spn.find('a')
    inpv = inp.val()
    if e.shiftKey
      days = $(this).parent().parent().find('.day_hid')
      stop = days.index(inp.first()) - 1
      i = stop
      while i >= 0
        if $(days[i]).val() == '0'
          $(days[i]).val(1)
          dhrf = $(days[i]).parent().find('a')
          dhrf.addClass('weekends_color')
        else
          break
        i -= 1
    if inpv == '0'
      inp.val(1)
      hrf.addClass('weekends_color')
    else
      inp.val(0)
      hrf.removeClass('weekends_color')
    false
  false


@day_btn_f2 = ->
  $('.day_btn2').on 'click', (e) ->
    spn = $(this).closest('.box50')
    inp = spn.find('input')
    hrf = spn.find('a')
    inpv = inp.val()
    if e.shiftKey
      days = $(this).parent().parent().find('.day_hid')
      stop = days.index(inp.first()) - 1
      i = stop
      while i >= 0
        if $(days[i]).val() == '0'
          $(days[i]).val(1)
          dhrf = $(days[i]).parent().find('a')
          dhrf.addClass('vocations_color')
        else
          break
        i -= 1
    if inpv == '0'
      inp.val(1)
      hrf.addClass('vocations_color')
    else
      inp.val(0)
      hrf.removeClass('vocations_color')
    false
  false

$(document).on 'turbolinks:load', window.day_btn_f
$(document).on 'turbolinks:load', window.day_btn_f2
$(document).on 'turbolinks:load', window.day_btn_f3
