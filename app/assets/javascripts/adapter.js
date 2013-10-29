var adapter = angular.module('adapter', []);
adapter.rootURL = "http://localhost:3000/"
adapter.fetch = function(model, query){
  if(query == undefined){
      q = {}
  }
  return $.ajax({
      url: this.rootURL + model + "s", 
      params: q, 
      method: "get"
  }).done( function(results){
    //console.log(results)
    return results;
  })
}
