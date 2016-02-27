###jslint nomen: true ###

###global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false, jsPDF: false, naturalSort: false ###

angular.module('SETTER').factory 'MessageService', [ ->
  'use strict'
  listeners = {}
  queue = []

  Listener = (pEvent, pKey, pCallback) ->
    @event = pEvent
    @callback = pCallback
    @key = pKey
    return

  {
    listen: (pEvent, pKey, pCallback) ->
      if !listeners[pKey]
        listeners[pKey] = {}
      listeners[pKey][pEvent] = new Listener(pEvent, pKey, pCallback)
      i = 0
      while i < queue.length
        event = queue[i]
        if pEvent == event
          pCallback event.data
        i++
      return
    send: (pEvent, pData) ->
      for key of listeners
        listener = listeners[key]
        if listener[pEvent]
          listener[pEvent].callback pData
      queue.push
        event: pEvent
        data: pData
      return

  }
 ]
