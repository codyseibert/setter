module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/GymSuggestions", {
          params: searchParams
        }).then(function(GymSuggestions) {
          return resolve(GymSuggestions.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/GymSuggestions/" + id).then(function(GymSuggestion) {
          return resolve(GymSuggestion.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(GymSuggestion) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/GymSuggestions", GymSuggestion).then(function(GymSuggestion) {
          return resolve(GymSuggestion.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(GymSuggestion) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/GymSuggestions/") + GymSuggestion.id, GymSuggestion).then(function(GymSuggestion) {
          return resolve(GymSuggestion.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(GymSuggestion) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/GymSuggestions/") + GymSuggestion.id).then(function(GymSuggestion) {
          return resolve(GymSuggestion.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
