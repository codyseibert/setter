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

theBlogDao = require('../dao/BlogDao')
theControllerHelper = require('./ControllerHelper')

BlogController = ->
  'use strict'

  @getPosts = (pReq, pRes) ->
    callback = undefined
    callback = theControllerHelper.createDefaultCallback(pRes)
    theBlogDao.getPosts callback
    return

  @createPost = (pReq, pRes) ->
    html = undefined
    callback = undefined
    if pReq.user.accountId != 1
      pRes.status = 400
      pRes.send error: 'invalid permissions'
      return
    html = pReq.body.html
    callback = theControllerHelper.createDefaultCallback(pRes)
    theBlogDao.createPost html, callback
    return

  @updatePost = (pReq, pRes) ->
    id = undefined
    html = undefined
    callback = undefined
    if pReq.user.accountId != 1
      pRes.status = 400
      pRes.send error: 'invalid permissions'
      return
    html = pReq.body.html
    id = pReq.params.blogId
    callback = theControllerHelper.createDefaultCallback(pRes)
    theBlogDao.updatePost id, html, callback
    return

  return

module.exports = new BlogController
