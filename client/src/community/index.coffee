app = require('angular').module 'setter'

app.controller 'communityController', require './communityController'

app.directive 'notifications', require './notifications/notificationsDirective'
app.directive 'notificationsBlankState', require './notifications/notificationsBlankStateDirective'

app.directive 'gears', require './gears/gearsDirective'
app.directive 'gearsBlankState', require './gears/gearsBlankStateDirective'
