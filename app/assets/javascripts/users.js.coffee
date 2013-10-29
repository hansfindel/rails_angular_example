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
  $scope.users = User.query()

  $scope.count = ->
    return @scope.users.length

  $scope.search = ->
    results = User.query({val: $scope.val})
    console.log results
    #//entry = Entry.save($scope.newEntry)
    #//$scope.entries.push(entry)
    #//$scope.newEntry = {}

]