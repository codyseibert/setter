module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Suggestions", {
          params: searchParams
        }).then(function(Suggestions) {
          return resolve(Suggestions.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Suggestions/" + id).then(function(Suggestion) {
          return resolve(Suggestion.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(Suggestion) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/Suggestions", Suggestion).then(function(Suggestion) {
          return resolve(Suggestion.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(Suggestion) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/Suggestions/") + Suggestion.id, Suggestion).then(function(Suggestion) {
          return resolve(Suggestion.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(Suggestion) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/Suggestions/") + Suggestion.id).then(function(Suggestion) {
          return resolve(Suggestion.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
