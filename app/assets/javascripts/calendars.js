# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

var initialize_calendar;

initialize_calendar = void 0;

initialize_calendar = function() {
  $('.calendar').each(function() {
    var calendar;
    calendar = $(this);
    calendar.fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month, agendaWeek, agendaDay'
      },
      selectible: true,
      selectHelper: true,
      editable: true,
      eventLimit: true
    });
  });
};

$(document).on('turbolinks:load', initialize_calendar);
