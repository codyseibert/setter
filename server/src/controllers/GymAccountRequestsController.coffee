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

theGymAccountRequestsDao = require('../dao/GymAccountRequestsDao')
theControllerHelper = require('./ControllerHelper')

GymAccountRequestsController = ->
  'use strict'

  @createGymAccountRequest = (pReq, pRes) ->
    email = undefined
    name = undefined
    address = undefined
    callback = undefined
    email = pReq.body.email
    name = pReq.body.name
    address = pReq.body.address
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGymAccountRequestsDao.createGymAccountRequest email, name, address, callback
    return

  return

module.exports = new GymAccountRequestsController
