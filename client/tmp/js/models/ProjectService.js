module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Projects", {
          params: searchParams
        }).then(function(Projects) {
          return resolve(Projects.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Projects/" + id).then(function(Project) {
          return resolve(Project.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(Project) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/Projects", Project).then(function(Project) {
          return resolve(Project.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(Project) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/Projects/") + Project.id, Project).then(function(Project) {
          return resolve(Project.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(Project) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/Projects/") + Project.id).then(function(Project) {
          return resolve(Project.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
