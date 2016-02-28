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

theSuggestionsDao = require('../dao/SuggestionsDao')
theControllerHelper = require('./ControllerHelper')

SuggestionsController = ->
  'use strict'

  @getSuggestions = (pReq, pRes) ->
    accountId = undefined
    callback = undefined
    accountId = pReq.user.accountId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theSuggestionsDao.getSuggestions accountId, callback
    return

  @createSuggestion = (pReq, pRes) ->
    suggestion = undefined
    accountId = undefined
    callback = undefined
    accountId = pReq.user.accountId
    suggestion = pReq.body.suggestion
    callback = theControllerHelper.createDefaultCallback(pRes)
    theSuggestionsDao.createSuggestion accountId, suggestion, callback
    return

  @upvoteSuggestion = (pReq, pRes) ->
    accountId = undefined
    suggestionId = undefined
    callback = undefined
    accountId = pReq.user.accountId
    suggestionId = pReq.params.suggestionId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theSuggestionsDao.upvoteSuggestion accountId, suggestionId, callback
    return

  return

module.exports = new SuggestionsController
