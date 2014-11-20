var app = angular.module('ScrumblrApp');

app.controller('ProjectsController', function($scope, $window, ProjectsService) {
  $scope.sprintsVisible = false;
  $scope.lastOpened = 0;
  $scope.sprints = [];
  
  this.hideAll = function hideAll() {
    $scope.sprintsVisible = false;
    $scope.lastOpened = 0;
    $scope.sprints = [];
  };
  
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
  
  this.validate = function validate() {
    if($scope.start_date >= $scope.end_date)
    {
      $window.alert("Start date must be before end date");
    }
    else
    {
      var data = {sprint_info: {sprint_start_date: $scope.start_date,
                                sprint_end_date: $scope.end_date},
                  project_id: $scope.lastOpened};
      
      ProjectsService.createSprint($scope.lastOpened, data).then(function(data) {
        $scope.sprints = data;
      });  
    };
  };
});

app.service('ProjectsService', function($http, $q) {
  return({getSprints: getSprints, 
          createSprint: createSprint});
  
  function getSprints(project_id) {
    var request = $http({
      method: "get",
      url: "/projects/" + project_id.toString(),
      timeout: 5000,
      responseType: "json"
    });
    
    return(request.then(handleSuccess, handleError));
    
  }
  
  function createSprint(project_id, data) {
    var request = $http({
      method: "post",
      url: "/sprints", 
      data: data,
      timeout: 5000
    });
    
    return(request.then(handleCreateSuccess, handleCreateError));
  }
  
  function handleSuccess(response) {
    return(response.data);
  }
  
  function handleError(response) {
    return($q.reject("An unknown error occurred"));
  }
  
  function handleCreateSuccess(response) {
    return(response.data);
  }
  
  function handleCreateError(response) {
  
  }
  
});
