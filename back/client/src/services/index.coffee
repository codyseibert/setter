app = require('angular').module 'setter'

app.service 'FileService', require './FileService'
app.service 'User', require './User'
app.service 'GymAlertService', require './GymAlertService'
app.service 'LoginService', require './LoginService'
app.factory 'APIInterceptor', require './APIInterceptor'
