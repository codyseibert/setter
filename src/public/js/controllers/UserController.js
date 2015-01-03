/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, Chart: false, moment: false */

angular.module('SETTER')
    .controller('UserController', [
        '$scope',
        '$routeParams',
        'LoginService',
        'UsersService',
        'BarGraphHelperService',
        'DateFormatService',
        function (
            $scope,
            $routeParams,
            LoginService,
            UsersService,
            BarGraphHelperService,
            DateFormatService
        ) {
            'use strict';

            var createBoulderSendsBarGraph,
                createRopeSendsBarGraph,
                createBoulderSendsLineGraph,
                createRopeSendsLineGraph,
                calculateBoulderGrade,
                calculateRopeGrade;

            $scope.userId = parseInt($routeParams.userId, 10);

            $scope.options = {
                scaleFontColor: "#000",
                scaleFontSize: 20
            };

            createBoulderSendsBarGraph = function (pData) {
                var data;
                data = BarGraphHelperService.generateRouteCountGraphData(pData);
                $scope.boulderSendsBarGraph = {
                    labels: data.labels,
                    data: data.data,
                    hasData: data.data[0].length > 0
                };
            };

            createRopeSendsBarGraph = function (pData) {
                var data;
                data = BarGraphHelperService.generateRouteCountGraphData(pData);
                $scope.ropeSendsBarGraph = {
                    labels: data.labels,
                    data: data.data,
                    hasData: data.data[0].length > 0
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
                    bucket,
                    sort,
                    max;

                $scope.boulderSendsLineGraph = {
                    options: {
                        scaleFontColor: "#000",
                        scaleFontSize: 20,

                        scaleOverride: true,
                        scaleSteps: 6,
                        scaleStepWidth: 2,
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

                sort = function (a, b) {
                    return b.value - a.value;
                };

                // average each bucket
                for (i = 0; i < buckets.length; i += 1) {
                    bucket = buckets[i];
                    bucket.sort(sort);
                    max = bucket.slice(0, 5);

                    sum = 0;
                    for (j = 0; j < max.length; j += 1) {
                        sum += max[j].value;
                    }
                    average = 0;
                    if (max.length !== 0) {
                        average = sum / max.length;
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
                    month,
                    sort,
                    max;

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

                sort = function (a, b) {
                    return b.value - a.value;
                };

                // average each bucket
                for (i = 0; i < buckets.length; i += 1) {
                    bucket = buckets[i];
                    bucket.sort(sort);
                    max = bucket.slice(0, 5);

                    sum = 0;
                    for (j = 0; j < max.length; j += 1) {
                        sum += max[j].value;
                    }
                    average = 0;
                    if (max.length !== 0) {
                        average = sum / max.length;
                    }
                    buckets[i] = Math.max(5.08, 5  + average / 100.0);
                }

                $scope.ropeSendsLineGraph.labels = months;
                $scope.ropeSendsLineGraph.data = [buckets];
            };

            calculateBoulderGrade = function (pData) {
                var dataCopy,
                    sum,
                    i,
                    max,
                    average;

                dataCopy = pData.slice(0);
                dataCopy.sort(function (a, b) {
                    return b.value - a.value;
                });

                max = dataCopy.slice(0, 10);
                sum = 0;
                for (i = 0; i < max.length; i += 1) {
                    sum += dataCopy[i].value;
                }

                average = sum / max.length;
                average = parseFloat(average).toFixed(2);
                $scope.boulderGrade = average;
            };

            calculateRopeGrade = function (pData) {
                var dataCopy,
                    sum,
                    i,
                    max,
                    average;

                dataCopy = pData.slice(0);
                dataCopy.sort(function (a, b) {
                    return b.value - a.value;
                });

                max = dataCopy.slice(0, 10);
                sum = 0;
                for (i = 0; i < max.length; i += 1) {
                    sum += dataCopy[i].value;
                }

                average = sum / max.length;
                average = parseFloat(average).toFixed(2);
                average = average.toString();
                average = average.replace('.', '');
                $scope.ropeGrade = '5.' + average;
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

                    $scope.hasBoulderSends = pData.length > 0;
                });

            UsersService.getRopeSends($scope.userId)
                .success(function (pData) {
                    createRopeSendsBarGraph(pData);
                    createRopeSendsLineGraph(pData);
                    calculateRopeGrade(pData);

                    $scope.hasRopeSends = pData.length > 0;
                });

            UsersService.getUserImage($scope.userId)
                .success(function (pData) {
                    $scope.image = pData;
                });

            UsersService.getActivityStream($scope.userId)
                .success(function (pData) {
                    pData.map(function (pEntry) {
                        pEntry.date = DateFormatService.format(pEntry.date);
                        return pEntry;
                    });
                    $scope.activity = pData;

                    $scope.hasActivity = pData.length > 0;
                });

            $scope.uploadImage = function () {
                angular.element("#image_file").trigger('click');
            };

            angular.element("#image_file").on('change', function () {
                angular.element("#image_submit").trigger('click');
                $scope.image = {
                    url: 'images/loading.gif'
                };
                $scope.$apply();
            });

            $scope.complete = function (content) {
                $scope.image = content;
                LoginService.setImageUrl(content.url);
            };

            $scope.authorization = LoginService.getHeader();
        }]);
