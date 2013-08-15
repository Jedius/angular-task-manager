'use strict';

var apps = angular.module('myApp.directives', [])
	
apps.directive('appVersion', ['version', function(version) {
    return function(scope, elm, attrs) {
     	elm.text(version);
    };
}]);

apps.directive('Tasks', function() {
 	return {
    	link:function($scope, element, attrs) {
    	    $scope.$watch(attrs.Tasks,function(value){ });
  	  	}
    }
});



