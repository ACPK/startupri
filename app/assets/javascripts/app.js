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
    apiUrl: 'http://callred-dev.com:3000/api/v1'
  });

  $routeProvider.when( '/',      { templateUrl: 'main.html',  controller: 'MainCtrl' } );
  $routeProvider.when( '/about', { templateUrl: 'about.html', controller: 'AboutCtrl' } );
  $routeProvider.when( '/apps', { templateUrl: 'apps.html', controller: 'AppsCtrl' } );
  $routeProvider.when( '/signup', { templateUrl: 'signup.html', controller: 'SignupCtrl' } );
  $routeProvider.when( '/signin', { templateUrl: 'signin.html', controller: 'SigninCtrl' } );
  $routeProvider.when( '/reset-password', { templateUrl: 'passwordreset.html', controller: 'passwordresetCtrl' } );
  $routeProvider.when( '/business', { templateUrl: 'business.html', controller: 'BusinessCtrl' } );
  $routeProvider.when( '/hiring', { templateUrl: 'hiring.html', controller: 'HiringCtrl' } );
  $routeProvider.when( '/partner', { templateUrl: 'partner.html', controller: 'PartnerCtrl' } );
  $routeProvider.when( '/press', { templateUrl: 'press.html', controller: 'PressCtrl' } );
  $routeProvider.when( '/privacy', { templateUrl: 'privacy.html', controller: 'PrivacyCtrl' } );
  $routeProvider.when( '/terms', { templateUrl: 'terms.html', controller: 'TermsCtrl' } );

  $routeProvider.otherwise( { redirectTo: '/' } );

  $locationProvider.html5Mode(true);
} ] );