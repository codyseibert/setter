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

theAccountsDao = require('../dao/AccountsDao')
theWallsDao = require('../dao/WallsDao')
theImagesDao = require('../dao/ImagesDao')
easyimage = require('easyimage')
path = require('path')

###*
    Used for posting new images to the file system.
###

ImagesController = ->
  'use strict'

  handleImage = (req, res, pCallback) ->
    MAX_WIDTH = 400
    image = undefined
    width = undefined
    height = undefined
    new_width = undefined
    new_height = undefined
    ratio = undefined
    extension = undefined
    base = undefined
    if !req.files or !req.files.file or !req.files.file.name
      res.send 'error'
      return
    image = req.files.file
    base = process.env.PWD
    # Read in the image
    easyimage.info(image.path).then (file) ->
      # Get image properties
      width = file.width
      height = file.height
      ratio = width / height
      extension = image.extension
      new_width = MAX_WIDTH
      new_height = MAX_WIDTH / ratio
      easyimage.resize(
        width: new_width
        height: new_height
        src: image.path
        dst: base + '/public/images/uploads/' + image.name.replace(extension, '_scaled.' + extension)).then ->
        theImagesDao.insertImage 'images/uploads/' + image.name, (pResults) ->
          ret = 
            id: pResults.id
            url: 'images/uploads/' + image.name.replace(extension, '_scaled.' + extension)
          pCallback ret
          return
        return
      return
    return

  @uploadAccountImage = (pReq, pRes) ->
    accountId = pReq.user.accountId
    handleImage pReq, pRes, (pRet) ->
      theAccountsDao.updateImage pRet.id, accountId, (pResults) ->
        pRes.send pRet
        return
      return
    return

  @uploadWallImage = (pReq, pRes) ->
    wallId = pReq.params.wallId
    handleImage pReq, pRes, (pRet) ->
      theWallsDao.updateImage pRet.id, wallId, (pResults) ->
        pRes.send pRet
        return
      return
    return

  return

module.exports = new ImagesController
