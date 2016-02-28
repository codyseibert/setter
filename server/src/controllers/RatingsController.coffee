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

theRatingsDao = require('../dao/RatingsDao')
theControllerHelper = require('./ControllerHelper')

RatingsController = ->
  'use strict'

  @getRatingsForRoute = (pReq, pRes) ->
    routeId = undefined
    callback = undefined
    routeId = pReq.params.routeId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theRatingsDao.getRatingForRoute routeId, callback
    return

  @updateRating = (pReq, pRes) ->
    userId = undefined
    routeId = undefined
    rating = undefined
    callback = undefined
    userId = pReq.user.accountId
    routeId = pReq.params.routeId
    rating = pReq.body.rating
    callback = theControllerHelper.createDefaultCallback(pRes)
    theRatingsDao.updateRating userId, routeId, rating, callback
    return

  @hasRated = (pReq, pRes) ->
    userId = undefined
    routeId = undefined
    callback = undefined
    userId = pReq.user.accountId
    routeId = pReq.params.routeId
    callback = theControllerHelper.createNoStatusDefaultCallback(pRes)
    theRatingsDao.hasRated userId, routeId, callback
    return

  return

module.exports = new RatingsController
