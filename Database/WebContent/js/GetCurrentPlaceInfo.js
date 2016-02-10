var address='';
jQuery(document).ready(function(){
	jQuery('.wait_time').hide();
jQuery('#get_current').click(function(){
	$("body").css("cursor", "progress");
	jQuery('.wait_time').show();
	
});
});
function geocodeLatLng(geocoder, map,latId,longId,addressss) {
	//alert("1258"+addressss);
	if(addressss!='' && addressss!=null){
		geocoder.geocode( { 'address': addressss}, function(results, status) {
		      if (status == google.maps.GeocoderStatus.OK) {
		        map.setCenter(results[0].geometry.location);
		  //      alert(results[0].geometry.location);
		        jQuery(latId).val(results[0].geometry.location.lat());
		        jQuery(longId).val(results[0].geometry.location.lng());
		        $("body").css("cursor", "default");
		        jQuery('.wait_time').hide();
		        
		       // alert(+"its not ok");
		      } else {
		        alert("Geocode was not successful for the following reason: " + status);
		      }
		    });
	}/*else{
		  var latlng = {lat: parseFloat(latitude), lng: parseFloat(longitude)};
		  geocoder.geocode({'location': latlng}, function(results, status) {
		    if (status === google.maps.GeocoderStatus.OK) {
		      if (results[1]) {
		              
		        result=results[1].formatted_address;
		        //alert(result+"123");
		 //       initContinued(result);
		        jQuery(Id).val(result);
		        $("body").css("cursor", "default");
		        jQuery('.wait_time').hide();
		      } else {
		        window.alert('No results found');
		      }
		    } else {
		      window.alert('Geocoder failed due to: ' + status);
		    }
		  });
	}*/
  //alert(result+"1243");
 // return result;
  
}
