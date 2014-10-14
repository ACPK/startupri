'use strict';

angular.module( 'StartupRI' ).controller( 'ResourcesCtrl', ['$scope', "$http", function( $scope, $http) {
  $scope.awesomeThings = [
    'HTML5 Boilerplate',
    'AngularJS',
    'Karma'
  ];

  $http.get('/api/v1/resources.json').success(function(data) {
    $scope.startups = data;
  });

}]);