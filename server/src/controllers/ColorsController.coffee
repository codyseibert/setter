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

theColorsDao = require('../dao/ColorsDao')
theControllerHelper = require('./ControllerHelper')

ColorsController = ->
  'use strict'

  @getColors = (pReq, pRes) ->
    callback = theControllerHelper.createDefaultCallback(pRes)
    theColorsDao.getColors callback
    return

  return

module.exports = new ColorsController
