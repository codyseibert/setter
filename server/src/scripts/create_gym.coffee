theCrypt = require('../Crypt')
theDB = require('../DBConnection')
theMessages = require('../Messages')
theDaoHelper = require('../dao/DaoHelper')
randomstring = require('just.randomstring')
USER_TYPE = 2
TOKEN = randomstring(20)
EMAIL = 'blank@gmail.com'
GYM_NAME = 'Boulder Rock Club'
ADDRESS = '2829 Mapleton Avenue, Boulder, CO 80301'
PASSWORD = 'poopoo'
theCrypt.crypt PASSWORD, (err, hash) ->

  accountCreatedCallback = (pResults) ->
    theDaoHelper.executeQuery 'INSERT INTO gyms (account_id, name, address) VALUES (?, ?, ?)', [
      pResults.id
      GYM_NAME
      ADDRESS
    ], theDaoHelper.INSERT, ->
      console.log 'done'
      return
    return

  theDaoHelper.executeQuery 'INSERT INTO accounts (email, password, type_id, token) VALUES (?, ?, ?, ?)', [
    EMAIL
    hash
    USER_TYPE
    TOKEN
  ], theDaoHelper.INSERT, accountCreatedCallback
  return
