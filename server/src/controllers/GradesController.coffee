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

theGradesDao = require('../dao/GradesDao')
theControllerHelper = require('./ControllerHelper')

GradesController = ->
  'use strict'

  @getBoulderGrades = (pReq, pRes) ->
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGradesDao.getBoulderGrades callback
    return

  @getRopeGrades = (pReq, pRes) ->
    callback = theControllerHelper.createDefaultCallback(pRes)
    theGradesDao.getRopeGrades callback
    return

  return

module.exports = new GradesController
