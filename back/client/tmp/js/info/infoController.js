module.exports = [
  '$scope', '$q', 'GymService', function($scope, $q, GymService) {
    var init_map;
    init_map = function() {
      return $q(function(resolve, reject) {
        var address, geocoder;
        geocoder = new google.maps.Geocoder();
        address = "999 Charles St, Longwood, FL 32750";
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
          content: '<strong>Aiguille Rock Climbing Center</strong><br>Address<br>999 Charles St, Longwood, FL 32750<br>'
        });
        google.maps.event.addListener(marker, 'click', function() {
          return infowindow.open(map, marker);
        });
        infowindow.open(map, marker);
        return document.getElementById('gmap_canvas').style.visibility = "inherit";
      });
    };
    return init_map();
  }
];
