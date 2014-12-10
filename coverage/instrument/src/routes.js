
var __cov_PKXjE83wI2jOY5hqNiB8lA = (Function('return this'))();
if (!__cov_PKXjE83wI2jOY5hqNiB8lA.__coverage__) { __cov_PKXjE83wI2jOY5hqNiB8lA.__coverage__ = {}; }
__cov_PKXjE83wI2jOY5hqNiB8lA = __cov_PKXjE83wI2jOY5hqNiB8lA.__coverage__;
if (!(__cov_PKXjE83wI2jOY5hqNiB8lA['src/routes.js'])) {
   __cov_PKXjE83wI2jOY5hqNiB8lA['src/routes.js'] = {"path":"src/routes.js","s":{"1":0,"2":0,"3":0,"4":0,"5":0,"6":0},"b":{},"f":{"1":0},"fnMap":{"1":{"name":"(anonymous_1)","line":13,"loc":{"start":{"line":13,"column":30},"end":{"line":13,"column":42}}}},"statementMap":{"1":{"start":{"line":9,"column":0},"end":{"line":9,"column":27}},"2":{"start":{"line":11,"column":0},"end":{"line":11,"column":65}},"3":{"start":{"line":13,"column":0},"end":{"line":17,"column":2}},"4":{"start":{"line":15,"column":4},"end":{"line":15,"column":70}},"5":{"start":{"line":16,"column":4},"end":{"line":16,"column":64}},"6":{"start":{"line":19,"column":0},"end":{"line":19,"column":47}}},"branchMap":{}};
}
__cov_PKXjE83wI2jOY5hqNiB8lA = __cov_PKXjE83wI2jOY5hqNiB8lA['src/routes.js'];
__cov_PKXjE83wI2jOY5hqNiB8lA.s['1']++;var app=require('./app');__cov_PKXjE83wI2jOY5hqNiB8lA.s['2']++;var GradesController=require('./controllers/GradesController');__cov_PKXjE83wI2jOY5hqNiB8lA.s['3']++;var RouteToControllerBinder=function(){'use strict';__cov_PKXjE83wI2jOY5hqNiB8lA.f['1']++;__cov_PKXjE83wI2jOY5hqNiB8lA.s['4']++;app.get('/api/grades/boulder',GradesController.getBoulderGrades);__cov_PKXjE83wI2jOY5hqNiB8lA.s['5']++;app.get('/api/grades/rope',GradesController.getRopeGrades);};__cov_PKXjE83wI2jOY5hqNiB8lA.s['6']++;module.exports=new RouteToControllerBinder();
