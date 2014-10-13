'use strict';

angular.module( 'CallRed' ).controller( 'SignupCtrl', ['$scope', function( $scope, $auth) {
  $scope.awesomeThings = [
    'HTML5 Boilerplate',
    'AngularJS',
    'Karma'
  ];

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
    toastr.success("A registration email was sent to " + message.email);
  });

  $scope.$on('auth:registration-email-error', function(ev, reason) {
    toastr.clear()
    toastr.error("Registration failed: " + reason.errors[0]);
  });

}]);