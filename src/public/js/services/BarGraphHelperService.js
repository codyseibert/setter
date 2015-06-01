/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('BarGraphHelperService', [
        'DateFormatService',
        function (
          DateFormatService
        ) {
        'use strict';

        return {
            labelParams: function (pData, isRope){
                var i;
                var labels = [];
                var dataArray = [];
                for (i = 0; i < pData.length; i += 1) {
                  var data = pData[i];
                  if (!data.grade) continue;
                  dataArray.push(data.count);
                  var prefix = 'V'
                  if (isRope)
                    prefix = '5.'
                  labels.push(prefix + data.grade);
                }
                return {
                    labels: labels,
                    data: [dataArray]
                };
            },
            preprocess2: function (pData){
                var i;
                var labels = [];
                var dataArray = [];
                for (i = 0; i < pData.length; i += 1) {
                  var data = pData[i];
                  if (!data.name) continue;
                  dataArray.push(data.count);
                  labels.push(data.name);
                }
                return {
                    labels: labels,
                    datasets: [{
                      data: dataArray,
                      fillColor: "rgba(174, 203, 131, 0.4)",
                      strokeColor: "#A3BF7C"
                    }]
                };
            },
            preprocess: function (pData){
                var i;
                var labels = [];
                var dataArray = [];
                for (i = 0; i < pData.length; i += 1) {
                  var data = pData[i];
                  if (!data.name) continue;
                  dataArray.push(data.count);
                  labels.push(data.name);
                }
                return {
                    labels: labels,
                    series: [dataArray]
                };
            },
            preprocessProgress: function (pData, pType) {
                var i;
                var labels = [];
                var dataArray = [];

                if (pData.length === 0) {
                    pData.push({
                        date: "2015-01-01T05:00:00.000Z",
                        bouldering_grade: 0,
                        lead_grade: 6,
                        toprope_grade: 6
                    });
                }

                for (i = 0; i < pData.length; i += 1) {
                  var data = pData[i];
                  dataArray.push(data[pType]);
                  labels.push(DateFormatService.formatMonth(data.date));
                }

                for (var i = dataArray.length - 1; i >= 1; i--) {
                    if (dataArray[i] < dataArray[i-1]) {
                      dataArray[i - 1] = dataArray[i];
                    }
                }

                return {
                    labels: labels,
                    series: [dataArray]
                };
            }
        };
    }]);
