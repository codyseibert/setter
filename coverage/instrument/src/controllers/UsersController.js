
var __cov_l5hhat_bsZAzBi8T2ACaeg = (Function('return this'))();
if (!__cov_l5hhat_bsZAzBi8T2ACaeg.__coverage__) { __cov_l5hhat_bsZAzBi8T2ACaeg.__coverage__ = {}; }
__cov_l5hhat_bsZAzBi8T2ACaeg = __cov_l5hhat_bsZAzBi8T2ACaeg.__coverage__;
if (!(__cov_l5hhat_bsZAzBi8T2ACaeg['src/controllers/UsersController.js'])) {
   __cov_l5hhat_bsZAzBi8T2ACaeg['src/controllers/UsersController.js'] = {"path":"src/controllers/UsersController.js","s":{"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0,"8":0,"9":0,"10":0,"11":0,"12":0,"13":0,"14":0,"15":0,"16":0,"17":0,"18":0,"19":0,"20":0,"21":0,"22":0,"23":0,"24":0,"25":0,"26":0,"27":0,"28":0,"29":0,"30":0},"b":{},"f":{"1":0,"2":0,"3":0,"4":0,"5":0,"6":0},"fnMap":{"1":{"name":"(anonymous_1)","line":17,"loc":{"start":{"line":17,"column":22},"end":{"line":17,"column":34}}},"2":{"name":"(anonymous_2)","line":20,"loc":{"start":{"line":20,"column":19},"end":{"line":20,"column":41}}},"3":{"name":"(anonymous_3)","line":28,"loc":{"start":{"line":28,"column":20},"end":{"line":28,"column":42}}},"4":{"name":"(anonymous_4)","line":33,"loc":{"start":{"line":33,"column":22},"end":{"line":33,"column":44}}},"5":{"name":"(anonymous_5)","line":43,"loc":{"start":{"line":43,"column":22},"end":{"line":43,"column":44}}},"6":{"name":"(anonymous_6)","line":55,"loc":{"start":{"line":55,"column":22},"end":{"line":55,"column":44}}}},"statementMap":{"1":{"start":{"line":14,"column":0},"end":{"line":14,"column":45}},"2":{"start":{"line":15,"column":0},"end":{"line":15,"column":56}},"3":{"start":{"line":17,"column":0},"end":{"line":62,"column":2}},"4":{"start":{"line":20,"column":4},"end":{"line":26,"column":6}},"5":{"start":{"line":21,"column":8},"end":{"line":22,"column":21}},"6":{"start":{"line":23,"column":8},"end":{"line":23,"column":28}},"7":{"start":{"line":24,"column":8},"end":{"line":24,"column":67}},"8":{"start":{"line":25,"column":8},"end":{"line":25,"column":42}},"9":{"start":{"line":28,"column":4},"end":{"line":31,"column":6}},"10":{"start":{"line":29,"column":8},"end":{"line":29,"column":71}},"11":{"start":{"line":30,"column":8},"end":{"line":30,"column":39}},"12":{"start":{"line":33,"column":4},"end":{"line":41,"column":6}},"13":{"start":{"line":34,"column":8},"end":{"line":36,"column":21}},"14":{"start":{"line":37,"column":8},"end":{"line":37,"column":40}},"15":{"start":{"line":38,"column":8},"end":{"line":38,"column":38}},"16":{"start":{"line":39,"column":8},"end":{"line":39,"column":67}},"17":{"start":{"line":40,"column":8},"end":{"line":40,"column":62}},"18":{"start":{"line":43,"column":4},"end":{"line":53,"column":6}},"19":{"start":{"line":44,"column":8},"end":{"line":47,"column":21}},"20":{"start":{"line":48,"column":8},"end":{"line":48,"column":28}},"21":{"start":{"line":49,"column":8},"end":{"line":49,"column":40}},"22":{"start":{"line":50,"column":8},"end":{"line":50,"column":38}},"23":{"start":{"line":51,"column":8},"end":{"line":51,"column":67}},"24":{"start":{"line":52,"column":8},"end":{"line":52,"column":66}},"25":{"start":{"line":55,"column":4},"end":{"line":61,"column":6}},"26":{"start":{"line":56,"column":8},"end":{"line":57,"column":21}},"27":{"start":{"line":58,"column":8},"end":{"line":58,"column":28}},"28":{"start":{"line":59,"column":8},"end":{"line":59,"column":67}},"29":{"start":{"line":60,"column":8},"end":{"line":60,"column":45}},"30":{"start":{"line":64,"column":0},"end":{"line":64,"column":39}}},"branchMap":{}};
}
__cov_l5hhat_bsZAzBi8T2ACaeg = __cov_l5hhat_bsZAzBi8T2ACaeg['src/controllers/UsersController.js'];
__cov_l5hhat_bsZAzBi8T2ACaeg.s['1']++;var theUsersDao=require('../dao/UsersDao');__cov_l5hhat_bsZAzBi8T2ACaeg.s['2']++;var theControllerHelper=require('./ControllerHelper');__cov_l5hhat_bsZAzBi8T2ACaeg.s['3']++;var UsersController=function(){'use strict';__cov_l5hhat_bsZAzBi8T2ACaeg.f['1']++;__cov_l5hhat_bsZAzBi8T2ACaeg.s['4']++;this.getUser=function(pReq,pRes){__cov_l5hhat_bsZAzBi8T2ACaeg.f['2']++;__cov_l5hhat_bsZAzBi8T2ACaeg.s['5']++;var id,callback;__cov_l5hhat_bsZAzBi8T2ACaeg.s['6']++;id=pReq.params.id;__cov_l5hhat_bsZAzBi8T2ACaeg.s['7']++;callback=theControllerHelper.createDefaultCallback(pRes);__cov_l5hhat_bsZAzBi8T2ACaeg.s['8']++;theUsersDao.getUser(id,callback);};__cov_l5hhat_bsZAzBi8T2ACaeg.s['9']++;this.getUsers=function(pReq,pRes){__cov_l5hhat_bsZAzBi8T2ACaeg.f['3']++;__cov_l5hhat_bsZAzBi8T2ACaeg.s['10']++;var callback=theControllerHelper.createDefaultCallback(pRes);__cov_l5hhat_bsZAzBi8T2ACaeg.s['11']++;theUsersDao.getUsers(callback);};__cov_l5hhat_bsZAzBi8T2ACaeg.s['12']++;this.createUser=function(pReq,pRes){__cov_l5hhat_bsZAzBi8T2ACaeg.f['4']++;__cov_l5hhat_bsZAzBi8T2ACaeg.s['13']++;var firstname,lastname,callback;__cov_l5hhat_bsZAzBi8T2ACaeg.s['14']++;firstname=pReq.body.firstname;__cov_l5hhat_bsZAzBi8T2ACaeg.s['15']++;lastname=pReq.body.lastname;__cov_l5hhat_bsZAzBi8T2ACaeg.s['16']++;callback=theControllerHelper.createDefaultCallback(pRes);__cov_l5hhat_bsZAzBi8T2ACaeg.s['17']++;theUsersDao.createUser(firstname,lastname,callback);};__cov_l5hhat_bsZAzBi8T2ACaeg.s['18']++;this.updateUser=function(pReq,pRes){__cov_l5hhat_bsZAzBi8T2ACaeg.f['5']++;__cov_l5hhat_bsZAzBi8T2ACaeg.s['19']++;var id,firstname,lastname,callback;__cov_l5hhat_bsZAzBi8T2ACaeg.s['20']++;id=pReq.params.id;__cov_l5hhat_bsZAzBi8T2ACaeg.s['21']++;firstname=pReq.body.firstname;__cov_l5hhat_bsZAzBi8T2ACaeg.s['22']++;lastname=pReq.body.lastname;__cov_l5hhat_bsZAzBi8T2ACaeg.s['23']++;callback=theControllerHelper.createDefaultCallback(pRes);__cov_l5hhat_bsZAzBi8T2ACaeg.s['24']++;theUsersDao.updateUser(id,firstname,lastname,callback);};__cov_l5hhat_bsZAzBi8T2ACaeg.s['25']++;this.deleteUser=function(pReq,pRes){__cov_l5hhat_bsZAzBi8T2ACaeg.f['6']++;__cov_l5hhat_bsZAzBi8T2ACaeg.s['26']++;var id,callback;__cov_l5hhat_bsZAzBi8T2ACaeg.s['27']++;id=pReq.params.id;__cov_l5hhat_bsZAzBi8T2ACaeg.s['28']++;callback=theControllerHelper.createDefaultCallback(pRes);__cov_l5hhat_bsZAzBi8T2ACaeg.s['29']++;theUsersDao.deleteUser(id,callback);};};__cov_l5hhat_bsZAzBi8T2ACaeg.s['30']++;module.exports=new UsersController();
