function AutoCompleteMap() {
//	alert("key pre");
  var origin_place_id = null;
  var destination_place_id = null;
  var map = new google.maps.Map({mapTypeControl: false});


  var origin_input = document.getElementById('origin-input');
  var destination_input = document.getElementById('destination-input');



  var origin_autocomplete = new google.maps.places.Autocomplete(origin_input);
  var destination_autocomplete = new google.maps.places.Autocomplete(destination_input);

  

  origin_autocomplete.addListener('place_changed', function() {
    	var place = origin_autocomplete.getPlace();
    	if (!place.geometry) {
      		window.alert("Autocomplete's returned place contains no geometry");
      		return;
  		}
   });

  destination_autocomplete.addListener('place_changed', function() {
  	var place = destination_autocomplete.getPlace();
    if (!place.geometry) {
    	window.alert("Autocomplete's returned place contains no geometry");
    	return;
    }
  });
}
