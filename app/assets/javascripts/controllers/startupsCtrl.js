'use strict';

angular.module( 'StartupRI' ).controller( 'StartupsCtrl', ['$scope', "$http", function( $scope, $http) {
  $scope.awesomeThings = [
    'HTML5 Boilerplate',
    'AngularJS',
    'Karma'
  ];

  $http.get('/api/v1/startups.json').success(function(data) {
    $scope.startups = data;
  });

}]);