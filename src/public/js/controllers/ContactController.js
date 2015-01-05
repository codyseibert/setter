/*jslint nomen: true */
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('ContactController', [
        '$scope',
        'FeedbackService',
        'LoginService',
        function (
            $scope,
            FeedbackService,
            LoginService
        ) {
            'use strict';

            $scope.send = function () {
                console.log("sending!");
                FeedbackService.createFeedback($scope.form.name, $scope.form.message)
                    .success(function () {
                        $scope.thanks = true;
                    })
                    .error(function () {
                        $scope.error = true;
                    });
            };
        }]);
