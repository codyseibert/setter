module.exports = [
  '$scope'
  '$stateParams'
  '$q'
  'GymService'
  (
    $scope
    $stateParams
    $q
    GymService
  ) ->

    GymService.get $stateParams.gymId
      .then (gym) ->
        $scope.gym = gym
        init_map gym.name, gym.address

    $scope.save = ->
      GymService.update $scope.gym
        .then (gym) ->

    init_map = (name, address) ->
      $q (resolve, reject) ->
        geocoder = new google.maps.Geocoder()
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
        infowindow = new (google.maps.InfoWindow)(content: '<strong>' + name + '</strong><br>Address<br>' + address + '<br>')
        google.maps.event.addListener marker, 'click', ->
          infowindow.open map, marker
        infowindow.open map, marker
        document.getElementById('gmap_canvas').style.visibility = "inherit"

]
