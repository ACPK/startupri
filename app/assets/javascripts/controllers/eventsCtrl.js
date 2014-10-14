'use strict';

angular.module( 'StartupRI' ).controller( 'EventsCtrl', ['$scope', "$http", function( $scope, $http) {
  $scope.awesomeThings = [
    'HTML5 Boilerplate',
    'AngularJS',
    'Karma'
  ];

  $http.get('/api/v1/events.json').success(function(data) {
    $scope.startups = data;
  });

}]);