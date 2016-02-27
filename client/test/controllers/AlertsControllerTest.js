'use strict';

describe('Controller: AlertsController', function () {

    // Load the controller's module
    beforeEach(module('SETTER'));

    var AboutCtrl,
        scope,
        routeParams,
        AlertsService,
        DateFormatService,
        LoginService,
        q,
        deferred,
        promise,
        $window,
        httpBackend,
        alerts = [
            {
                id: 3,
                message: 'hi',
                date: 'null'
            }
        ],
        ALERT_ID = 2,
        ALERT_TO_DELETE = {id: ALERT_ID},
        GYM_ID = 1;

    // Initialize the controller and a mock scope
    beforeEach(inject(function ($routeParams, $controller, $rootScope, $injector, $q, $httpBackend, _$window_) {
        scope = $rootScope.$new();

        q = $q;
        $window = _$window_;
        $window.confirm = function () { return true; }

        httpBackend = $httpBackend;
        routeParams = $routeParams;
        AlertsService = $injector.get('AlertsService');
        DateFormatService = $injector.get('DateFormatService');
        LoginService = $injector.get('LoginService');
        routeParams.gymId = GYM_ID;

        LoginService.validateLoggedIn = function () {
            return true;
        };

        AlertsService.getAlertsForGym = function () {
            return {
                success: function (pCallback) {
                }
            };
        };
        spyOn(AlertsService, 'getAlertsForGym').and.callThrough();

        AboutCtrl = $controller('AlertsController', {
            $scope: scope,
            $routeParams: routeParams,
            $window: $window,
            AlertsService: AlertsService,
            DateFormatSerivce: DateFormatService,
            LoginService: LoginService
        });
    }));



    it('sets $scope.gymId from the $routeParams.gymId module', function () {
        expect(scope.gymId).toBe(GYM_ID);
    });


    it('invokes AlertsService.getAlertsForGym to GET alerts', function () {
        // Setup

        // Test

        // Assert
        expect(AlertsService.getAlertsForGym).toHaveBeenCalled();
    });

    it('prompts user with a confirmation on attempt to delete an alert', function () {
        // Setup
        AlertsService.deleteAlert = function () {};
        spyOn($window, 'confirm');

        // Test
        scope.delete();

        // Assert
        expect($window.confirm).toHaveBeenCalled();
    });



    it('attempts to send DELETE request object to backend using AlertsService.deleteAlert', function () {
        // Setup
        AlertsService.deleteAlert = function () {
            return { success: function (pCallback) {} };
        };
        spyOn(AlertsService, 'deleteAlert').and.callThrough();

        // Test
        scope.delete({id: ALERT_ID});

        // Assert
        expect(AlertsService.deleteAlert).toHaveBeenCalled();
    });
});
