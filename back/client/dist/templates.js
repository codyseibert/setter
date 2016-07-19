angular.module("setter").run(["$templateCache", function($templateCache) {$templateCache.put("community/community.html","\n<div class=\"row\">\n  <div class=\"col-md-6\">\n    <div class=\"panel top\">\n      <h2>Notification Board</h2>\n      <btncreate ng-show=\"!isGymAdmin()\" save=\"saveDiscussion()\" creating=\"creatingDiscussion\"></btncreate>\n      <div ng-if=\"creatingDiscussion\">\n        <div class=\"form-group\">\n          <label>Message</label>\n          <textarea ng-model=\"discussion.message\" placeholder=\"Post here to find climbing partners, trips, etc\" class=\"form-control\"></textarea>\n        </div>\n      </div>\n      <div ng-repeat=\"dis in discussions\" style=\"clear: left; position: relative;\"><img src=\"assets/images/me.jpeg\" style=\"float: left; width: 100px; height; 100px; border-radius: 50%;\"/>\n        <div style=\"min-height: 100px;\">\n          <btnedit ng-show=\"!isGymAdmin() &amp;&amp; ownsDiscussion(dis)\" save=\"updateDiscussion(dis)\" editing=\"dis.editing\" delete=\"deleteDiscussion(dis)\"></btnedit>\n          <div ng-if=\"dis.editing\">\n            <div class=\"form-group\">\n              <label>Message</label>\n              <textarea ng-model=\"dis.message\" placeholder=\"Post here to find climbing partners, trips, etc\" class=\"form-control\"></textarea>\n            </div>\n          </div>\n          <div ng-if=\"!dis.editing\" class=\"text\">{{dis.message}}</div>\n          <div class=\"date\">{{dis.createdAt | amCalendar:referenceTime:formats}}</div>\n        </div>\n        <hr/>\n      </div>\n    </div>\n  </div>\n  <div class=\"col-md-6\">\n    <div class=\"panel top\">\n      <h2>Gear Board</h2>\n      <btncreate ng-show=\"!isGymAdmin()\" save=\"saveGear()\" creating=\"creatingGear\"></btncreate>\n      <div ng-if=\"creatingGear\">\n        <div class=\"form-group\">\n          <label>Message</label>\n          <textarea ng-model=\"gear.message\" placeholder=\"Post here to find climbing partners, trips, etc\" class=\"form-control\"></textarea>\n        </div>\n      </div>\n      <div ng-repeat=\"gear in gears\" style=\"clear: left; position: relative;\"><img src=\"assets/images/me.jpeg\" style=\"float: left; width: 100px; height; 100px; border-radius: 50%;\"/>\n        <div style=\"min-height: 100px;\">\n          <btnedit ng-show=\"!isGymAdmin() &amp;&amp; ownsDiscussion(gear)\" save=\"updateGear(gear)\" editing=\"gear.editing\" delete=\"deleteGear(gear)\"></btnedit>\n          <div ng-if=\"gear.editing\">\n            <div class=\"form-group\">\n              <label>Message</label>\n              <textarea ng-model=\"gear.message\" placeholder=\"Post the gear you are looking to sell here\" class=\"form-control\"></textarea>\n            </div>\n          </div>\n          <div ng-if=\"!gear.editing\" class=\"text\">{{gear.message}}</div>\n          <div class=\"date\">{{gear.createdAt | amCalendar:referenceTime:formats}}</div>\n        </div>\n        <hr/>\n      </div>\n    </div>\n  </div>\n</div>");
$templateCache.put("analytics/analytics.html","\n<div class=\"row\">\n  <div class=\"col-md-4\">\n    <div class=\"panel top\">\n      <h2>Boulder Problems</h2>\n      <canvas id=\"bar\" chart-data=\"data\" chart-labels=\"labels\" chart-series=\"series\" class=\"chart chart-bar\"></canvas>\n      <canvas id=\"pie\" chart-data=\"piedata\" chart-labels=\"labels\" chart-series=\"series\" class=\"chart chart-pie\"></canvas>\n    </div>\n  </div>\n  <div class=\"col-md-4\">\n    <div class=\"panel top\">\n      <h2>Top Rope Routes</h2>\n      <canvas id=\"bar\" chart-data=\"data\" chart-labels=\"labels\" chart-series=\"series\" class=\"chart chart-bar\"></canvas>\n      <canvas id=\"pie\" chart-data=\"piedata\" chart-labels=\"labels\" chart-series=\"series\" class=\"chart chart-pie\"></canvas>\n    </div>\n  </div>\n  <div class=\"col-md-4\">\n    <div class=\"panel top\">\n      <h2>Lead Routes</h2>\n      <canvas id=\"bar\" chart-data=\"data\" chart-labels=\"labels\" chart-series=\"series\" class=\"chart chart-bar\"></canvas>\n      <canvas id=\"pie\" chart-data=\"piedata\" chart-labels=\"labels\" chart-series=\"series\" class=\"chart chart-pie\"></canvas>\n    </div>\n  </div>\n</div>");
$templateCache.put("findgym/findGym.html","\n<div class=\"col-2-fluid\">\n  <header>\n    <div class=\"logo\">myApp</div>\n    <div class=\"right link\">Articles</div>\n  </header>\n  <div class=\"container-fluid content\">\n    <div class=\"row\">\n      <div class=\"col-md-8 col-md-push-2\">\n        <div class=\"panel top\">\n          <h2>Gym Search</h2>\n          <input ng-model=\"search\"/>\n          <div ng-repeat=\"gym in gyms | filter : myFilter\" ui-sref=\"gyms.news({gymId: gym.id})\" class=\"gym\">\n            <div class=\"flag member\"> <img ng-src=\"{{gym.logo}}\"/>\n              <div class=\"text\">{{gym.name}}</div>\n              <div class=\"text\">{{gym.address}}</div>\n            </div>\n          </div>\n        </div>\n      </div>\n    </div>\n  </div>\n  <footer></footer>\n</div>");
$templateCache.put("finduser/findUser.html","\n<div class=\"col-2-fluid\">\n  <header>\n    <div class=\"logo\">myApp</div>\n    <div class=\"right link\">Articles</div>\n  </header>\n  <div class=\"container-fluid content\">\n    <div class=\"row\">\n      <div class=\"col-md-8 col-md-push-2\">\n        <div class=\"panel top\">\n          <h2>User Search</h2>\n          <input ng-model=\"search\"/>\n          <div ng-repeat=\"user in users | filter : myFilter\" ui-sref=\"profile({userId: user.id})\" class=\"user\">\n            <div class=\"flag member\"> <img ng-src=\"{{user.image}}\"/>\n              <div class=\"text\">{{user.name}}</div>\n            </div>\n          </div>\n        </div>\n      </div>\n    </div>\n  </div>\n  <footer></footer>\n</div>");
$templateCache.put("gyms/gyms.html","\n<div class=\"col-3-fluid-with-banner\">\n  <header></header>\n  <div class=\"fluid-wrapper\">\n    <div class=\"container-fluid banner\">\n      <div class=\"row\">\n        <banner></banner>\n      </div>\n    </div>\n  </div>\n  <div class=\"fluid-wrapper\">\n    <div class=\"container-fluid content\">\n      <div class=\"row\">\n        <div ui-view=\"content\" class=\"col-md-12\"></div>\n      </div>\n    </div>\n  </div>\n  <footer></footer>\n</div>");
$templateCache.put("info/info.html","\n<div class=\"row\">\n  <div class=\"col-md-6\">\n    <div class=\"panel top\">\n      <btncreate ng-show=\"isGymAdmin()\" save=\"save\" creating=\"creating\"></btncreate>\n      <h2>Gym Info</h2>\n      <h3>Address</h3>\n      <input ng-model=\"gym.address\" placeholder=\"Your gym address\" ng-show=\"creating\"/><span ng-show=\"!creating\">{{gym.address}}</span>\n      <h3>Phone</h3>\n      <input ng-model=\"gym.phone\" placeholder=\"your gym phone number\" ng-show=\"creating\"/><span ng-show=\"!creating\">{{gym.phone}}</span>\n      <h3>Website</h3>\n      <input ng-model=\"gym.website\" placeholder=\"your gym website url\" ng-show=\"creating\"/><a ng-show=\"!creating\" href=\"{{gym.website}}\">{{gym.website}}</a>\n      <h3>Hours of Operation</h3>\n      <input ng-model=\"gym.hours\" placeholder=\"your gym hours of operation\" ng-show=\"creating\"/><span ng-show=\"!creating\">{{gym.hours}}</span>\n    </div>\n  </div>\n  <div class=\"col-md-6\">\n    <div class=\"panel top\">\n      <h2>Location</h2>\n      <div id=\"gmap_canvas\" style=\"height:400px;width:520px;\"></div>\n    </div>\n  </div>\n</div>");
$templateCache.put("landing/landing.html","\n<div class=\"col-1-fluid\">\n  <div class=\"container-fluid content\">\n    <div class=\"row\">\n      <div class=\"col-xs-12\">\n        <landing></landing>\n      </div>\n    </div>\n  </div>\n  <footer></footer>\n</div>");
$templateCache.put("login/login.html","\n<div class=\"col-2-fluid\">\n  <header>\n    <div class=\"logo\">myApp</div>\n    <div class=\"right link\">Login</div>\n  </header>\n  <div class=\"container-fluid content\">\n    <div class=\"row\">\n      <div class=\"col-md-6 left\">\n        <div class=\"form-group\">\n          <label>Email</label>\n          <input ng-model=\"login.email\" type=\"email\" class=\"form-control\"/>\n        </div>\n        <div class=\"form-group\">\n          <label>Password</label>\n          <input ng-model=\"login.password\" type=\"password\" class=\"form-control\"/>\n        </div>\n        <button ng-click=\"login()\">Login</button>\n      </div>\n    </div>\n  </div>\n  <footer></footer>\n</div>");
$templateCache.put("logout/logout.html","");
$templateCache.put("main/main.html","\n<div class=\"col-3-fluid-with-banner\">\n  <header></header>\n  <div class=\"fluid-wrapper\">\n    <div class=\"container-fluid banner\">\n      <div class=\"row\">\n        <banner></banner>\n      </div>\n    </div>\n  </div>\n  <div class=\"fluid-wrapper\">\n    <div class=\"container-fluid content\">\n      <div class=\"row\">\n        <div class=\"col-md-2 left\">\n          <navigation></navigation>\n        </div>\n        <div class=\"col-md-6 middle\">\n          <comments></comments>\n        </div>\n        <div class=\"col-md-4 right\">\n          <sends></sends>\n        </div>\n      </div>\n    </div>\n  </div>\n  <footer></footer>\n</div>");
$templateCache.put("manageroutes/manageroutes.html","\n<div class=\"col-2-fluid\">\n  <header>\n    <div class=\"logo\">myApp</div>\n    <div class=\"right link\">Routes</div>\n  </header>\n  <div class=\"container-fluid content\">\n    <div class=\"row\">\n      <div class=\"col-md-12\">\n        <manageroutes></manageroutes>\n      </div>\n    </div>\n  </div>\n</div>\n<footer></footer>");
$templateCache.put("members/members.html","\n<div class=\"row\">\n  <div class=\"col-md-12\">\n    <div class=\"panel top\">\n      <h2>Gym Members</h2>\n      <div class=\"flag member\"> <img src=\"assets/images/me.jpeg\"/>\n        <div class=\"text\">Cody Seibert</div>\n      </div>\n      <div class=\"flag member\"> <img src=\"assets/images/me.jpeg\"/>\n        <div class=\"text\">Cody Seibert</div>\n      </div>\n      <div class=\"flag member\"> <img src=\"assets/images/me.jpeg\"/>\n        <div class=\"text\">Cody Seibert</div>\n      </div>\n      <div class=\"flag member\"> <img src=\"assets/images/me.jpeg\"/>\n        <div class=\"text\">Cody Seibert</div>\n      </div>\n      <div class=\"flag member\"> <img src=\"assets/images/me.jpeg\"/>\n        <div class=\"text\">Cody Seibert</div>\n      </div>\n      <div class=\"flag member\"> <img src=\"assets/images/me.jpeg\"/>\n        <div class=\"text\">Cody Seibert</div>\n      </div>\n    </div>\n  </div>\n</div>");
$templateCache.put("news/news.html","\n<div class=\"row\">\n  <div class=\"col-md-8\">\n    <div class=\"panel top\">\n      <btncreate ng-show=\"isGymAdmin()\" save=\"createNews\" creating=\"creating\"></btncreate>\n      <h2>Gym News</h2>\n      <div ng-if=\"creating\">\n        <div class=\"form-group\">\n          <label>Message</label>\n          <textarea ng-model=\"alert.message\" placeholder=\"Enter your message for your members here and click save\" class=\"form-control\"></textarea>\n        </div>\n      </div>\n      <div ng-repeat=\"entry in entries\" class=\"news\">\n        <hr/>\n        <div ng-if=\"!entry.editing\">{{entry.message}}</div>\n        <div ng-if=\"entry.editing\" class=\"form-group\">\n          <label>Message</label>\n          <textarea ng-model=\"entry.message\" class=\"form-control\"></textarea>\n        </div>\n        <div>{{entry.createdAt | amCalendar:referenceTime:formats}}</div>\n        <div ng-if=\"isGymAdmin()\" class=\"btn-group\">\n          <div uib-tooltip=\"delete\" ng-click=\"delete(entry)\" class=\"btn-circle\"> <i class=\"glyphicon glyphicon-trash\"></i></div>\n          <div ng-if=\"!entry.editing\" uib-tooltip=\"edit\" ng-click=\"edit(entry)\" class=\"btn-circle\">&#9998;</div>\n          <div ng-if=\"entry.editing\" uib-tooltip=\"save\" ng-click=\"save(entry)\" class=\"btn-circle green\">&#10003;</div>\n          <div ng-if=\"entry.editing\" uib-tooltip=\"cancel\" ng-click=\"cancelEntry(entry)\" class=\"btn-circle gray\">&times;</div>\n        </div>\n      </div>\n    </div>\n  </div>\n  <div class=\"col-md-4\">\n    <div class=\"panel top\">\n      <div style=\"text-align: center;\">\n        <div data-height=\"800\" data-href=\"{{gym.facebook}}\" data-tabs=\"timeline\" data-small-header=\"false\" data-adapt-container-width=\"true\" data-hide-cover=\"false\" data-show-facepile=\"true\" class=\"fb-page\"></div>\n      </div>\n    </div>\n  </div>\n</div>");
$templateCache.put("profile/profile.html","\n<div class=\"col-2-fluid\">\n  <header>\n    <div class=\"logo\">myApp</div>\n    <div class=\"right link\">Articles</div>\n  </header>\n  <div class=\"container-fluid content\">\n    <div class=\"row\">\n      <div class=\"col-md-12\">\n        <div class=\"panel top\"><img style=\"width: 200px;\" src=\"assets/images/me.jpeg\"/>\n          <div class=\"name\">Cody Seibert</div>\n        </div>\n      </div>\n    </div>\n    <div class=\"row\">\n      <div class=\"col-md-12\">\n        <div class=\"panel top\"> \n          <h2>Activity</h2>\n        </div>\n      </div>\n    </div>\n    <div class=\"row\">\n      <div class=\"col-md-4\">\n        <div class=\"panel top\">\n          <h2>Boulder</h2>\n          <canvas id=\"line\" chart-data=\"linedata\" chart-labels=\"linelabels\" chart-series=\"lineseries\" class=\"chart chart-line\"></canvas>\n          <canvas id=\"bar\" chart-data=\"data\" chart-labels=\"labels\" chart-series=\"series\" class=\"chart chart-bar\"></canvas>\n          <canvas id=\"pie\" chart-data=\"piedata\" chart-labels=\"labels\" chart-series=\"series\" class=\"chart chart-pie\"></canvas>\n        </div>\n      </div>\n      <div class=\"col-md-4\">\n        <div class=\"panel top\">\n          <h2>Top Rope</h2>\n          <canvas id=\"line\" chart-data=\"linedata\" chart-labels=\"linelabels\" chart-series=\"lineseries\" class=\"chart chart-line\"></canvas>\n          <canvas id=\"bar\" chart-data=\"data\" chart-labels=\"labels\" chart-series=\"series\" class=\"chart chart-bar\"></canvas>\n          <canvas id=\"pie\" chart-data=\"piedata\" chart-labels=\"labels\" chart-series=\"series\" class=\"chart chart-pie\"></canvas>\n        </div>\n      </div>\n      <div class=\"col-md-4\">\n        <div class=\"panel top\">\n          <h2>Lead</h2>\n          <canvas id=\"line\" chart-data=\"linedata\" chart-labels=\"linelabels\" chart-series=\"lineseries\" class=\"chart chart-line\"></canvas>\n          <canvas id=\"bar\" chart-data=\"data\" chart-labels=\"labels\" chart-series=\"series\" class=\"chart chart-bar\"></canvas>\n          <canvas id=\"pie\" chart-data=\"piedata\" chart-labels=\"labels\" chart-series=\"series\" class=\"chart chart-pie\"></canvas>\n        </div>\n      </div>\n    </div>\n  </div>\n  <footer></footer>\n</div>");
$templateCache.put("register/register.html","\n<div class=\"col-3-fluid\">\n  <header>\n    <div class=\"logo\">myApp</div>\n    <div class=\"right link\">Articles</div>\n  </header>\n  <div class=\"fluid-wrapper\">\n    <div class=\"container-fluid content\">\n      <div class=\"row\">\n        <div class=\"col-md-4 left\"></div>\n        <div class=\"col-md-4 middle\">\n          <register></register>\n        </div>\n        <div class=\"col-md-4 right\"></div>\n      </div>\n    </div>\n  </div>\n  <footer></footer>\n</div>");
$templateCache.put("setters/setters.html","\n<div class=\"col-2-fluid\">\n  <header>\n    <div class=\"logo\">myApp</div>\n    <div class=\"right link\">Setters</div>\n  </header>\n  <div class=\"container-fluid content\">\n    <div class=\"row\">\n      <div class=\"col-md-8 col-md-push-2\">\n        <setters></setters>\n      </div>\n    </div>\n  </div>\n  <footer></footer>\n</div>");
$templateCache.put("settings/settings.html","\n<div class=\"col-2-fluid\">\n  <header>\n    <div class=\"logo\">myApp</div>\n    <div class=\"right link\">Articles</div>\n  </header>\n  <div class=\"container-fluid content\">\n    <div class=\"row\">\n      <div class=\"col-md-6 left\">\n        <div class=\"panel top\">\n          <h2>Account Settings</h2>\n          <form ng-submit=\"changePassword()\">\n            <div class=\"form-group\">\n              <label>Change Password</label>\n              <input ng-model=\"gym.password\" placeholder=\"password\" class=\"form-control\"/>\n            </div>\n            <div class=\"form-group\">\n              <label>Confirm Password</label>\n              <input ng-model=\"confirm\" placeholder=\"confirm password\" class=\"form-control\"/>\n            </div>\n            <button type=\"submit\">Change</button>\n          </form>\n          <form ng-submit=\"submit()\">\n            <div class=\"form-group\">\n              <label>Gym Address</label>\n              <input ng-model=\"gym.address\" placeholder=\"gym address\" class=\"form-control\"/>\n            </div>\n            <div class=\"form-group\">\n              <label>Gym Name</label>\n              <input ng-model=\"gym.name\" placeholder=\"gym name\" class=\"form-control\"/>\n            </div>\n            <button type=\"submit\">Save</button>\n          </form>\n        </div>\n      </div>\n      <div class=\"col-md-6 right\">\n        <div class=\"panel top\">\n          <h2>Gym Configurations</h2>\n          <form ng-submit=\"submit()\">\n            <div class=\"form-group\">\n              <label>Hide setter names from users</label><br/>\n              <toggle-switch ng-model=\"gym.hideSetters\"></toggle-switch>\n            </div>\n            <div class=\"form-group\">\n              <label>Combine top rope routes with lead on zones page</label><br/>\n              <toggle-switch ng-model=\"gym.combineRope\"></toggle-switch>\n            </div>\n            <div class=\"form-group\">\n              <label>Hide facebook news feed</label><br/>\n              <toggle-switch ng-model=\"gym.hideFacebook\"></toggle-switch>\n            </div>\n            <div class=\"form-group\">\n              <label>Twitter URL</label>\n              <input ng-model=\"gym.twitter\" placeholder=\"http://twitter.com/yourgymhandle\" class=\"form-control\"/>\n            </div>\n            <div class=\"form-group\">\n              <label>Facebook URL</label>\n              <input ng-model=\"gym.facebook\" placeholder=\"http://facebook.com/yourgymhandle\" class=\"form-control\"/>\n            </div>\n            <div class=\"form-group\"><img ng-src=\"{{gym.banner}}\" height=\"200\"/><br/>\n              <label>Banner Image URL</label>\n              <input ng-model=\"gym.banner\" placeholder=\"http://google.com/your_image_location\" class=\"form-control\"/>\n              <button type=\"button\" ngf-select=\"upload($file, \'banner\')\" ng-model=\"file\" name=\"file\" ngf-max-size=\"2MB\">Upload Banner Image</button>\n            </div>\n            <div class=\"form-group\"><img ng-src=\"{{gym.logo}}\" height=\"200\"/><br/>\n              <label>Logo Image URL</label>\n              <input ng-model=\"gym.logo\" placeholder=\"http://google.com/your_image_location\" class=\"form-control\"/>\n              <button type=\"button\" ngf-select=\"upload($file, \'logo\')\" ng-model=\"file\" name=\"file\" ngf-max-size=\"2MB\">Upload Logo Image</button>\n            </div>\n            <button type=\"submit\">Save</button>\n          </form>\n        </div>\n      </div>\n    </div>\n  </div>\n  <footer></footer>\n</div>");
$templateCache.put("viewroutes/viewroutes.html","\n<div class=\"row\">\n  <div class=\"col-md-12\">\n    <div class=\"panel top\">\n      <div ui-grid=\"gridOptions\"></div>\n    </div>\n  </div>\n</div>");
$templateCache.put("zone/zone.html","\n<div class=\"row\">\n  <div class=\"col-md-7\">\n    <div class=\"panel top\">\n      <h2>{{zone.name}}</h2>\n      <div class=\"btn-group\">\n        <div ng-if=\"isGymAdmin()\" uib-tooltip=\"add new route\" ng-click=\"openEditRoutePanel()\" class=\"btn-circle\">+</div>\n      </div>\n      <div ui-grid=\"gridOptions\" ui-grid-selection=\"ui-grid-selection\"></div>\n    </div>\n  </div>\n  <div class=\"col-md-5\">\n    <div class=\"panel top\">\n      <h2>Zone Image</h2>\n      <div class=\"btn-group\">\n        <div type=\"button\" ngf-select=\"upload($file, \'image\')\" ngf-max-size=\"2MB\" ng-if=\"isGymAdmin()\" class=\"btn-circle\"><i class=\"glyphicon glyphicon-picture\"></i></div>\n      </div><img ng-src=\"{{zone.image}}\" width=\"100%\"/>\n    </div>\n  </div>\n</div>");
$templateCache.put("zones/zones.html","\n<div class=\"row\">\n  <div class=\"col-md-12\">\n    <div class=\"panel top\">\n      <btncreate save=\"submit\" creating=\"creating\"></btncreate>\n      <h2>Zones</h2>\n      <div ng-if=\"creating\" class=\"add\">\n        <div class=\"form-group\">\n          <label>Zone Name</label>\n          <input ng-model=\"form.name\" placeholder=\"Zone Name\" class=\"form-control\"/>\n        </div>\n      </div>\n      <div ng-repeat=\"zone in zones\" style=\"position: relative; width: 30%; height: 200px; display: inline-block;\" ui-sref=\"gyms.zone({gymId: zone.gymId, zoneId: zone.id})\" class=\"zone\"><img style=\"width: 100%;\" ng-src=\"{{zone.image}}\"/>\n        <div style=\"width: 90%; position: absolute; top: 20px; background-color: white; border-radius: 10px; padding: 10px;\" class=\"name\">{{zone.name}}</div>\n        <button ui-sref=\"gyms.zone({gymId: gymId, zoneId: zone.id})\">Edit</button>\n      </div>\n    </div>\n  </div>\n</div>");
$templateCache.put("components/banner/template.html","\n<div ng-style=\"{\'background-image\': \'url(\' + gym.banner + \')\'}\" class=\"panel\">\n  <div ng-style=\"{\'background-image\': \'url(\' + gym.logo + \')\'}\" class=\"logo\"></div>\n  <div class=\"name\">{{gym.name}}</div>\n</div>");
$templateCache.put("components/btncreate/template.html","\n<div class=\"btn-group\">\n  <div ng-if=\"!creating\" uib-tooltip=\"create\" ng-click=\"create()\" class=\"btn-circle\">+</div>\n  <div ng-if=\"creating\" uib-tooltip=\"save\" ng-click=\"preSave()\" class=\"btn-circle green\">&#10003;</div>\n  <div ng-if=\"creating\" uib-tooltip=\"cancel\" ng-click=\"cancel()\" class=\"btn-circle gray\">&times;</div>\n</div>");
$templateCache.put("components/btnedit/template.html","\n<div class=\"btn-group\">\n  <div uib-tooltip=\"delete\" ng-click=\"delete()\" class=\"btn-circle\"> <i class=\"glyphicon glyphicon-trash\"></i></div>\n  <div ng-if=\"!editing\" uib-tooltip=\"edit\" ng-click=\"edit()\" class=\"btn-circle\">&#9998;</div>\n  <div ng-if=\"editing\" uib-tooltip=\"save\" ng-click=\"preSave()\" class=\"btn-circle green\">&#10003;</div>\n  <div ng-if=\"editing\" uib-tooltip=\"cancel\" ng-click=\"cancel()\" class=\"btn-circle gray\">&times;</div>\n</div>");
$templateCache.put("components/comments/template.html","\n<div class=\"panel top\">\n  <div ng-repeat=\"comment in comments\"></div>\n</div>");
$templateCache.put("components/header/template.html","\n<div class=\"top\"><img src=\"assets/images/setter-logo.svg\" height=\"35px\" width=\"35px\" alt=\"Setter\" class=\"logo text-right mr1 mb1\"/>\n  <div class=\"links\">\n    <div ng-if=\"$root.isGymAccount()\" ui-sref=\"gyms.news({gymId: $root.accountId()})\" class=\"link\"><i class=\"fa fa-home\"></i>Home</div>\n    <div ng-if=\"$root.hasHomeGymId()\" ui-sref=\"gyms.news({gymId: $root.getHomeGymId()})\" class=\"link\"><i class=\"fa fa-home\"></i>Home</div>\n    <div ui-sref=\"profile({userId: $root.accountId()})\" ng-if=\"$root.isLoggedIn() &amp;&amp; !$root.isGymAccount()\" class=\"link\"><i class=\"fa fa-user\"></i>Profile</div>\n    <div ui-sref=\"setters({gymId: gymId})\" ng-if=\"$root.isGymAccount()\" class=\"link\"><i class=\"fa fa-users\"></i>Setters</div>\n    <div ui-sref=\"manageroutes({gymId: gymId})\" ng-if=\"$root.isGymAccount()\" class=\"link\"><i class=\"fa fa-book\"></i>Manage Routes</div>\n    <div ui-sref=\"findgym\" ng-if=\"!$root.isGymAccount()\" class=\"link\"><i class=\"fa fa-search\"></i>Gyms</div>\n    <div ui-sref=\"finduser\" ng-if=\"!$root.isGymAccount()\" class=\"link\"><i class=\"fa fa-users\"></i>Users</div>\n    <div style=\"float: right\" ng-if=\"$root.isGymAccount()\" ui-sref=\"gymsettings({gymId: $root.accountId()})\" class=\"link\"><i class=\"fa fa-gear\"></i>Settings</div>\n  </div>\n  <div class=\"subnav\">\n    <div ui-sref=\"gyms.news({gymId: gymId})\" class=\"link\"><i class=\"fa fa-newspaper-o\"></i>News</div>\n    <div ui-sref=\"gyms.zones({gymId: gymId})\" class=\"link\"><i class=\"fa fa-map-o\"></i>Zones</div>\n    <div ui-sref=\"gyms.routes({gymId: gymId})\" class=\"link\"><i class=\"fa fa-search\"></i>Routes</div>\n    <div ui-sref=\"gyms.community({gymId: gymId})\" class=\"link\"><i class=\"fa fa-commenting-o\"></i>Community</div>\n    <div ui-sref=\"gyms.members({gymId: gymId})\" class=\"link\"><i class=\"fa fa-users\"></i>Members</div>\n    <div ui-sref=\"gyms.analytics({gymId: gymId})\" class=\"link\"><i class=\"fa fa-bar-chart\"></i>Analytics</div>\n    <div ui-sref=\"gyms.info({gymId: gymId})\" class=\"link\"><i class=\"fa fa-info\"></i>Info</div>\n  </div>\n</div>");
$templateCache.put("components/editroutepanel/template.html","\n<div ng-show=\"show\" class=\"route-panel\"> \n  <div class=\"right\">\n    <button ng-click=\"show = false;\">X</button>\n  </div>\n  <hr/>\n  <div class=\"left\">\n    <h3>Set Route</h3>\n    <form ng-submit=\"submit()\">\n      <div class=\"row\">\n        <div class=\"col-md-6 left\"><span>Type</span></div>\n        <div class=\"col-md-6 right\">\n          <select ng-model=\"route.type\" ng-options=\"type as type.name for type in types track by type.id\"></select>\n        </div>\n      </div>\n      <div ng-if=\"route.type.id === 0\" class=\"row\">\n        <div class=\"col-md-6 left\"><span>Grade</span></div>\n        <div class=\"col-md-6 right\">\n          <select ng-model=\"route.grade\" ng-options=\"grade as grade.name for grade in boulderGrades track by grade.id\"></select>\n        </div>\n      </div>\n      <div ng-if=\"route.type.id !== 0\" class=\"row\">\n        <div class=\"col-md-6 left\"><span>Grade</span></div>\n        <div class=\"col-md-6 right\">\n          <select ng-model=\"route.grade\" ng-options=\"grade as grade.name for grade in ropeGrades track by grade.id\"></select>\n        </div>\n      </div>\n      <div class=\"row\">\n        <div class=\"col-md-4 left\"><span>Color</span></div>\n        <div class=\"col-md-8 right\">\n          <div ng-repeat=\"color in colors\" ng-style=\"{\'background-color\': color.value}\" ng-click=\"route.colorId = color.id\" ng-class=\"{\'selected\': route.colorId === color.id}\" class=\"color\"></div>\n        </div>\n      </div>\n      <div class=\"row\">\n        <div class=\"col-md-6 left\"><span>Setter</span></div>\n        <div class=\"col-md-6 right\">\n          <select ng-model=\"route.setter\" ng-options=\"setter as setter.name for setter in setters track by setter.id\"></select>\n        </div>\n      </div>\n      <div class=\"row\">\n        <div class=\"col-md-6 left\"><span>Name</span></div>\n        <div class=\"col-md-6 right\">\n          <input placeholder=\"My Super Awesome Route!\" ng-model=\"route.name\"/>\n        </div>\n      </div>\n      <div class=\"row\">\n        <div class=\"col-md-6 left\"><span>Note</span></div>\n        <div class=\"col-md-6 right\">\n          <input placeholder=\"Side Wall Off!\" ng-model=\"route.note\"/>\n        </div>\n      </div>\n      <div class=\"row\">\n        <button type=\"submit\">Create Route</button>\n      </div>\n    </form>\n  </div>\n</div>");
$templateCache.put("components/landing/template.html","\n<div class=\"section section-main\">\n  <div class=\"background-photo\"></div>\n  <div class=\"container\">\n    <div class=\"row\">\n      <div class=\"col-md-5\">\n        <div class=\"row\">\n          <div class=\"col-md-4\"><img src=\"assets/images/setter-logo.svg\" class=\"logo\"/></div>\n          <div class=\"col-md-12\">\n            <h1>Setter</h1>\n          </div>\n        </div>\n        <div class=\"row\">\n          <h2>The indoor climbing manager for <br/>setters, climbers, and gyms.</h2>\n          <button>Get Started ></button>\n        </div>\n      </div>\n      <div class=\"col-md-5\">     <img src=\"assets/images/splash1.png\"/></div>\n    </div>\n  </div>\n</div>\n<div class=\"section section-for-gyms\">\n  <div class=\"container\">\n    <div class=\"row\">\n      <div class=\"col-md-12 center\">\n        <h2>Setter for Climbing Gyms</h2>\n      </div>\n      <div class=\"col-md-6\">\n        <div class=\"snippit\"><i class=\"fa fa-stats\"></i>\n          <h3>Gain insight on your gym\'s climbers</h3>\n          <p>Find out what grades they climb, what they’re diggin’, and how often they\'re climbing.</p>\n        </div>\n        <div class=\"snippit\"><i class=\"fa fa-stats\"></i>\n          <h3>Manage your gym\'s setters</h3>\n          <p>Track their bouldering, lead, and top rope sets and their awesome peformance.      </p>\n        </div>\n      </div>\n      <div class=\"col-md-6\">\n        <div class=\"snippit\"><i class=\"fa fa-stats\"></i>\n          <h3>Archive your routes and problems</h3>\n          <p>Keep track of your past top rope, and lead sets for future reference, such as when scheduling setters.</p>\n        </div>\n        <div class=\"snippit\"><i class=\"fa fa-stats\"></i>\n          <h3>Send alerts to your climbers</h3>\n          <p>Let them know of new routes, upcoming competitions, events or special hours.</p>\n        </div>\n      </div>\n    </div>\n    <div class=\"row\">       \n      <div class=\"col-md-6\">\n        <h1>Are you a climbing gym looking to manage your routes?  </h1><br/>\n        <h2>Start your 30 day free trial today!</h2>\n        <h2>Gym Registration</h2>\n        <form name=\"registerGymForm\" ng-submit=\"registerGym()\">\n          <div class=\"form-group\">\n            <label>Gym\'s Email</label>\n            <input ng-model=\"gym.email\" placeholder=\"email\" type=\"email\" required=\"required\" class=\"form-control\"/>\n          </div>\n          <div class=\"form-group\">\n            <label>Gym\'s Password</label>\n            <input ng-model=\"gym.password\" placeholder=\"password\" type=\"password\" required=\"required\" class=\"form-control\"/>\n          </div>\n          <div class=\"form-group\">\n            <label>Gym\'s Name</label>\n            <input ng-model=\"gym.name\" placeholder=\"gym name\" required=\"required\" class=\"form-control\"/>\n          </div>\n          <div class=\"form-group\">\n            <label>Gym\'s Address</label>\n            <input ng-model=\"gym.address\" placeholder=\"gym address\" required=\"required\" class=\"form-control\"/>\n          </div>\n          <button type=\"submit\" ng-disabled=\"registerGymForm.$invalid\">Register</button>\n        </form>\n      </div>\n    </div>\n  </div>\n</div>\n<div class=\"section section-for-climbers\">\n  <div class=\"container\">\n    <div class=\"row\">\n      <div class=\"col-md-12 center\">\n        <h2>Setter for Climbers</h2>\n      </div>\n      <div class=\"col-md-6\">\n        <div class=\"snippit\"><i class=\"fa fa-stats\"></i>\n          <h3>Log your sends, track your progress</h3>\n          <p>Get feedback on your performance, keep track of your send history, or look up past routes you and your friends have sent</p>\n        </div>\n        <div class=\"snippit\"><i class=\"fa fa-stats\"></i>\n          <h3>Connect with your community</h3>\n          <p>Know what your friends and fellow climbers are sending, and share your beta with your gym</p>\n        </div>\n      </div>\n      <div class=\"col-md-6\">\n        <div class=\"snippit\"><i class=\"fa fa-stats\"></i>\n          <h3>Leave gyms feedback on routes & problems</h3>\n          <p>Rate your gym\'s routes and problems to help them better serve you and your community</p>\n        </div>\n        <div class=\"snippit\"><i class=\"fa fa-stats\"></i>\n          <h3>Search through gyms</h3>\n          <p>Find the newest and most popular routes at your gym, or find your next project</p>\n        </div>\n      </div>\n    </div>\n    <div class=\"row\">\n      <div class=\"col-md-6 col-md-push-6\">\n        <h2>Create your free account now and join the community!</h2>\n        <h2>Climber Registration</h2>\n        <form ng-submit=\"registerUser()\" name=\"registerUserForm\">\n          <div class=\"form-group\">\n            <label>Climber\'s Email</label>\n            <input ng-model=\"user.email\" placeholder=\"email\" class=\"form-control\"/>\n          </div>\n          <div class=\"form-group\">\n            <label>Climber\'s Password</label>\n            <input ng-model=\"user.password\" placeholder=\"password\" type=\"password\" class=\"form-control\"/>\n          </div>\n          <div class=\"form-group\">\n            <label>Climber\'s First Name</label>\n            <input ng-model=\"user.firstname\" placeholder=\"first name\" class=\"form-control\"/>\n          </div>\n          <div class=\"form-group\">\n            <label>Climber\'s Last Name</label>\n            <input ng-model=\"user.lastname\" placeholder=\"last name\" class=\"form-control\"/>\n          </div>\n          <button type=\"submit\">Register</button>\n        </form>\n      </div>\n    </div>\n  </div>\n</div>\n<div class=\"section section-footer\">\n  <div class=\"container\">\n    <div class=\"row\">\n      <div class=\"col-md-4 center\">\n        <h4>Connect with us</h4>\n      </div>\n      <div class=\"col-md-4 center\">\n        <h4>Join our mailing list</h4>\n      </div>\n      <div class=\"col-md-4 center\">\n        <h4>Site info</h4>\n      </div>\n    </div>\n  </div>\n</div>");
$templateCache.put("components/manageroutes/template.html","\n<div style=\"padding-left: 30px; padding-right: 30px;\">\n  <div class=\"panel top\">\n    <h2>Manage Routes</h2>\n    <div ui-grid=\"gridOptions\" ui-grid-selection=\"ui-grid-selection\"></div>\n    <button ng-click=\"stripSelected()\"> <i class=\"fa fa-trash\"></i>Strip Selected</button>\n  </div>\n</div>");
$templateCache.put("components/navigation/template.html","\n<div class=\"panel\">\n  <ul>\n    <li ui-sref=\"gyms.news({gymId: gymId})\"><i class=\"fa fa-newspaper-o\"></i>News</li>\n    <li ui-sref=\"gyms.zones({gymId: gymId})\"><i class=\"fa fa-map-o\"></i>Zones</li>\n    <li ui-sref=\"gyms.routes({gymId: gymId})\"><i class=\"fa fa-search\"></i>Routes</li>\n    <li ui-sref=\"gyms.community({gymId: gymId})\"><i class=\"fa fa-commenting-o\"></i>Community</li>\n    <li ui-sref=\"gyms.members({gymId: gymId})\"><i class=\"fa fa-users\"></i>Members</li>\n    <li ui-sref=\"gyms.analytics({gymId: gymId})\"><i class=\"fa fa-bar-chart\"></i>Analytics</li>\n    <li ui-sref=\"gyms.info({gymId: gymId})\"><i class=\"fa fa-info\"></i>Info</li>\n  </ul>\n</div>");
$templateCache.put("components/preview/template.html","\n<div class=\"panel top\">\n  <h2>Zone Image</h2>\n  <button type=\"button\" ngf-select=\"upload($file, \'image\')\" ngf-max-size=\"2MB\">Upload Zone Image</button><img ng-src=\"{{zone.image}}\" width=\"100%\"/>\n</div>");
$templateCache.put("components/register/template.html","\n<input placeholder=\"username\"/><br/>\n<input placeholder=\"password\"/>");
$templateCache.put("components/register-form/template.html","\n<input placeholder=\"username\"/><br/>\n<input placeholder=\"password\"/>");
$templateCache.put("components/routepanel/template.html","\n<div ng-show=\"show\" class=\"route-panel\"> \n  <div class=\"right\">\n    <button>Edit</button>\n    <button ng-click=\"strip()\">Strip</button>\n    <button ng-click=\"show = false;\">X</button>\n  </div>\n  <hr/>\n  <div class=\"center\"><img src=\"{{zone.image}}\" width=\"100%\"/></div>\n  <hr/>\n  <div class=\"left\">\n    <h3>Route Information</h3>\n    <div class=\"row\">\n      <div class=\"col-md-6 left\"><span>Name</span></div>\n      <div class=\"col-md-6 right\"><span>{{route.name}}</span></div>\n    </div>\n    <div class=\"row\">\n      <div class=\"col-md-6 left\"><span>Note</span></div>\n      <div class=\"col-md-6 right\"><span>{{route.note}}</span></div>\n    </div>\n    <div class=\"row\">\n      <div class=\"col-md-6 left\"><span>Avg. Rating</span></div>\n      <div class=\"col-md-6 right\"><span>{{rating}}</span></div>\n    </div>\n    <div class=\"row\">\n      <div class=\"col-md-6 left\"><span>Grade</span></div>\n      <div class=\"col-md-6 right\"><span>{{grade.name}}</span></div>\n    </div>\n    <div class=\"row\">\n      <div class=\"col-md-6 left\"><span>Color</span></div>\n      <div class=\"col-md-6 right\">\n        <div ng-style=\"{\'background-color\': color.value}\" class=\"color\"></div>\n      </div>\n    </div>\n    <div class=\"row\">\n      <div class=\"col-md-6 left\"><span>Zone</span></div>\n      <div class=\"col-md-6 right\"><span>{{zone.name}}</span></div>\n    </div>\n    <div class=\"row\">\n      <div class=\"col-md-6 left\"><span>Setter</span></div>\n      <div class=\"col-md-6 right\"><span>{{setter.firstname}} {{setter.lastname}}</span></div>\n    </div>\n    <div class=\"row\">\n      <div class=\"col-md-6 left\"><span>Date Set</span></div>\n      <div class=\"col-md-6 right\"><span>{{route.createdAt | amCalendar:referenceTime:formats}}</span></div>\n    </div>\n  </div>\n  <div class=\"projecting\"></div>\n  <div class=\"sends\"></div>\n  <div class=\"comments\"></div>\n</div>");
$templateCache.put("components/sends/template.html","\n<div class=\"panel top\">\n  <h3>{{send.user}}</h3>\n</div>");
$templateCache.put("components/setters/template.html","\n<div class=\"panel top\">\n  <div class=\"btn-group\">\n    <div ng-if=\"!creating\" uib-tooltip=\"create\" ng-click=\"new()\" class=\"btn-circle\">+</div>\n    <div ng-if=\"creating\" uib-tooltip=\"save\" ng-click=\"submit()\" class=\"btn-circle green\">&#10003;</div>\n    <div ng-if=\"creating\" uib-tooltip=\"cancel\" ng-click=\"cancel()\" class=\"btn-circle gray\">&times;</div>\n  </div>\n  <h2>Setters</h2>\n  <div ng-if=\"creating\">\n    <div class=\"add\">\n      <div class=\"form-group\">\n        <label>First Name</label>\n        <input ng-model=\"form.firstname\" placeholder=\"First Name\" class=\"form-control\"/>\n      </div>\n      <div class=\"form-group\">\n        <label>Last Name</label>\n        <input ng-model=\"form.lastname\" placeholder=\"Last Name\" class=\"form-control\"/>\n      </div>\n    </div>\n  </div>\n  <div ng-repeat=\"setter in setters\" class=\"setters\">\n    <div class=\"flag member\"> <img ng-src=\"{{setter.image}}\"/>\n      <div class=\"text\">{{setter.firstname}} {{setter.lastname}}</div>\n    </div>\n  </div>\n</div>");
$templateCache.put("components/zone/template.html","\n<div class=\"panel top\">\n  <h2>{{zone.name}}</h2>\n  <div class=\"add\">\n    <button ng-click=\"openEditRoutePanel()\">Add Route</button>\n  </div>\n  <div ng-repeat=\"route in routes\" ng-click=\"openRoutePanel(route)\" class=\"route\">{{route.name}}</div>\n</div>");}]);