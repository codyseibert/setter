/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false, jsPDF: false, naturalSort: false */

angular.module('SETTER')
    .controller('BoulderProgressionGraphController', [
        '$scope',
        '$routeParams',
        'UsersService',
        function (
            $scope,
            $routeParams,
            UsersService
        ) {
            'use strict';

            $scope.options = {
                scaleFontColor: "#000",
                scaleFontSize: 20,
                animation: false
            };

            UsersService.getBoulderSends($scope.userId)
                .success(function (pData) {
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
                        //carry,
                        max;

                    $scope.boulderProgressGraph = {
                        options: {
                            scaleFontColor: "#000",
                            scaleFontSize: 20,

                            scaleOverride: true,
                            scaleSteps: 6,
                            scaleStepWidth: 2,
                            scaleStartValue: 0,
                            scaleLabel: '<%= "V" + value %>',

                            animation: false
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

                    //carry = buckets[0];
                    for (i = 0; i < buckets.length; i += 1) {
                        if (buckets[i] === 0) {
                            buckets[i] = null;// carry;
                        } //else {
                            //carry = buckets[i];
                            //}
                        }

                    $scope.boulderProgressGraph.labels = months;
                    $scope.boulderProgressGraph.data = [buckets];
                });
        }]);
