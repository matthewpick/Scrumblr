var app = angular.module('ScrumblrApp');

app.controller('ProjectsController', function($scope, ProjectsService) {
  $scope.sprintsVisible = false;
  $scope.lastOpened = 0;
  $scope.sprints = [];
  
  this.showSprints = function showSprints(project_id) {  
    if($scope.lastOpened == project_id)
    {
      $scope.sprintsVisible = false;
      $scope.lastOpened = 0;
      $scope.sprints = []
    }
    else
    {
      ProjectsService.getSprints(project_id).then(function(data) {
        $scope.sprints = data;       
      });
      
      $scope.sprintsVisible = true;
      $scope.lastOpened = project_id;
    }       
  };  
});

app.service('ProjectsService', function($http, $q) {
  return({getSprints: getSprints});
  
  function getSprints(project_id) {
    var request = $http({
      method: "get",
      url: "/users/1/projects/" + project_id.toString(),
      timeout: 5000,
      responseType: "json"
    });
    
    return(request.then(handleSuccess, handleError));
    
  }
  
  function handleSuccess(response) {
    return(response.data);
  }
  
  function handleError(response) {
    return($q.reject("An unknown error occurred"));
  }
  
});
