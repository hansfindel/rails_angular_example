app = angular.module("Contacts", ["ngResource"])

app.factory "User", ["$resource", ($resource) ->
  $resource("/users/:id", {id: "@id"}, {update: {method: "PUT"}} )
]

@UserCtrl = ["$scope", "User", ($scope, User) ->
  $scope.users = [] #//User.query()

  $scope.count = ->
    return @scope.users.length

  $scope.search = ->
    if $scope.val.length < 1
      $scope.own_val = "#impossible+mail-combination"
      return true
    else
      $scope.own_val = $scope.val 

    error_handler = (e) ->
      console.log e
      return []

    success_handler = (data) ->
      data.map (user_resource) ->
        exists = false
        $scope.users.map (user_registry) ->
          exists = exists || (user_registry.url == user_resource.url)
        $scope.users.push user_resource unless exists
    User.query({val: $scope.val}, {}, success_handler, error_handler)
    return true
    #//entry = Entry.save($scope.newEntry)
    #//$scope.entries.push(entry)
    #//$scope.newEntry = {}

  $scope.contact_click = () ->
    user = this.user 
    console.log user
    user.marked = !(user.marked)

  $scope.class_name = (user) -> 
    if user.marked 
      return "marked"
    return ""
]

