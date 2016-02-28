theDB = require('../DBConnection')
theMessages = require('../Messages')
theDaoHelper = require('../dao/DaoHelper')
theUsersDao = require('../dao/UsersDao')
theProgressionsDao = require('../dao/ProgressionsDao')
theSendsController = require('../controllers/SendsController')
theDaoHelper.executeQuery 'DELETE FROM progressions', [], theDaoHelper.MULTIPLE, (pUsers) ->
  theDaoHelper.executeQuery 'SELECT account_id FROM users', [], theDaoHelper.DELETE, (pUsers) ->
    i = 0
    while i < pUsers.length
      userId = pUsers[i].account_id
      theDaoHelper.executeQuery 'SELECT s.date, bg.value AS bg, rg.value AS rg, lg.value AS lg, s.user_id FROM sends s ' + 'INNER JOIN routes r ON s.route_id = r.id ' + 'LEFT JOIN boulder_grades bg ON bg.id = r.boulder_grade_id ' + 'LEFT JOIN rope_grades rg ON rg.id = r.toprope_grade_id ' + 'LEFT JOIN rope_grades lg ON lg.id = r.lead_grade_id ' + 'WHERE s.user_id = ? ORDER BY s.date ASC', [ userId ], theDaoHelper.MULTIPLE, (pSends) ->
        if pSends.length == 0
          return
        bouldering = 0
        bouldering_count = 0
        bouldering_avg = 0
        toprope = 0
        toprope_count = 0
        toprope_avg = 0
        lead = 0
        lead_count = 0
        lead_avg = 0
                j = 0
        while j < pSends.length
          send = pSends[j]
          pUserId = send.user_id
          if send.bg
            bouldering += send.bg
            bouldering_count++
            bouldering_avg = bouldering / bouldering_count
          if send.rg
            toprope += send.rg
            toprope_count++
            toprope_avg = toprope / toprope_count
          if send.lg
            lead += send.lg
            lead_count++
            lead_avg = lead / lead_count
          if !send.rg and !send.lg and !send.bg
            j++
            continue
          theDaoHelper.executeQuery 'INSERT INTO progressions (user_id, bouldering_grade, toprope_grade, lead_grade, date) VALUES (?, ?, ?, ?, DATE_FORMAT(?, \'%Y-%m-01\')) ON DUPLICATE KEY UPDATE bouldering_grade = ?, toprope_grade = ?, lead_grade = ?', [
            pUserId
            bouldering_avg
            toprope_avg
            lead_avg
            send.date
            bouldering_avg
            toprope_avg
            lead_avg
          ], theDaoHelper.INSERT, ->
            console.log '(✿ ◕‿◕) ᓄ✂╰U╯'
            return
          j++
        return
      i++
    return
  return
