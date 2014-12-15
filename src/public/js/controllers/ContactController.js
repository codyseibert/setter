/*jslint nomen: true */
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('ContactController', [
        '$scope',
        '$window',
        'FeedbackService',
        function tosController(
            $scope,
            $window,
            FeedbackService) {
            'use strict';

            $scope.createFeedback = function () {
                FeedbackService.createFeedback($scope.form.name, $scope.form.message)
                    .success(function () {
                    });
            };
        }]);
