app = angular.module("Contacts", ["ngResource"])

app.factory "User", ["$resource", ($resource) ->
  $resource("/users/:id", {id: "@id"}, {update: {method: "PUT", url: "@url"}} )
]
app.factory "Email", ["$resource", ($resource) ->
  $resource("/mails" )
]

@UserCtrl = ["$scope", "User", "Email", ($scope, User, Email) ->
  $scope.add_user = (user_resource) -> 
    exists = false
    $scope.users.map (user_registry) ->
      exists = exists || (user_registry.url == user_resource.url)
    $scope.users.push user_resource unless exists

  $scope.users = [] #//User.query()

  $scope.count = ->
    return @scope.users.length

  $scope.search_placeholder = ->
    placeholder = []
    $scope.users.map (u) ->
      if !!u.marked
        placeholder.push u.fullname
    if placeholder.length == 0
      return "Search friends..."
    else
      return placeholder.join(", ")

  $scope.clean_search = ->
    $scope.val = ""
    $scope.search()

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
        $scope.add_user(user_resource)

    User.query({val: $scope.val}, {}, success_handler, error_handler)
    return true
    #//entry = Entry.save($scope.newEntry)
    #//$scope.entries.push(entry)
    #//$scope.newEntry = {}

  $scope.contact_click = () ->
    user = this.user 
    user.marked = !(user.marked)
    if user.marked 
      user.points++
    else
      user.points--
    #//console.log user 
    user.$update()

  $scope.class_name = (user) -> 
    if user.marked 
      return "marked"
    return ""

  $scope.toggleHideClass = ->
    if $scope.hide == "hidden"
      $scope.hide = ""
    else
      $scope.hide = "hidden"

  #$scope.selected = (user) ->
  #  return !!user.marked

  $scope.send_message = ->
    text = $scope.message
    user_ids = []
    $scope.users.map (u) ->
      if !!u.marked
        user_ids.push u.id 
    #console.log Email.save
    if user_ids.length > 0 and text.length > 0
      success_handler = (data) -> 
        console.log "success_handler"
        console.log data
        $scope.users.map (u) ->
          if !!u.marked
            u.marked = false 
        $scope.message = ""

      error_handler = (error) ->
        console.log "error_handler"
        console.log error
        $scope.message = "ERROR: " + error 

      data = {text: text, ids: user_ids}
      x = Email.save(data, data, success_handler, error_handler)


  $scope.add_new_contact = () ->
    info = 
      name: $scope.newuser.name, 
      last_name: $scope.newuser.last_name
    
    success_handler = (data) -> 
      $scope.newuser.name = ""
      $scope.newuser.last_name = ""
      $scope.add_user(data)
      console.log data

    error_handler = (error) ->
      $scope.newuser.name = "error: " 
      $scope.newuser.last_name = error 
      console.log "error_handler"
    
    User.save(info, info, success_handler, error_handler)

  $scope.maildisabled = () ->
    val = $scope.message
    if val and val != "" 
      return "available"
    "disabled"
]

