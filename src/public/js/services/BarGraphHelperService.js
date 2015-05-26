/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('BarGraphHelperService', [function () {
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
                    datasets: [{
                      data: dataArray,
                      fillColor: "rgba(174, 203, 131, 0.4)",
                      strokeColor: "#A3BF7C"
                    }]
                };


            }
        };
    }]);
