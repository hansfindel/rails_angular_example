#/*
#function UserCtrl($scope, Users) {
#  //$scope.users = [{name:'learn angular'},{name:'build an angular app'} ];
#  $scope.users = Users
#  $scope.count = function() {
#    return $scope.users.length;
#  };
#}
#*/

app = angular.module("Contacts", ["ngResource"])

app.factory "User", ["$resource", ($resource) ->
  $resource("/users/:id", {id: "@id"}, {update: {method: "PUT"}})
]

@UserCtrl = ["$scope", "User", ($scope, User) ->
  $scope.users = [] #//User.query()

  $scope.count = ->
    return @scope.users.length

  $scope.search = ->

    error_handler = (e) ->
      console.log e
      return []

    success_handler = (data) ->
      #// console.log data 
      #// urls are unique for resources
      #// console.log ("success_handler --")
      #// console.log $scope.users
      data.map (user_resource) ->
        #// console.log user_resource
        exists = false
        $scope.users.map (user_registry) ->
          exists = exists || (user_registry.url == user_resource.url)
        $scope.users.push user_resource unless exists

    User.query({val: $scope.val}, {}, success_handler, error_handler)
    #//entry = Entry.save($scope.newEntry)
    #//$scope.entries.push(entry)
    #//$scope.newEntry = {}

]