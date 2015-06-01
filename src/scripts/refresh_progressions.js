var theDB = require('../DBConnection');
var theMessages = require('../Messages');
var theDaoHelper = require('../dao/DaoHelper');
var theUsersDao = require('../dao/UsersDao');
var theProgressionsDao = require('../dao/ProgressionsDao');
var theSendsController = require('../controllers/SendsController');

theDaoHelper.executeQuery(
    'DELETE FROM progressions',
    [],
    theDaoHelper.MULTIPLE,
    function (pUsers) {

      theDaoHelper.executeQuery(
          'SELECT account_id FROM users',
          [],
          theDaoHelper.DELETE,
          function (pUsers) {
            for (var i = 0; i < pUsers.length; i++){
              var userId = pUsers[i].account_id;

              theDaoHelper.executeQuery(
                  'SELECT s.date, bg.value AS bg, rg.value AS rg, lg.value AS lg, s.user_id FROM sends s ' +
                      'INNER JOIN routes r ON s.route_id = r.id ' +
                      'LEFT JOIN boulder_grades bg ON bg.id = r.boulder_grade_id ' +
                      'LEFT JOIN rope_grades rg ON rg.id = r.toprope_grade_id ' +
                      'LEFT JOIN rope_grades lg ON lg.id = r.lead_grade_id ' +
                      'WHERE s.user_id = ? ORDER BY s.date ASC',
                  [userId],
                  theDaoHelper.MULTIPLE,
                  function (pSends) {

                      if (pSends.length === 0) return;

                      var bouldering = 0;
                      var bouldering_count = 0;
                      var bouldering_avg = 0;

                      var toprope = 0;
                      var toprope_count = 0;
                      var toprope_avg = 0;

                      var lead = 0;
                      var lead_count = 0;
                      var lead_avg = 0;

                      for (var j = 0; j < pSends.length; j++) {
                          var send = pSends[j];
                          var pUserId = send.user_id;

                          if (send.bg) {
                              bouldering += send.bg;
                              bouldering_count++;
                              bouldering_avg = bouldering / bouldering_count
                          }

                          if (send.rg) {
                              toprope += send.rg;
                              toprope_count++;
                              toprope_avg = toprope / toprope_count
                          }

                          if (send.lg) {
                              lead += send.lg;
                              lead_count++;
                              lead_avg = lead / lead_count;
                          }

                          if (!send.rg && !send.lg && !send.bg)
                            continue;

                          theDaoHelper.executeQuery(
                              "INSERT INTO progressions (user_id, bouldering_grade, toprope_grade, lead_grade, date) VALUES (?, ?, ?, ?, DATE_FORMAT(?, '%Y-%m-01')) ON DUPLICATE KEY UPDATE bouldering_grade = ?, toprope_grade = ?, lead_grade = ?",
                              [pUserId, bouldering_avg, toprope_avg, lead_avg, send.date, bouldering_avg, toprope_avg, lead_avg],
                              theDaoHelper.INSERT,
                              function () {
                                  console.log('(✿ ◕‿◕) ᓄ✂╰U╯');
                              }
                          );
                      }
                  }
              );

            }
          }
      );
    }
  );
