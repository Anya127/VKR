# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#calendar').fullCalendar
    weekends: true
  
    firstDay: 1
    height: 600
    header:
      left: 'prevYear,prev,next,nextYear today'
      center: 'title'
      right: 'month,agendaWeek,agendaDay'
    monthNames: [
      'Январь'
      'Февраль'
      'Март'
      'Апрель'
      'Май'
      'Июнь'
      'Июль'
      'Август'
      'Сентябрь'
      'Октябрь'
      'Ноябрь'
      'Декабрь'
    ]
    monthNamesShort: [
      'Янв.'
      'Фев.'
      'Март'
      'Апр.'
      'Май'
      'Июнь'
      'Июль'
      'Авг.'
      'Сент.'
      'Окт.'
      'Ноя.'
      'Дек.'
    ]
    dayNames: [
      'Воскресенье'
      'Понедельник'
      'Вторник'
      'Среда'
      'Четверг'
      'Пятница'
      'Суббота'
    ]
    dayNamesShort: [
      'ВС'
      'ПН'
      'ВТ'
      'СР'
      'ЧТ'
      'ПТ'
      'СБ'
    ]
    buttonText:
      prev: '<- мес'
      next: 'мес ->'
      prevYear: '<- год'
      nextYear: 'год ->'
      today: 'Сегодня'
      year: 'Год'
      month: 'Месяц'
      week: 'Неделя'
      day: 'День'
  return

orm.dialog
  autoOpen: false
  buttons: [
    {
      id: 'add'
      text: 'Добавить'
      click: ->
        $(this).dialog 'add'
        emptyForm()

        #some code
        return

    }
    {
      id: 'edit'
      text: 'Изменить'
      click: ->
        #some code
        return

    }
    {
      id: 'cancel'
      text: 'Отмена'
      click: ->
        $(this).dialog 'close'
        emptyForm()
        return

    }
    {
      id: 'delete'
      text: 'Удалить'
      click: ->
        #some code
        return
      disabled: true
    }
  ]


event_start = $('#event_start')
event_end = $('#event_end')
event_type = $('#event_type')
calendar = $('#calendar')
form = $('#dialog-form')
event_id = $('#event_id')
format = 'MM/dd/yyyy HH:mm'

### кнопка добавления события ###

###* функция очистки формы ###

event_start = $('#event_start')
event_end = $('#event_end')
event_type = $('#event_type')
calendar = $('#calendar')
form = $('#dialog-form')
event_id = $('#event_id')
format = 'MM/dd/yyyy HH:mm'

### кнопка добавления события ###

###* функция очистки формы ###

emptyForm = ->
  event_start.val ''
  event_end.val ''
  event_type.val ''
  event_id.val ''
  return

### режимы открытия формы ###

formOpen = (mode) ->
  if mode == 'add'

    ### скрываем кнопки Удалить, Изменить и отображаем Добавить###

    $('#add').show()
    $('#edit').hide()
    $('#delete').button 'option', 'disabled', true
  else if mode == 'edit'

    ### скрываем кнопку Добавить, отображаем Изменить и Удалить###

    $('#edit').show()
    $('#add').hide()
    $('#delete').button 'option', 'disabled', false
  form.dialog 'open'
  return

$('#add_event_button').button().click ->
  formOpen 'add'
  return
