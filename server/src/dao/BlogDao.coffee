###jslint nomen: true ###

###
Copyright (c) Cody Seibert and Guillermo Martinez

Do not copy, redistribute, sell, modify, etc, without
written legally bound permission from both Cody Seibert and
Guillermo Martinez.
###

theDB = require('../DBConnection')
theMessages = require('../Messages')
theDaoHelper = require('./DaoHelper')

BlogDao = ->
  'use strict'

  @getPosts = (pCallback) ->
    theDaoHelper.executeQuery 'SELECT id, html FROM blogs ORDER BY date DESC', [], theDaoHelper.MULTIPLE, pCallback
    return

  @updatePost = (pBlogId, pHtml, pCallback) ->
    theDaoHelper.executeQuery 'UPDATE blogs SET html = ? WHERE id = ?', [
      pHtml
      pBlogId
    ], theDaoHelper.UPDATE, pCallback
    return

  @createPost = (pHtml, pCallback) ->
    theDaoHelper.executeQuery 'INSERT INTO blogs (html, date) VALUES (?, NOW())', [ pHtml ], theDaoHelper.INSERT, pCallback
    return

  return

module.exports = new BlogDao
