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

theCommentsDao = require('../dao/CommentsDao')
theControllerHelper = require('./ControllerHelper')

CommentsController = ->
  'use strict'

  @getCommentsAboutRoute = (pReq, pRes) ->
    routeId = undefined
    callback = undefined
    routeId = pReq.params.routeId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theCommentsDao.getCommentsAboutRoute routeId, callback
    return

  @createComment = (pReq, pRes) ->
    userId = undefined
    routeId = undefined
    message = undefined
    callback = undefined
    userId = pReq.user.accountId
    routeId = pReq.params.routeId
    message = pReq.body.message
    callback = theControllerHelper.createDefaultCallback(pRes)
    theCommentsDao.createComment userId, routeId, message, callback
    return

  @updateComment = (pReq, pRes) ->
    commentId = undefined
    userId = undefined
    message = undefined
    callback = undefined
    commentId = pReq.params.commentId
    userId = pReq.user.accountId
    message = pReq.body.message
    callback = theControllerHelper.createDefaultCallback(pRes)
    theCommentsDao.updateComment userId, commentId, message, callback
    return

  @deleteComment = (pReq, pRes) ->
    userId = undefined
    commentId = undefined
    callback = undefined
    userId = pReq.user.accountId
    commentId = pReq.params.commentId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theCommentsDao.deleteComment userId, commentId, callback
    return

  return

module.exports = new CommentsController
