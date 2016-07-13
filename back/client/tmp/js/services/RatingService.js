module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Ratings", {
          params: searchParams
        }).then(function(Ratings) {
          return resolve(Ratings.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Ratings/" + id).then(function(Rating) {
          return resolve(Rating.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(Rating) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/Ratings", Rating).then(function(Rating) {
          return resolve(Rating.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(Rating) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/Ratings/") + Rating.id, Rating).then(function(Rating) {
          return resolve(Rating.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(Rating) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/Ratings/") + Rating.id).then(function(Rating) {
          return resolve(Rating.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
