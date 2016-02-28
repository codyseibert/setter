###jslint nomen: true ###

bcrypt = require('bcrypt-nodejs')

Crypt = ->
  'use strict'

  @crypt = (password, callback) ->
    bcrypt.genSalt 10, (err, salt) ->
      if err
        return callback(err)
      bcrypt.hash password, salt, null, (err, hash) ->
        callback err, hash
      return
    return

  @check = (password, hash, callback) ->
    bcrypt.compare password, hash, (err, isPasswordMatch) ->
      if err
        return callback(err)
      callback null, isPasswordMatch
    return

  return

module.exports = new Crypt
