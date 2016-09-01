module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/SuggestionVotess", {
          params: searchParams
        }).then(function(SuggestionVotess) {
          return resolve(SuggestionVotess.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/SuggestionVotess/" + id).then(function(SuggestionVotes) {
          return resolve(SuggestionVotes.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(SuggestionVotes) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/SuggestionVotess", SuggestionVotes).then(function(SuggestionVotes) {
          return resolve(SuggestionVotes.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(SuggestionVotes) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/SuggestionVotess/") + SuggestionVotes.id, SuggestionVotes).then(function(SuggestionVotes) {
          return resolve(SuggestionVotes.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(SuggestionVotes) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/SuggestionVotess/") + SuggestionVotes.id).then(function(SuggestionVotes) {
          return resolve(SuggestionVotes.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
