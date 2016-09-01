module.exports = [
  '$http', '$q', 'BASE_URL', 'jwtHelper', 'localStorageService', function($http, $q, BASE_URL, jwtHelper, localStorageService) {
    this.token = localStorageService.get('token');
    this.user = localStorageService.get('user');
    this.login = (function(_this) {
      return function(email, password) {
        return $q(function(resolve, reject) {
          return $http.post(BASE_URL + "/Login", {
            email: email,
            password: password
          }).then(function(jwt) {
            _this.user = jwtHelper.decodeToken(jwt.data);
            _this.token = jwt.data;
            localStorageService.set('token', _this.token);
            localStorageService.set('user', _this.user);
            return resolve();
          })["catch"](function(err) {
            return reject(err);
          });
        });
      };
    })(this);
    this.logout = function() {
      this.user = null;
      this.token = null;
      localStorageService.remove('token');
      return localStorageService.remove('user');
    };
    return this;
  }
];
