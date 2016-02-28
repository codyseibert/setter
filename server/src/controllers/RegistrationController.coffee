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
theUsersDao = require('../dao/UsersDao')
theSettersDao = require('../dao/SettersDao')
theGymsDao = require('../dao/GymsDao')
theValidator = require('validator')
theCrypt = require('../Crypt')
theLoginHelper = require('./LoginHelper')
Messages = require('../Messages')
theControllerHelper = require('./ControllerHelper')
ChangeCase = require('change-case')

UsersController = ->
  'use strict'
  USER_TYPE = 1
  GYM_TYPE = 2
  validateInputForAccount = undefined

  validateInputForAccount = (pReq, pRes) ->
    body = undefined
    email = undefined
    password = undefined
    body = pReq.body
    email = body.email
    password = body.password
    if !theValidator.isEmail(email)
      pRes.status 400
      pRes.send Messages.error('Invalid Email Format')
      return false
    if !password or password.length < 6
      pRes.status 400
      pRes.send Messages.error('Password too short!')
      return false
    true

  @registerUser = (pReq, pRes) ->
    body = undefined
    email = undefined
    password = undefined
    firstname = undefined
    lastname = undefined
    gymId = undefined
    callback = undefined
    body = pReq.body
    email = body.email
    password = body.password
    firstname = body.firstname
    lastname = body.lastname
    gymId = pReq.body.gym_id
    if !validateInputForAccount(pReq, pRes)
      return
    if !firstname or firstname == ''
      pRes.status 400
      pRes.send Messages.error('Please enter a first name!')
      return false
    if !lastname or lastname == ''
      pRes.status 400
      pRes.send Messages.error('Please enter a last name!')
      return false
    firstname = ChangeCase.titleCase(firstname)
    lastname = ChangeCase.titleCase(lastname)
    theCrypt.crypt password, (err, hash) ->
      theAccountsDao.createAccount email, hash, USER_TYPE, (pResults) ->
        accountId = pResults.id

        callback = (pData) ->
          theLoginHelper.generateAndSendToken accountId, pRes
          return

        theUsersDao.createUser accountId, firstname, lastname, gymId, callback
        return
      return
    return

  @registerGym = (pReq, pRes) ->
    body = undefined
    name = undefined
    email = undefined
    password = undefined
    address = undefined
    callback = undefined
    body = pReq.body
    password = body.password
    email = body.email
    name = body.name
    address = body.address
    if !validateInputForAccount(pReq, pRes)
      return
    if !name or name == ''
      pRes.status 400
      pRes.send Messages.error('Please enter the name of your gym!')
      return
    if !address or address == ''
      pRes.status 400
      pRes.send Messages.error('Please enter the address of your gym!')
      return
    theCrypt.crypt password, (err, hash) ->
      theAccountsDao.createAccount email, hash, GYM_TYPE, (pResults) ->
        accountId = pResults.id

        callback = (pData) ->
          theLoginHelper.generateAndSendToken accountId, pRes
          return

        theGymsDao.createGym accountId, name, address, callback
        return
      return
    return

  return

module.exports = new UsersController
