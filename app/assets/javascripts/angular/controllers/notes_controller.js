notekatApp.controller('NotesCtrl', function ($scope, $http) {
  $http.get('phones/phones.json').success(function(data) {
    $scope.notes = data;
  });
});