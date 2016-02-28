theDB = require('../DBConnection')
theMessages = require('../Messages')
theDaoHelper = require('../dao/DaoHelper')
theUsersDao = require('../dao/UsersDao')
theDaoHelper.executeQuery 'SELECT account_id FROM users', [], theDaoHelper.MULTIPLE, (pData) ->
  i = 0
  while i < pData.length
    id = pData[i].account_id

    refreshBoulderingGrade = (pUserId) ->
      theUsersDao.computeBoulderGrade pUserId, (pData) ->
        theUsersDao.setBoulderGrade pUserId, pData.grade, (pData) ->
        return
      return

    refreshTopRopeGrade = (pUserId) ->
      theUsersDao.computeTopRopeGrade pUserId, (pData) ->
        theUsersDao.setTopRopeGrade pUserId, pData.grade, (pData) ->
        return
      return

    refreshLeadGrade = (pUserId) ->
      theUsersDao.computeLeadGrade pUserId, (pData) ->
        theUsersDao.setLeadGrade pUserId, pData.grade, (pData) ->
        return
      return

    refreshBoulderingGrade id
    refreshTopRopeGrade id
    refreshLeadGrade id
    i++
  return
