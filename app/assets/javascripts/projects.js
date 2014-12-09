var app = angular.module('ScrumblrApp');

app.controller('ProjectsController', ["$scope","$window", "ProjectsService", function($scope, $window, ProjectsService) {
  $scope.sprintsVisible = false;
  $scope.inviteVisible = false;
  $scope.lastOpened = 0;
  $scope.project_n = "";
  $scope.sprints = [];
  $scope.velocity = 0;
  
  this.hideAll = function hideAll() {
    $scope.sprintsVisible = false;
    $scope.lastOpened = 0;
    $scope.sprints = [];
  };
  
  this.showInviteForm = function showInviteForm() {
    $scope.inviteVisible = true;
  };
  
  this.hideInviteForm = function hideInviteForm() {
    $scope.inviteVisible = false;
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
        $scope.sprints = data.sprint_info;
        $scope.velocity = data.average_velocity;       
      });
      
      $scope.sprintsVisible = true;
      $scope.lastOpened = project_id;
    }  
    
    $scope.inviteVisible = false;     
  }; 
  
  this.createSprint = function createSprint() {
    if($scope.start_date >= $scope.end_date)
    {
      $window.alert("Start date must be before end date");
    }
    else if(!this.validateSprint())
    {
      $window.alert("Can't create overlapping sprints");
    }
    else
    {
      var data = {sprint_info: {sprint_start_date: $scope.start_date,
                                sprint_end_date: $scope.end_date},
                  project_id: $scope.lastOpened};
      
      ProjectsService.createSprint($scope.lastOpened, data).then(function(data) {
        $scope.sprints = data.sprint_info;
        $scope.velocity = data.average_velocity;
      });  
    };
  };
  
  this.validateSprint = function validateSprint() {
    for(i=0;i<$scope.sprints.length;i++)
    {
      var sprint_start_date = new Date($scope.sprints[i].sprint_start_date);
      var sprint_end_date = new Date($scope.sprints[i].sprint_end_date);
      /*if(($scope.start_date >= $scope.sprints[i].sprint_start_date && $scope.start_date <= $scope.sprints[i].sprint_end_date) ||
         ($scope.end_date <= $scope.sprints[i].sprint_end_date && $scope.end_date >= $scope.sprints[i].sprint_start_date) ||
         ($scope.start_date <= $scope.sprints[i].sprint_start_date && $scope.end_date >= $scope.sprints[i].sprint_end_date))
      {
        return false;  
      }*/
      
      if(($scope.start_date >= sprint_start_date && $scope.start_date <= sprint_end_date) ||
         ($scope.end_date <= sprint_end_date && $scope.end_date >= sprint_start_date) ||
         ($scope.start_date <= sprint_start_date && $scope.end_date >= sprint_end_date))
      {
        return false;
      }
    }
    
    return true;
  };
  
  this.validateProject = function validateProject() {
    if($scope.project_n == "")
    {
      $window.alert("Must specify project name");
      return false;
    } 
    
    return true;
  };
  
  this.viewScrumboard = function viewScrumboard(project_id, sprint_id) {
     //ProjectsService.getScrumboard(project_id, sprint_id);
     $window.location.href = "/projects/" + project_id.toString() + "/sprints/" + sprint_id.toString() + "/scrumboard"
  };
  
  this.dateOpen = function($event, button) {
    $event.preventDefault();
    $event.stopPropagation();
    
    if(button == 1)
    {
      $scope.opened1 = true;
    }
    if(button == 2)
    {
      $scope.opened2 = true;
    }
    
  };
  
}]);

app.service('ProjectsService', ["$http", "$q", function($http, $q) {
  return({getSprints: getSprints, 
          createSprint: createSprint,
          getScrumboard: getScrumboard});
  
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
  
  function getScrumboard(project_id, sprint_id) {
    var request = $http({
      method: "get",
      url: "/projects/" + project_id.toString() + "/sprints/" + sprint_id.toString() + "/scrumboard",
      timeout: 5000
    });
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
  
}]);
