'use strict';
function TestCtrl($scope, Items,$route,$http) {
    $scope.rel = function (){
        $scope.Tasks =  Items.query()
    }()
      
    $scope.create = function() {
        $scope.item = {"path":''+$scope.newURL+'' , "name":$scope.NewName , "info":$scope.Infor};
        Items.createData($scope.item,function (data){
            $scope.Tasks.push(data) 
        }); 
    }

    $scope.delets = function (id){
        $http.delete('/angu/'+id)
        $http.get('/angu').success(function(data) {
            $scope.Tasks=data
        });
    }
}

function Test1Ctrl($scope, $routeParams , Items,$http,$route) {
    $scope.Tasks= Items.toggle($routeParams, function(data){
        $scope.NewUrl=data.path
        $scope.Newname = data.name
        $scope.Newop=data.info
    });

    $scope.edits=function(){
        if ($('.edit').hasClass('hidden')){
            $('.edit').attr('class','edit pull-right')
        }else{
            $('.edit').attr('class','hidden edit pull-right')
        }
    }
            
    $scope.edit = function (){
        $scope.item = {"path":''+$scope.NewUrl+'' , "name":$scope.Newname , "info":$scope.Newop};
        $http.put('/angu/'+$routeParams._id,  $scope.item)
        $route.reload();
    }
  
    $scope.imgOpen = function(){
        $('#imgmodal').modal('show')
    };
}
/*End Open elements*/
