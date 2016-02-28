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

CommentsDao = ->
  'use strict'

  @getCommentsAboutRoute = (pRouteId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT c.id, i.url, c.message, u.account_id, CONCAT(u.firstname, \' \', u.lastname) AS name, c.date FROM comments c ' + 'INNER JOIN users u ON u.account_id = c.user_id ' + 'INNER JOIN accounts a ON a.id = u.account_id ' + 'LEFT JOIN images i ON a.image_id = i.id ' + 'WHERE c.route_id = ? ORDER BY c.date DESC', [ pRouteId ], theDaoHelper.MULTIPLE, pCallback
    return

  @createComment = (pUserId, pRouteId, pMessage, pCallback) ->
    theDaoHelper.executeQuery 'INSERT INTO comments (user_id, route_id, message, date) VALUES (?, ?, ?, NOW())', [
      pUserId
      pRouteId
      pMessage
    ], theDaoHelper.INSERT, pCallback
    return

  @updateComment = (pUserId, pCommentId, pMessage, pCallback) ->
    theDaoHelper.executeQuery 'UPDATE comments SET message = ? WHERE id = ? AND user_id = ?', [
      pMessage
      pCommentId
      pUserId
    ], theDaoHelper.UPDATE, pCallback
    return

  @deleteComment = (pUserId, pCommentId, pCallback) ->
    theDaoHelper.executeQuery 'DELETE FROM comments WHERE id = ? AND user_id = ?', [
      pCommentId
      pUserId
    ], theDaoHelper.DELETE, pCallback
    return

  return

module.exports = new CommentsDao
