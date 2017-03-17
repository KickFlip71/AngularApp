angular.module('AngularApp').controller 'PagesCtrl', ($scope, Rails) ->
  $scope.test = Rails.env
