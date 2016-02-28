###jslint nomen: true ###

###jslint unparam: true###

###jslint unparam: true, nomen: true###

###
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
###

theGymSuggestionsDao = require('../dao/GymSuggestionsDao')
theControllerHelper = require('./ControllerHelper')

GymsSuggestionsController = ->
  'use strict'

  @getSuggestionsForGym = (pReq, pRes) ->
    gymId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymSuggestionsDao.getSuggestionsForGym gymId, callback
    return

  @createSuggestion = (pReq, pRes) ->
    gymId = undefined
    userId = undefined
    message = undefined
    callback = undefined
    gymId = pReq.params.gymId
    userId = pReq.user.accountId
    message = pReq.body.message
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymSuggestionsDao.createSuggestion gymId, userId, message, callback
    return

  @markAsRead = (pReq, pRes) ->
    suggestionId = undefined
    callback = undefined
    suggestionId = pReq.params.suggestionId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymSuggestionsDao.markAsRead suggestionId, callback
    return

  return

module.exports = new GymsSuggestionsController
