/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('BarGraphHelperService', [function () {
        'use strict';

        return {
            generateRouteCountGraphData: function (pData) {
                var dataObject = {},
                    i,
                    route,
                    name,
                    key,
                    entry,
                    labels = [],
                    dataArray = [],
                    dataCopy = pData.slice(0),
                    preData = [];

                // create a mapping between grade name and tally them up
                for (i = 0; i < dataCopy.length; i += 1) {
                    route = dataCopy[i];
                    name = route.name;
                    if (!dataObject[name]) {
                        dataObject[name] = {
                            count: 0,
                            value: route.value
                        };
                    }
                    dataObject[name].count += 1;
                }

                // converting the object tally into an array
                for (key in dataObject) {
                    if (dataObject.hasOwnProperty(key)) {
                        entry = dataObject[key];
                        preData.push({
                            label: key,
                            data: entry.count,
                            value: entry.value
                        });
                    }
                }

                // sort the array by value
                preData.sort(function (a, b) {
                    return a.value - b.value;
                });

                // build up the chart data array
                for (i = 0; i < preData.length; i += 1) {
                    labels.push(preData[i].label);
                    dataArray.push(preData[i].data);
                }

                return {
                    labels: labels,
                    data: [dataArray]
                };
            }
        };
    }]);
