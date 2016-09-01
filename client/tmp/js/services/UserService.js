module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Users", {
          params: searchParams
        }).then(function(Users) {
          return resolve(Users.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Users/" + id).then(function(User) {
          return resolve(User.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(User) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/Users", User).then(function(User) {
          return resolve(User.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(User) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/Users/") + User.id, User).then(function(User) {
          return resolve(User.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(User) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/Users/") + User.id).then(function(User) {
          return resolve(User.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
