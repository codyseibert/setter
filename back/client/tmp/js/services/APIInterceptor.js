module.exports = [
  '$injector', function($injector) {
    return {
      request: function(config) {
        var LoginService, token;
        LoginService = $injector.get('LoginService');
        token = LoginService.token;
        if (token != null) {
          config.headers['Authorization'] = token;
        }
        return config;
      }
    };
  }
];
