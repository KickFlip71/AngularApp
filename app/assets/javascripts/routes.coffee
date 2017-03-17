app_module.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
  $urlRouterProvider.otherwise('/');

  $stateProvider.state("home", {
    url: '/home',
    controller: 'PagesCtrl',
    templateUrl: 'home/index.html'
  })
