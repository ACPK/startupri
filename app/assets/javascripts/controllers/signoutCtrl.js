'use strict';

angular.module( 'StartupRI' ).controller( 'SignoutCtrl', ['$scope', function( $scope, $auth) {
  $scope.awesomeThings = [
    'HTML5 Boilerplate',
    'AngularJS',
    'Karma'
  ];

  $scope.handleSignOutBtnClick = function() {
      $auth.signOut()
        .then(function(resp) { 
          // handle success response
        })
        .catch(function(resp) { 
          // handle error response
        });
    };
    
    // %button.btn.btn-primary.btn-lg{"ng-click" => "signOut()"} Sign out

}]);