angular.module('setter', ['ngRoute'])
	.config(function ($routeProvider) {
		'use strict';

		$routeProvider
		.when('/dashboard', {
			controller: 'gymDashboardCtrl',
			templateUrl: 'templates_angular/gym--dashboard.tmpl.html'
		}) 
		.otherwise({
			redirectTo: '/'
		});
	});
