module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Comments", {
          params: searchParams
        }).then(function(Comments) {
          return resolve(Comments.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Comments/" + id).then(function(Comment) {
          return resolve(Comment.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(Comment) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/Comments", Comment).then(function(Comment) {
          return resolve(Comment.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(Comment) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/Comments/") + Comment.id, Comment).then(function(Comment) {
          return resolve(Comment.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(Comment) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/Comments/") + Comment.id).then(function(Comment) {
          return resolve(Comment.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
