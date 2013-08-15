'use strict';
angular.module('myApp', ['myApp.filters', 'myApp.services', 'myApp.directives']).
  config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/view', {templateUrl: 'partials/partial1.html', controller: TestCtrl });
    $routeProvider.when('/view/create', {templateUrl: 'partials/partial1.html', controller: TestCtrl });
    $routeProvider.when('/view/:_id', {templateUrl: 'partials/partial1.html', controller: TestCtrl });
    $routeProvider.when('/view/:_id', {templateUrl: 'partials/partial2.html', controller:Test1Ctrl });
    $routeProvider.otherwise({redirectTo: '/view'});
  }]);
