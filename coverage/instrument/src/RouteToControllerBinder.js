
var __cov_yQCBf9AH35MIlRMOyjFcvg = (Function('return this'))();
if (!__cov_yQCBf9AH35MIlRMOyjFcvg.__coverage__) { __cov_yQCBf9AH35MIlRMOyjFcvg.__coverage__ = {}; }
__cov_yQCBf9AH35MIlRMOyjFcvg = __cov_yQCBf9AH35MIlRMOyjFcvg.__coverage__;
if (!(__cov_yQCBf9AH35MIlRMOyjFcvg['src/RouteToControllerBinder.js'])) {
   __cov_yQCBf9AH35MIlRMOyjFcvg['src/RouteToControllerBinder.js'] = {"path":"src/RouteToControllerBinder.js","s":{"1":0,"2":0,"3":0,"4":0,"5":0,"6":0},"b":{},"f":{"1":0},"fnMap":{"1":{"name":"(anonymous_1)","line":13,"loc":{"start":{"line":13,"column":30},"end":{"line":13,"column":42}}}},"statementMap":{"1":{"start":{"line":9,"column":0},"end":{"line":9,"column":27}},"2":{"start":{"line":11,"column":0},"end":{"line":11,"column":65}},"3":{"start":{"line":13,"column":0},"end":{"line":18,"column":2}},"4":{"start":{"line":16,"column":4},"end":{"line":16,"column":70}},"5":{"start":{"line":17,"column":4},"end":{"line":17,"column":67}},"6":{"start":{"line":20,"column":0},"end":{"line":20,"column":47}}},"branchMap":{}};
}
__cov_yQCBf9AH35MIlRMOyjFcvg = __cov_yQCBf9AH35MIlRMOyjFcvg['src/RouteToControllerBinder.js'];
__cov_yQCBf9AH35MIlRMOyjFcvg.s['1']++;var app=require('./app');__cov_yQCBf9AH35MIlRMOyjFcvg.s['2']++;var GradesController=require('./controllers/GradesController');__cov_yQCBf9AH35MIlRMOyjFcvg.s['3']++;var RouteToControllerBinder=function(){'use strict';__cov_yQCBf9AH35MIlRMOyjFcvg.f['1']++;__cov_yQCBf9AH35MIlRMOyjFcvg.s['4']++;app.get('/api/grades/boulder',GradesController.getBoulderGrades);__cov_yQCBf9AH35MIlRMOyjFcvg.s['5']++;app.get('/api/grades/rope',GradesController.getBoulderGrades);};__cov_yQCBf9AH35MIlRMOyjFcvg.s['6']++;module.exports=new RouteToControllerBinder();
