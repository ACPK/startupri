'use strict';

// Main module of the application.

angular.module( 'StartupRI',
  [
    'ng-rails-csrf',
    'ng-token-auth',
    'templates',
    'mobile-angular-ui',
    'ngResource',
    'ngRoute',
  ]
)
  
.config( ['$routeProvider', '$locationProvider', '$authProvider', function($routeProvider, $locationProvider, $authProvider) {
  // Specifying the route provider as a string above ensures that the correct angular provider
  // is passed to the function. Rails will shorten variable names as a part of minification
  // in the production build, but not strings

  $authProvider.configure({
    apiUrl: '/api'
  });

  $routeProvider.when( '/events', { templateUrl: 'events.html', controller: 'EventsCtrl' } );
  $routeProvider.when( '/startups', { templateUrl: 'startups.html', controller: 'StartupsCtrl' } );
  $routeProvider.when( '/resources', { templateUrl: 'resources.html', controller: 'ResourcesCtrl' } );

  // $routeProvider.when( '/reset-password', { templateUrl: 'passwordreset.html', controller: 'passwordresetCtrl' } );
  // $routeProvider.when( '/signin', { templateUrl: 'signin.html', controller: 'SigninCtrl' } );
  // $routeProvider.when( '/signup', { templateUrl: 'signup.html', controller: 'SignupCtrl' } );
  
  $routeProvider.otherwise( { redirectTo: '/events' } );

  $locationProvider.html5Mode(true);
} ] );