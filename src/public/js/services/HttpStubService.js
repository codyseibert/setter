angular.module('SETTER')
    .factory('HttpStubService', [
    '$q',
    function ($q) {
        return {
            createStub: function () {
                deferred = $q.defer();
                promise = deferred.promise;

                promise.success = function (fn) {
                    promise.then(fn);
                    return promise;
                }

                promise.error = function (fn) {
                    promise.then(null, fn);
                    return promise;
                }

                return {promise:promise, deferred: deferred};
            }
        };
    }]);
