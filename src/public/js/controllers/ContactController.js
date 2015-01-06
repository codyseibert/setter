/*jslint nomen: true */
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('ContactController', [
        '$scope',
        'FeedbackService',
        function (
            $scope,
            FeedbackService
        ) {
            'use strict';

            $scope.send = function () {
                FeedbackService.createFeedback($scope.form.name, $scope.form.message)
                    .success(function () {
                        $scope.thanks = true;
                    })
                    .error(function () {
                        $scope.error = true;
                    });
            };
        }]);
