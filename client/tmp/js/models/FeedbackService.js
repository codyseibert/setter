module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Feedbacks", {
          params: searchParams
        }).then(function(Feedbacks) {
          return resolve(Feedbacks.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Feedbacks/" + id).then(function(Feedback) {
          return resolve(Feedback.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(Feedback) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/Feedbacks", Feedback).then(function(Feedback) {
          return resolve(Feedback.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(Feedback) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/Feedbacks/") + Feedback.id, Feedback).then(function(Feedback) {
          return resolve(Feedback.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(Feedback) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/Feedbacks/") + Feedback.id).then(function(Feedback) {
          return resolve(Feedback.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
