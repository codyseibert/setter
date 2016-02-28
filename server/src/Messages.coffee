###jslint nomen: true ###

###
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
###

###*
    Holds all the potential messages which could be returned to the client
###

Messages = ->
  'use strict'

  @error = (pMessage) ->
    { error: pMessage }

  @SUCCESS = {}
  @ERROR = @error('default error')
  return

module.exports = new Messages
