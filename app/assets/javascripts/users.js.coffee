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
      console.log ("success_handler --")
      data.map (user_resource) ->
        $scope.users.push user_resource unless $scope.users.indexOf(user_resource) > -1

    User.query({val: $scope.val}, {}, success_handler, error_handler)
    #//entry = Entry.save($scope.newEntry)
    #//$scope.entries.push(entry)
    #//$scope.newEntry = {}

]