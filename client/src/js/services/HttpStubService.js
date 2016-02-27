/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false, jsPDF: false, naturalSort: false */

angular.module('SETTER')
    .factory('HttpStubService', [
        '$q',
        function ($q) {
            'use strict';

            return {
                createStub: function () {
                    var deferred = $q.defer(),
                        promise = deferred.promise;

                    promise.success = function (fn) {
                        promise.then(fn);
                        return promise;
                    };

                    promise.error = function (fn) {
                        promise.then(null, fn);
                        return promise;
                    };

                    return {
                        promise: promise,
                        deferred: deferred
                    };
                }
            };
        }]);
