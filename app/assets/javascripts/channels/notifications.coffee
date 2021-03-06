# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
 
  disconnected: ->
    # Called when the subscription has been terminated by the server
 
  received: (data) ->
    # Called when theres incoming data on the websocket for this channel
    # this.update_counter(data.counter)
    # $('#notificationList').prepend "#{data.notification}"
    this.update_counter(data.counter)
 
 
  update_counter: (counter) ->
    $counter = $('#notification-counter')
    val = parseInt $counter.text()
    val++
    $counter
    .css({opacity: 0})
    .text(val)
    .css({top: '-10px'})
    .transition({top: '-2px', opacity: 1})
