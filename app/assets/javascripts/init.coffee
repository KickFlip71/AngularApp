# app/assets/javascripts/init.coffee
@app_module = angular.module('AngularApp', [
  'ui.router',
  'jmdobry.angular-cache',
  'templates'
])
app_module.config ($provide, Rails) ->
  # Template cache
  if Rails.env != 'development'
    $provide.service '$templateCache', ['$angularCacheFactory', ($angularCacheFactory) ->
      $angularCacheFactory('templateCache', {
        maxAge: 3600000 * 24 * 7,
        storageMode: 'localStorage',
        recycleFreq: 60000
      })
    ]

app_module.config ($provide, $httpProvider, $locationProvider, Rails) ->
  $provide.factory 'railsAssetsInterceptor', ($angularCacheFactory) ->
    request: (config) ->
      if assetUrl = Rails.templates[config.url]
        config.url = assetUrl
      config

  $httpProvider.interceptors.push('railsAssetsInterceptor')

  $locationProvider.html5Mode true
