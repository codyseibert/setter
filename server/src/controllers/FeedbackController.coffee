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

theFeedbackDao = require('../dao/FeedbackDao')
theControllerHelper = require('./ControllerHelper')

FeedbackController = ->
  'use strict'

  @createFeedback = (pReq, pRes) ->
    name = undefined
    message = undefined
    callback = undefined
    name = pReq.body.name
    message = pReq.body.message
    callback = theControllerHelper.createDefaultCallback(pRes)
    theFeedbackDao.createFeedback name, message, callback
    return

  return

module.exports = new FeedbackController
