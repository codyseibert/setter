
var __cov_8Mmk80O9EVvFty7pNxkC1w = (Function('return this'))();
if (!__cov_8Mmk80O9EVvFty7pNxkC1w.__coverage__) { __cov_8Mmk80O9EVvFty7pNxkC1w.__coverage__ = {}; }
__cov_8Mmk80O9EVvFty7pNxkC1w = __cov_8Mmk80O9EVvFty7pNxkC1w.__coverage__;
if (!(__cov_8Mmk80O9EVvFty7pNxkC1w['src/dao/RoutesDao.js'])) {
   __cov_8Mmk80O9EVvFty7pNxkC1w['src/dao/RoutesDao.js'] = {"path":"src/dao/RoutesDao.js","s":{"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0,"8":0,"9":0,"10":0,"11":0,"12":0,"13":0,"14":0,"15":0},"b":{},"f":{"1":0,"2":0,"3":0,"4":0,"5":0,"6":0},"fnMap":{"1":{"name":"(anonymous_1)","line":20,"loc":{"start":{"line":20,"column":16},"end":{"line":20,"column":28}}},"2":{"name":"(anonymous_2)","line":23,"loc":{"start":{"line":23,"column":20},"end":{"line":23,"column":46}}},"3":{"name":"(anonymous_3)","line":35,"loc":{"start":{"line":35,"column":26},"end":{"line":35,"column":55}}},"4":{"name":"(anonymous_4)","line":47,"loc":{"start":{"line":47,"column":23},"end":{"line":47,"column":90}}},"5":{"name":"(anonymous_5)","line":55,"loc":{"start":{"line":55,"column":23},"end":{"line":55,"column":95}}},"6":{"name":"(anonymous_6)","line":63,"loc":{"start":{"line":63,"column":23},"end":{"line":63,"column":49}}}},"statementMap":{"1":{"start":{"line":11,"column":0},"end":{"line":11,"column":39}},"2":{"start":{"line":12,"column":0},"end":{"line":12,"column":41}},"3":{"start":{"line":13,"column":0},"end":{"line":13,"column":42}},"4":{"start":{"line":20,"column":0},"end":{"line":70,"column":2}},"5":{"start":{"line":23,"column":4},"end":{"line":33,"column":6}},"6":{"start":{"line":24,"column":8},"end":{"line":32,"column":10}},"7":{"start":{"line":35,"column":4},"end":{"line":45,"column":6}},"8":{"start":{"line":36,"column":8},"end":{"line":44,"column":10}},"9":{"start":{"line":47,"column":4},"end":{"line":53,"column":6}},"10":{"start":{"line":48,"column":8},"end":{"line":52,"column":10}},"11":{"start":{"line":55,"column":4},"end":{"line":61,"column":6}},"12":{"start":{"line":56,"column":8},"end":{"line":60,"column":10}},"13":{"start":{"line":63,"column":4},"end":{"line":69,"column":6}},"14":{"start":{"line":64,"column":8},"end":{"line":68,"column":10}},"15":{"start":{"line":72,"column":0},"end":{"line":72,"column":33}}},"branchMap":{}};
}
__cov_8Mmk80O9EVvFty7pNxkC1w = __cov_8Mmk80O9EVvFty7pNxkC1w['src/dao/RoutesDao.js'];
__cov_8Mmk80O9EVvFty7pNxkC1w.s['1']++;var theDB=require('../DBConnection');__cov_8Mmk80O9EVvFty7pNxkC1w.s['2']++;var theMessages=require('../Messages');__cov_8Mmk80O9EVvFty7pNxkC1w.s['3']++;var theDaoHelper=require('./DaoHelper');__cov_8Mmk80O9EVvFty7pNxkC1w.s['4']++;var RoutesDao=function(){'use strict';__cov_8Mmk80O9EVvFty7pNxkC1w.f['1']++;__cov_8Mmk80O9EVvFty7pNxkC1w.s['5']++;this.getRoute=function(pId,pCallback){__cov_8Mmk80O9EVvFty7pNxkC1w.f['2']++;__cov_8Mmk80O9EVvFty7pNxkC1w.s['6']++;theDaoHelper.executeQuery('SELECT r.id, r.name, r.grade_id, g.grade, r.color_id, c.value, s.firstname, s.lastname, r.date FROM routes r '+'INNER JOIN setters s ON r.setter_id = s.id '+'INNER JOIN grades g ON r.grade_id = g.id '+'INNER JOIN colors c ON r.color_id = c.id '+'WHERE r.id = ?',[pId],pCallback);};__cov_8Mmk80O9EVvFty7pNxkC1w.s['7']++;this.getRoutesInSet=function(pSetId,pCallback){__cov_8Mmk80O9EVvFty7pNxkC1w.f['3']++;__cov_8Mmk80O9EVvFty7pNxkC1w.s['8']++;theDaoHelper.executeQuery('SELECT r.id, r.name, r.grade_id, g.grade, r.color_id, c.value, s.firstname, s.lastname, r.date FROM routes r '+'INNER JOIN setters s ON r.setter_id = s.id '+'INNER JOIN grades g ON r.grade_id = g.id '+'INNER JOIN colors c ON r.color_id = c.id '+'WHERE r.set_id = ?',[pSetId],pCallback);};__cov_8Mmk80O9EVvFty7pNxkC1w.s['9']++;this.createRoute=function(pSetId,pName,pSetterId,pGradeId,pColorId,pCallback){__cov_8Mmk80O9EVvFty7pNxkC1w.f['4']++;__cov_8Mmk80O9EVvFty7pNxkC1w.s['10']++;theDaoHelper.executeQuery('INSERT INTO routes (set_id, name, setter_id, grade_id, color_id) VALUES (?, ?, ?, ?, ?)',[pSetId,pName,pSetterId,pGradeId,pColorId],pCallback);};__cov_8Mmk80O9EVvFty7pNxkC1w.s['11']++;this.updateRoute=function(pId,pSetId,pName,pSetterId,pGradeId,pColorId,pCallback){__cov_8Mmk80O9EVvFty7pNxkC1w.f['5']++;__cov_8Mmk80O9EVvFty7pNxkC1w.s['12']++;theDaoHelper.executeQuery('UPDATE routes SET name = ? AND set_id = ? AND setter_id = ? AND grade_id = ? AND color_id = ? WHERE id = ?',[pName,pSetId,pSetterId,pGradeId,pColorId,pId],pCallback);};__cov_8Mmk80O9EVvFty7pNxkC1w.s['13']++;this.deleteRoute=function(pId,pCallback){__cov_8Mmk80O9EVvFty7pNxkC1w.f['6']++;__cov_8Mmk80O9EVvFty7pNxkC1w.s['14']++;theDaoHelper.executeQuery('DELETE FROM routes WHERE id = ?',[pId],pCallback);};};__cov_8Mmk80O9EVvFty7pNxkC1w.s['15']++;module.exports=new RoutesDao();
