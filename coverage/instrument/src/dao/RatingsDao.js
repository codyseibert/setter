
var __cov_LODnBn$2mev4qRbpNCujvw = (Function('return this'))();
if (!__cov_LODnBn$2mev4qRbpNCujvw.__coverage__) { __cov_LODnBn$2mev4qRbpNCujvw.__coverage__ = {}; }
__cov_LODnBn$2mev4qRbpNCujvw = __cov_LODnBn$2mev4qRbpNCujvw.__coverage__;
if (!(__cov_LODnBn$2mev4qRbpNCujvw['src/dao/RatingsDao.js'])) {
   __cov_LODnBn$2mev4qRbpNCujvw['src/dao/RatingsDao.js'] = {"path":"src/dao/RatingsDao.js","s":{"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0},"b":{},"f":{"1":0,"2":0},"fnMap":{"1":{"name":"(anonymous_1)","line":20,"loc":{"start":{"line":20,"column":17},"end":{"line":20,"column":29}}},"2":{"name":"(anonymous_2)","line":23,"loc":{"start":{"line":23,"column":24},"end":{"line":23,"column":72}}}},"statementMap":{"1":{"start":{"line":11,"column":0},"end":{"line":11,"column":39}},"2":{"start":{"line":12,"column":0},"end":{"line":12,"column":41}},"3":{"start":{"line":13,"column":0},"end":{"line":13,"column":42}},"4":{"start":{"line":20,"column":0},"end":{"line":30,"column":2}},"5":{"start":{"line":23,"column":4},"end":{"line":29,"column":6}},"6":{"start":{"line":24,"column":8},"end":{"line":28,"column":10}},"7":{"start":{"line":32,"column":0},"end":{"line":32,"column":34}}},"branchMap":{}};
}
__cov_LODnBn$2mev4qRbpNCujvw = __cov_LODnBn$2mev4qRbpNCujvw['src/dao/RatingsDao.js'];
__cov_LODnBn$2mev4qRbpNCujvw.s['1']++;var theDB=require('../DBConnection');__cov_LODnBn$2mev4qRbpNCujvw.s['2']++;var theMessages=require('../Messages');__cov_LODnBn$2mev4qRbpNCujvw.s['3']++;var theDaoHelper=require('./DaoHelper');__cov_LODnBn$2mev4qRbpNCujvw.s['4']++;var RatingsDao=function(){'use strict';__cov_LODnBn$2mev4qRbpNCujvw.f['1']++;__cov_LODnBn$2mev4qRbpNCujvw.s['5']++;this.updateRating=function(pUserId,pRouteId,pValue,pCallback){__cov_LODnBn$2mev4qRbpNCujvw.f['2']++;__cov_LODnBn$2mev4qRbpNCujvw.s['6']++;theDaoHelper.executeQuery('INSERT INTO ratings (user_id, route_id, value) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE value = ?',[pUserId,pRouteId,pValue,pValue],pCallback);};};__cov_LODnBn$2mev4qRbpNCujvw.s['7']++;module.exports=new RatingsDao();
