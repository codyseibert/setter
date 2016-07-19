module.exports = [
  '$scope', '$stateParams', '$q', 'GymService', function($scope, $stateParams, $q, GymService) {
    var init_map;
    GymService.get($stateParams.gymId).then(function(gym) {
      $scope.gym = gym;
      return init_map(gym.name, gym.address);
    });
    $scope.save = function() {
      return GymService.update($scope.gym).then(function(gym) {});
    };
    return init_map = function(name, address) {
      return $q(function(resolve, reject) {
        var geocoder;
        geocoder = new google.maps.Geocoder();
        return geocoder.geocode({
          'address': address
        }, function(results, status) {
          if (status === google.maps.GeocoderStatus.OK) {
            return resolve(results[0].geometry.location);
          } else {
            return reject('Geocode was not successful for the following reason: ' + status);
          }
        });
      }).then(function(latLon) {
        var infowindow, map, marker, myOptions;
        myOptions = {
          zoom: 12,
          center: new google.maps.LatLng(latLon.lat(), latLon.lng()),
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);
        marker = new google.maps.Marker({
          map: map,
          position: new google.maps.LatLng(latLon.lat(), latLon.lng())
        });
        infowindow = new google.maps.InfoWindow({
          content: '<strong>' + name + '</strong><br>Address<br>' + address + '<br>'
        });
        google.maps.event.addListener(marker, 'click', function() {
          return infowindow.open(map, marker);
        });
        infowindow.open(map, marker);
        return document.getElementById('gmap_canvas').style.visibility = "inherit";
      });
    };
  }
];
