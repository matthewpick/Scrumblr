var app = angular.module('ScrumblrApp');

app.controller('ProjectsController', [function() {
  this.sprintsVisible = false;
  
  this.showSprints = function showSprints() {
    return this.sprintsVisible = true;
    
  };
}]);

app.service('ProjectsService', function($http, $q) {
 
  
});
