'use strict';

angular.module('myApp.services', ['ngResource'])
  	.value('version', '2')
    .factory('Items', function($resource){
        return $resource('/angu/:_id', {Id: "@Id"}, {
	        createData: {method:'POST'},
	        toggle: {method:'GET', params:{_id:'id'}},
        });

    })

   