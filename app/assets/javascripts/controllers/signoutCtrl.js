'use strict';

angular.module( 'CallRed' ).controller( 'SignoutCtrl', ['$scope', function( $scope, $auth) {
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

    // // Need to get this to work with all pages as it's in the side bar....
    // %button.btn.btn-primary.btn-lg{"ng-click" => "signOut()"} Sign out

}]);