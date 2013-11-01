#app = angular.module("Contacts", ["ngResource"])

@NavCtrl = ["$scope", ($scope) ->
  $scope.send_email = "hidden_container"
  $scope.add_contact = ""
  $scope.user_ctrl = "show"
  $scope.newuser_ctrl = "hidden"

  $scope.select_email = ->
    $scope.send_email = "hidden_container"
    $scope.add_contact = ""
    $scope.user_ctrl = "show"
    $scope.newuser_ctrl = "hidden"
    true

  $scope.add_contact = ->
    console.log "asdfa"
    $scope.send_email = ""
    $scope.add_contact = "hidden_container"
    $scope.user_ctrl = "hidden"
    $scope.newuser_ctrl = "show"
    true
]