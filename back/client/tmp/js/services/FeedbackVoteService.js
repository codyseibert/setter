module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/FeedbackVotes", {
          params: searchParams
        }).then(function(FeedbackVotes) {
          return resolve(FeedbackVotes.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/FeedbackVotes/" + id).then(function(FeedbackVote) {
          return resolve(FeedbackVote.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(FeedbackVote) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/FeedbackVotes", FeedbackVote).then(function(FeedbackVote) {
          return resolve(FeedbackVote.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(FeedbackVote) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/FeedbackVotes/") + FeedbackVote.id, FeedbackVote).then(function(FeedbackVote) {
          return resolve(FeedbackVote.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(FeedbackVote) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/FeedbackVotes/") + FeedbackVote.id).then(function(FeedbackVote) {
          return resolve(FeedbackVote.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
