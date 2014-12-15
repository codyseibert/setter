/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, Chart: false, moment: false */

angular.module('SETTER')
    .controller('UserProfileController', [
        '$scope',
        '$routeParams',
        'LoginService',
        'UsersService',
        'BarGraphHelperService',
        function (
            $scope,
            $routeParams,
            LoginService,
            UsersService,
            BarGraphHelperService) {
            'use strict';

            var createBoulderSendsBarGraph,
                createRopeSendsBarGraph,
                createBoulderSendsLineGraph,
                createRopeSendsLineGraph,
                calculateBoulderGrade,
                calculateRopeGrade;

            $scope.userId = $routeParams.userId;

            Chart.defaults.global.colours[0].fillColor = "rgba(174, 216, 80, 1)";
            Chart.defaults.global.colours[0].strokeColor = "rgba(84, 72, 127, 0.5)";
            Chart.defaults.global.colours[0].pointColor = "rgba(84, 72, 127, 0.5)";

            $scope.options = {
                scaleFontColor: "#000",
                scaleFontSize: 20
            };

            var createBoulderSendsBarGraph = function (pData) {
                var data;
                data = BarGraphHelperService.generateRouteCountGraphData(pData);
                $scope.boulderSendsBarGraph = {
                    labels: data.labels,
                    data: data.data
                };
            };

            var createRopeSendsBarGraph = function (pData) {
                var data;
                data = BarGraphHelperService.generateRouteCountGraphData(pData);
                $scope.ropeSendsBarGraph = {
                    labels: data.labels,
                    data: data.data
                };
            };


            createBoulderSendsLineGraph = function (pData) {
                var i,
                    send,
                    dataCopy = pData.slice(0),
                    buckets = [],
                    months,
                    month,
                    sum,
                    average,
                    j,
                    bucket;

                $scope.boulderSendsLineGraph = {
                    options: {
                        scaleFontColor: "#000",
                        scaleFontSize: 20,
                        scaleOverride: true,
                        scaleSteps: 12,
                        scaleStepWidth: 1,
                        scaleStartValue: 0,
                        scaleLabel: '<%= "V" + value %>'
                    }
                };

                for (i = 0; i < 12; i += 1) {
                    buckets.push([]);
                }
                months = [
                    "January",
                    "Feburary",
                    "March",
                    "April",
                    "May",
                    "June",
                    "July",
                    "August",
                    "September",
                    "October",
                    "November",
                    "December"
                ];

                // put into buckets
                for (i = 0; i < dataCopy.length; i += 1) {
                    send = dataCopy[i];
                    send.moment_date = moment(send.date);
                    month = send.moment_date.get('month');
                    buckets[month].push(send);
                }

                // average each bucket
                for (i = 0; i < buckets.length; i += 1) {
                    bucket = buckets[i];
                    sum = 0;
                    for (j = 0; j < bucket.length; j += 1) {
                        sum += bucket[j].value;
                    }
                    average = 0;
                    if (bucket.length !== 0) {
                        average = sum / bucket.length;
                    }
                    buckets[i] = average;
                }


                $scope.boulderSendsLineGraph.labels = months;
                $scope.boulderSendsLineGraph.data = [buckets];
            };

            createRopeSendsLineGraph = function (pData) {
                var i,
                    send,
                    dataCopy = pData.slice(0),
                    buckets,
                    bucket,
                    sum,
                    j,
                    average,
                    months,
                    month;

                $scope.ropeSendsLineGraph = {
                    options: {
                        scaleFontColor: "#000",
                        scaleFontSize: 20,
                        scaleOverride: true,
                        scaleSteps: 6,
                        scaleStepWidth: 0.01,
                        scaleStartValue: 5.08,
                        scaleLabel: '<%=value.replace(".0", ".")%>'
                    }
                };

                buckets = [];
                for (i = 0; i < 12; i += 1) {
                    buckets.push([]);
                }
                months = [
                    "January",
                    "Feburary",
                    "March",
                    "April",
                    "May",
                    "June",
                    "July",
                    "August",
                    "September",
                    "October",
                    "November",
                    "December"
                ];

                // put into buckets
                for (i = 0; i < dataCopy.length; i += 1) {
                    send = dataCopy[i];
                    send.moment_date = moment(send.date);
                    month = send.moment_date.get('month');
                    buckets[month].push(send);
                }

                // average each bucket
                for (i = 0; i < buckets.length; i += 1) {
                    bucket = buckets[i];
                    sum = 0;
                    for (j = 0; j < bucket.length; j += 1) {
                        sum += bucket[j].value;
                    }
                    average = 0;
                    if (bucket.length !== 0) {
                        average = sum / bucket.length;
                    }
                    buckets[i] = Math.max(5.08, 5  + average / 100.0);
                }

                $scope.ropeSendsLineGraph.labels = months;
                $scope.ropeSendsLineGraph.data = [buckets];
            };

            calculateBoulderGrade = function (pData) {
                var dataCopy,
                    sum,
                    count,
                    i,
                    average;

                dataCopy = pData.slice(0);
                dataCopy.sort(function (a, b) {
                    return a.value - b.value;
                });

                sum = 0;
                count = 0;
                for (i = 0; i < dataCopy.length && i < 10; i += 1) {
                    sum += dataCopy[i].value;
                    count += 1;
                }

                average = sum / count;
                $scope.boulderGrade = average;
                $scope.showBoulderGrade = dataCopy.length >= 10;
            };

            calculateRopeGrade = function (pData) {
                var dataCopy,
                    sum,
                    count,
                    i,
                    average;

                dataCopy = pData.slice(0);
                dataCopy.sort(function (a, b) {
                    return a.value - b.value;
                });

                sum = 0;
                count = 0;
                for (i = 0; i < dataCopy.length && i < 10; i += 1) {
                    sum += dataCopy[i].value;
                    count += 1;
                }

                average = sum / count;
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
                    createBoulderSendsLineGraph(pData);
                    calculateBoulderGrade(pData);
                });

            UsersService.getRopeSends($scope.userId)
                .success(function (pData) {
                    createRopeSendsBarGraph(pData);
                    createRopeSendsLineGraph(pData);
                    calculateRopeGrade(pData);
                });
        }]);
