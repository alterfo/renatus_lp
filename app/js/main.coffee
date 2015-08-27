
console.log("Hello")

$ = require('jquery')

global.jQuery = $

foundation = require('foundation')

$(document).foundation()

$.fn.countdown = (options) ->
  thisEl = $(this)

  settings =
    'date': null
    'format': null

  if options
    $.extend settings, options

  countdown_proc = ->
    eventDate = Date.parse(settings['date']) / 1000
    currentDate = Math.floor($.now() / 1000)
    if eventDate <= currentDate
      callback.call this
      clearInterval interval
    seconds = eventDate - currentDate
    days = Math.floor(seconds / (60 * 60 * 24))
    seconds -= days * 60 * 60 * 24
    hours = Math.floor(seconds / (60 * 60))
    seconds -= hours * 60 * 60
    minutes = Math.floor(seconds / 60)
    seconds -= minutes * 60
    if days == 1
      thisEl.find('.timeRefDays').text 'День'
    else
      thisEl.find('.timeRefDays').text 'Дней'
    if hours == 1
      thisEl.find('.timeRefHours').text 'Час'
    else
      thisEl.find('.timeRefHours').text 'Часов'
    if minutes == 1
      thisEl.find('.timeRefMinutes').text 'Минута'
    else
      thisEl.find('.timeRefMinutes').text 'Минут'
    if seconds == 1
      thisEl.find('.timeRefSeconds').text 'Секунда'
    else
      thisEl.find('.timeRefSeconds').text 'Секунд'
    if settings['format'] == 'on'
      days = if String(days).length >= 2 then days else '0' + days
      hours = if String(hours).length >= 2 then hours else '0' + hours
      minutes = if String(minutes).length >= 2 then minutes else '0' + minutes
      seconds = if String(seconds).length >= 2 then seconds else '0' + seconds
    if !isNaN(eventDate)
      thisEl.find('.days').text days
      thisEl.find('.hours').text hours
      thisEl.find('.minutes').text minutes
      thisEl.find('.seconds').text seconds
    else
      alert 'Invalid date. Here\'s an example: 12 Tuesday 2012 17:30:00'
      clearInterval interval
    return

  countdown_proc()
  interval = setInterval(countdown_proc, 1000)
  return



$('.countdown').countdown {
  date: '2 february 2016 6:19:00'
  format: 'on'
}

