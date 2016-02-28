###jslint nomen: true ###

###
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
###

theDb = require('../DBConnection')
theDaoHelper = require('./DaoHelper')

ImagesDAO = ->
  'use strict'

  @insertImage = (pUrl, pCallback) ->
    theDaoHelper.executeQuery 'INSERT INTO images (url) VALUES (?)', [ pUrl ], theDaoHelper.INSERT, pCallback
    return

  return

module.exports = new ImagesDAO
