'use strict';

angular.module( 'CallRed' ).controller( 'MainCtrl', ['$scope','$http', function( $scope, $http, FileUploader ) {
  $scope.awesomeThings = [
    'HTML5 Boilerplate',
    'AngularJS',
    'Karma'
  ];
  $scope.formData = {
    newTicketMessage: ''
  };

  $scope.uploader = new FileUploader({url: '<your controller path>'});

  $scope.createTicket = function() { 
      if ($scope.formData.newTicketMessage === '') {
        toastr.warning('Please include a message.')
        return false;
      } 
      var data = {
        ticket: {
          message: $scope.formData.newTicketMessage
        }
      };
      $http.post('/api/v1/tickets', data).success(function(data) {
        toastr.clear()
        toastr.success('Message Sent')
      }).error(function() {
        toastr.clear()
        toastr.error('Please try again as there was an error.')
      });
      return true;
  };

}]);