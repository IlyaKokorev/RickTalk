jQuery(document).on 'turbolinks:load', ->
  App.online = App.cable.subscriptions.create "OnlineChannel",
    connected: ->
      console.log('Connected to OnlineChannel')

    disconnected: ->
      console.log('Disconnected from OnlineChannel')

    received: (data) ->

