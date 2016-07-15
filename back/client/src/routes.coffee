module.exports = (
  $stateProvider,
  $urlRouterProvider
) ->
  $urlRouterProvider.otherwise '/'

  $stateProvider
    .state 'gyms',
      url: '/gyms'
      abstract: true
      views:
        'main':
          controller: 'gymsController'
          templateUrl: 'gyms/gyms.html'
    .state 'landing',
      url: '/'
      views:
        'main':
          controller: 'landingController'
          templateUrl: 'landing/landing.html'
    .state 'gyms.manageroutes',
      url: '/:gymId/manageroutes'
      views:
        'content':
          controller: 'manageroutesController'
          templateUrl: 'manageroutes/manageroutes.html'
    .state 'register',
      url: '/register'
      views:
        'main':
          controller: 'registerController'
          templateUrl: 'register/register.html'
    .state 'gyms.news',
      url: '/:gymId/news'
      views:
        'content':
          controller: 'newsController'
          templateUrl: 'news/news.html'
    .state 'gyms.info',
      url: '/:gymId/info'
      views:
        'content':
          controller: 'infoController'
          templateUrl: 'info/info.html'
    .state 'gyms.community',
      url: '/:gymId/community'
      views:
        'content':
          controller: 'communityController'
          templateUrl: 'community/community.html'
    .state 'gyms.routes',
      url: '/:gymId/routes'
      views:
        'content':
          controller: 'routesController'
          templateUrl: 'routes/routes.html'
    .state 'gyms.members',
      url: '/:gymId/members'
      views:
        'content':
          controller: 'membersController'
          templateUrl: 'members/members.html'
    .state 'gyms.analytics',
      url: '/:gymId/analytics'
      views:
        'content':
          controller: 'analyticsController'
          templateUrl: 'analytics/analytics.html'
    .state 'gyms.setters',
      url: '/:gymId/setters'
      views:
        'content':
          controller: 'settersController'
          templateUrl: 'setters/setters.html'
    .state 'findgym',
      url: '/findgym'
      views:
        'main':
          controller: 'findGymController'
          templateUrl: 'findgym/findGym.html'
    .state 'finduser',
      url: '/finduser'
      views:
        'main':
          controller: 'findUserController'
          templateUrl: 'finduser/findUser.html'
    .state 'settings',
      url: '/settings'
      views:
        'main':
          controller: 'settingsController'
          templateUrl: 'settings/settings.html'
    .state 'gyms.zone',
      url: '/:gymId/zone/:zoneId'
      views:
        'content':
          controller: 'zoneController'
          templateUrl: 'zone/zone.html'
    .state 'gyms.zones',
      url: '/:gymId/zones'
      views:
        'content':
          controller: 'zonesController'
          templateUrl: 'zones/zones.html'

  return this
