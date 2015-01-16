angular.module('SETTER')
    .factory('HttpStub', [
        '$q',
        function ($q) {
            return {
                createHttpStub: function (pDataToReturn) {
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
