/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('UserProfileController', [
        '$scope',
        '$routeParams',
        'LoginService',
        'UsersService',
        function ($scope, $routeParams, LoginService, UsersService) {
            'use strict';

            $scope.userId = $routeParams.userId;

            Chart.defaults.global.colours[0].fillColor = "rgba(255,153,0,1)";

            $scope.options = {
                scaleFontColor: "#000",
                scaleFontSize: 20
            }

            var createBoulderSendsBarGraph = function (pData) {
                var dataObject = {},
                    i,
                    send,
                    name,
                    key,
                    entry,
                    labels = [],
                    dataArray = [],
                    dataCopy = pData.slice(0);

                $scope.boulderSendsBarGraph = {};

                for (i = 0; i < dataCopy.length; i += 1) {
                    send = dataCopy[i];
                    name = send.name;
                    if (!dataObject[name]) {
                        dataObject[name] = 0;
                    }
                    dataObject[name] += 1;
                }

                var preData = [];
                for (key in dataObject) {
                    entry = dataObject[key];
                    preData.push({
                        label: key,
                        data: entry
                    })
                }

                preData.sort(function(a, b) {
                    return a.label.localeCompare(b.label);
                });

                for (i = 0; i < preData.length; i++) {
                    labels.push(preData[i].label);
                    dataArray.push(preData[i].data);
                };
                $scope.boulderSendsBarGraph.labels = labels;
                $scope.boulderSendsBarGraph.data = [dataArray];
            };


            var createRopeSendsBarGraph = function (pData) {
                var dataObject = {},
                    i,
                    send,
                    name,
                    key,
                    entry,
                    labels = [],
                    dataArray = [],
                    dataCopy = pData.slice(0);

                $scope.ropeSendsBarGraph = {};

                for (i = 0; i < dataCopy.length; i += 1) {
                    send = dataCopy[i];
                    name = send.name;
                    if (!dataObject[name]) {
                        dataObject[name] = 0;
                    }
                    dataObject[name] += 1;
                }

                var preData = [];
                for (key in dataObject) {
                    entry = dataObject[key];
                    preData.push({
                        label: key,
                        data: entry
                    })
                }

                preData.sort(function(a, b) {
                    return a.label.localeCompare(b.label);
                });

                for (i = 0; i < preData.length; i++) {
                    labels.push(preData[i].label);
                    dataArray.push(preData[i].data);
                };
                $scope.ropeSendsBarGraph.labels = labels;
                $scope.ropeSendsBarGraph.data = [dataArray];
            };

            var calculateBoulderGrade = function (pData) {
                var dataCopy = pData.slice(0);
                dataCopy.sort(function (a, b) {
                    return a.value - b.value;
                });

                var sum = 0;
                var count = 0;
                var i;
                for (i = 0; i < dataCopy.length && i < 10; i += 1) {
                    sum += dataCopy[i].value;
                    count += 1;
                }

                var average = sum / count;
                $scope.boulderGrade = average;
                $scope.showBoulderGrade = dataCopy.length >= 10;
            };

            var calculateRopeGrade = function (pData) {
                var dataCopy = pData.slice(0);
                dataCopy.sort(function (a, b) {
                    return a.value - b.value;
                });

                var sum = 0;
                var count = 0;
                var i;
                for (i = 0; i < dataCopy.length && i < 10; i += 1) {
                    sum += dataCopy[i].value;
                    count += 1;
                }

                var average = sum / count;
                $scope.ropeGrade = average;
                $scope.showRopeGrade = dataCopy.length >= 10;
            };

            UsersService.getUser($scope.userId)
                .success(function (pData) {
                    $scope.user = pData;
                });

            UsersService.getBoulderSends($scope.userId)
                .success(function (pData) {
                    createBoulderSendsBarGraph(pData);
                    calculateBoulderGrade(pData);
                });

            UsersService.getRopeSends($scope.userId)
                .success(function (pData) {
                    createRopeSendsBarGraph(pData);
                    calculateRopeGrade(pData);
                });

        }]);
