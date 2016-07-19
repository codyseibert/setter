var app;

app = require('angular').module('setter');

app.directive('banner', require('./banner'));

app.directive('comments', require('./comments'));

app.directive('editroutepanel', require('./editroutepanel'));

app.directive('header', require('./header'));

app.directive('landing', require('./landing'));

app.directive('manageroutes', require('./manageroutes'));

app.directive('navigation', require('./navigation'));

app.directive('preview', require('./preview'));

app.directive('register', require('./register'));

app.directive('routepanel', require('./routepanel'));

app.directive('sends', require('./sends'));

app.directive('setters', require('./setters'));

app.directive('zone', require('./zone'));

app.directive('btncreate', require('./btncreate'));

app.directive('btnedit', require('./btnedit'));