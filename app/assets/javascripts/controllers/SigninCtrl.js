'use strict';

angular.module( 'CallRed' ).controller( 'SigninCtrl', ['$scope', function( $scope, $auth ) {
	$scope.awesomeThings = [
		'HTML5 Boilerplate',
		'AngularJS',
		'Karma',
	];

	$scope.handleLoginBtnClick = function() {
      $auth.submitLogin($scope.loginForm)
        .then(function(resp) { 
          // handle success response
        })
        .catch(function(resp) { 
          // handle error response
        });
    };

  $scope.$on('auth:login-success', function(ev, user) {
    toastr.clear()
    toastr.success('Welcome ', user.email);
  });

  $scope.$on('auth:login-error', function(ev, reason) {
    toastr.clear()
    toastr.error(reason.errors[0]);
  });
	
}]);