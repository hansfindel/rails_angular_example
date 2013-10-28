function UserCtrl($scope) {
  $scope.users = [
    {name:'learn angular'},
    {name:'build an angular app'} 
  ];
 
  $scope.count = function() {
    return $scope.users.length;
  };
 
}