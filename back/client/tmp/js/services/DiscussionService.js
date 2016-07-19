module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Discussions", {
          params: searchParams
        }).then(function(discussions) {
          return resolve(discussions.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Discussions/" + id).then(function(discussion) {
          return resolve(discussion.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(discussion) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/Discussions", discussion).then(function(discussion) {
          return resolve(discussion.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(discussion) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/Discussions/") + discussion.id, discussion).then(function(discussion) {
          return resolve(discussion.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(discussion) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/Discussions/") + discussion.id).then(function(discussion) {
          return resolve(discussion.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
