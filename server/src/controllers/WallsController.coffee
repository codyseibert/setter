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

theWallsDao = require('../dao/WallsDao')
theControllerHelper = require('./ControllerHelper')

WallsController = ->
  'use strict'

  @getWallsInGym = (pReq, pRes) ->
    gymId = undefined
    accountId = undefined
    callback = undefined
    gymId = pReq.params.gymId
    accountId = pReq.user.accountId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theWallsDao.getWallsInGym gymId, accountId, callback
    return

  @getWall = (pReq, pRes) ->
    wallId = undefined
    callback = undefined
    wallId = pReq.params.wallId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theWallsDao.getWall wallId, callback
    return

  @createWall = (pReq, pRes) ->
    wallName = undefined
    gymId = undefined
    callback = undefined
    wallName = pReq.body.wallName
    gymId = pReq.user.accountId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theWallsDao.createWall wallName, gymId, callback
    return

  @updateWall = (pReq, pRes) ->
    gymId = undefined
    wallName = undefined
    wallId = undefined
    callback = undefined
    gymId = pReq.user.accountId
    wallName = pReq.body.wallName
    wallId = pReq.params.wallId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theWallsDao.updateWall gymId, wallId, wallName, callback
    return

  @deleteWall = (pReq, pRes) ->
    gymId = undefined
    wallId = undefined
    callback = undefined
    gymId = pReq.user.accountId
    wallId = pReq.params.wallId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theWallsDao.deleteWall gymId, wallId, callback
    return

  @stripZone = (pReq, pRes) ->
    wallId = undefined
    callback = undefined
    wallId = pReq.params.wallId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theWallsDao.stripZone wallId, callback
    return

  @stripColor = (pReq, pRes) ->
    wallId = undefined
    colorId = undefined
    callback = undefined
    colorId = pReq.params.colorId
    wallId = pReq.params.wallId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theWallsDao.stripColor wallId, colorId, callback
    return

  return

module.exports = new WallsController
