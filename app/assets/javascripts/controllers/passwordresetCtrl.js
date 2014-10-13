'use strict';

angular.module( 'CallRed' ).controller( 'passwordresetCtrl', ['$scope', function( $scope, $auth) {
  $scope.awesomeThings = [
    'HTML5 Boilerplate',
    'AngularJS',
    'Karma'
  ];

  $scope.handlePwdResetBtnClick = function() {
    $auth.resetPasswordReset($scope.pwdResetForm)
      .then(function(resp) { 
        // handle success response
      })
      .catch(function(resp) { 
        // handle error response
      });
  };

}]);