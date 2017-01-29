$(document).ready(function() {

	var lat = parseFloat($('#picture_location_lat').attr('value'));
	var lng = parseFloat($('#picture_location_lng').attr('value'));
	
  var coordinate = {lat: lat, lng: lng};
	var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 9,
    center: coordinate
  });
	
	var marker = new google.maps.Marker({
    position: coordinate,
    map: map,
		draggable: true,
    animation: google.maps.Animation.DROP
	});
  
	marker.addListener('dragend', markerResetOnMap);
	
	function markerResetOnMap(event) {
		var lat = event.latLng.lat();
		var lng = event.latLng.lng();
		
		$('#picture_location_lng').attr('value', lng);
		$('#picture_location_lat').attr('value', lat);
		
	}	
	
	var input = document.getElementById('searchTextField');
  var autocomplete = new google.maps.places.Autocomplete(input);

	autocomplete.addListener('place_changed', function() {
    var place = autocomplete.getPlace();
		if (!place.geometry) {
      // User entered the name of a Place that was not suggested and
      // pressed the Enter key, or the Place Details request failed.
      window.alert("No details available for input: '" + place.name + "'");
      return;
    }

		if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);  // Why 17? Because it looks good.
    }
		
    marker.setPosition(place.geometry.location);
    marker.setVisible(true);
		
		$('#picture_location_lng').attr('value', place.geometry.location.lng);
		$('#picture_location_lat').attr('value', place.geometry.location.lat);
  });
});


