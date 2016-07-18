module.exports = [
  '$scope'
  '$q'
  'GymService'
  (
    $scope
    $q
    GymService
  ) ->

    init_map = ->
      $q (resolve, reject) ->
        geocoder = new google.maps.Geocoder()
        address = "999 Charles St, Longwood, FL 32750"
        geocoder.geocode { 'address': address }, (results, status) ->
          if status == google.maps.GeocoderStatus.OK
            resolve results[0].geometry.location
          else
            reject 'Geocode was not successful for the following reason: ' + status
      .then (latLon) ->
        myOptions =
          zoom: 12
          center: new (google.maps.LatLng)(latLon.lat(), latLon.lng())
          mapTypeId: google.maps.MapTypeId.ROADMAP
        map = new (google.maps.Map)(document.getElementById('gmap_canvas'), myOptions)
        marker = new (google.maps.Marker)(
          map: map
          position: new (google.maps.LatLng)(latLon.lat(), latLon.lng()))
        infowindow = new (google.maps.InfoWindow)(content: '<strong>Aiguille Rock Climbing Center</strong><br>Address<br>999 Charles St, Longwood, FL 32750<br>')
        google.maps.event.addListener marker, 'click', ->
          infowindow.open map, marker
        infowindow.open map, marker
        document.getElementById('gmap_canvas').style.visibility = "inherit"

    init_map()

]
