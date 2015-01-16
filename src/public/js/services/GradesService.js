/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('GradesService', [
        '$http',
        'HttpStubService',
        function (
            $http,
            HttpStubService
        ) {
        'use strict';

        var boulderGrades = null,
            ropeGrade = null;

        return {
            getBoulderGrades: function () {
                var stub = HttpStubService.createStub();

                if (boulderGrades !== null) {
                    stub.deferred.resolve(boulderGrades);
                } else {
                    $http({
                        method: 'GET',
                        url: 'api/grades/boulder'
                    }).success(function (pData) {
                        boulderGrades = pData;
                        stub.deferred.resolve(boulderGrades);
                    });
                }

                return stub.promise;
            },
            getRopeGrades: function () {
                var stub = HttpStubService.createStub();

                if (ropeGrade !== null) {
                    stub.deferred.resolve(ropeGrade);
                } else {
                    $http({
                        method: 'GET',
                        url: 'api/grades/rope'
                    }).success(function (pData) {
                        ropeGrade = pData;
                        stub.deferred.resolve(ropeGrade);
                    });
                }

                return stub.promise;
            }
        };
    }]);
