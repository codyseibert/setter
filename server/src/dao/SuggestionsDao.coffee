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

SuggestionsDao = ->
  'use strict'

  @getSuggestions = (pAccountId, pCallback) ->
    theDaoHelper.executeQuery 'SELECT s.id, s.suggestion, ' + '(SELECT COUNT(*) FROM suggestions_upvotes su WHERE su.account_id = ? AND su.suggestion_id = s.id) AS disabled, ' + '(SELECT COUNT(*) FROM suggestions_upvotes su WHERE suggestion_id = s.id) AS upvotes ' + 'FROM suggestions s', [ pAccountId ], theDaoHelper.MULTIPLE, pCallback
    return

  @createSuggestion = (pAccountId, pSuggestion, pCallback) ->
    theDaoHelper.executeQuery 'INSERT INTO suggestions (account_id, suggestion) VALUES (?, ?)', [
      pAccountId
      pSuggestion
    ], theDaoHelper.INSERT, pCallback
    return

  @upvoteSuggestion = (pAccountId, pSuggestionId, pCallback) ->
    theDaoHelper.executeQuery 'INSERT INTO suggestions_upvotes (account_id, suggestion_id) VALUES (?, ?)', [
      pAccountId
      pSuggestionId
    ], theDaoHelper.INSERT, pCallback
    return

  return

module.exports = new SuggestionsDao
