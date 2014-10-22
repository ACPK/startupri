'use strict';

angular.module( 'StartupRI' ).controller( 'ResourcesCtrl', ['$scope', "$http", function( $scope, $http, $auth) {
  $scope.awesomeThings = [
    'HTML5 Boilerplate',
    'AngularJS',
    'Karma'
  ];

  $http.get('/api/v1/resources.json').success(function(data) {
    $scope.resources = data;
  });

  $scope.handleRegBtnClick = function() {
      $auth.submitRegistration($scope.registrationForm)
        .then(function(resp) { 
          // handle success response
        })
        .catch(function(resp) { 
          // handle error response
        });
    };

  $scope.$on('auth:registration-email-success', function(ev, message) {
    toastr.clear()
    toastr.success("You're now a StartupRI VIP!");
  });

  $scope.$on('auth:registration-email-error', function(ev, reason) {
    toastr.clear()
    toastr.error("Registration Failed");
  });

}]);