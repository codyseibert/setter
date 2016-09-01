module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Accounts", {
          params: searchParams
        }).then(function(Accounts) {
          return resolve(Accounts.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Accounts/" + id).then(function(Account) {
          return resolve(Account.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(Account) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/Accounts", Account).then(function(Account) {
          return resolve(Account.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(Account) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/Accounts/") + Account.id, Account).then(function(Account) {
          return resolve(Account.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(Account) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/Accounts/") + Account.id).then(function(Account) {
          return resolve(Account.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
