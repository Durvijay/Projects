

function initMaps(origin1,destinationA,id1,id2) {
//	alert(id1+"fsdf"+id2);
	//alert(destinationA+"its coming"+origin1);
	var service = new google.maps.DistanceMatrixService;
	//alert(service);
	service.getDistanceMatrix({
		origins : [origin1],
		destinations : [destinationA],
		travelMode : google.maps.TravelMode.DRIVING,
		unitSystem : google.maps.UnitSystem.IMPERIAL,
		avoidHighways : false,
		avoidTolls : false
	}, function(response, status) {
		if (status != google.maps.DistanceMatrixStatus.OK) {
			alert('Error was: ' + status);
		} else {
		//	alert("status"+status);
			var originList = response.originAddresses;

			for (var i = 0; i < originList.length; i++) {
				var results = response.rows[i].elements;

				for (var j = 0; j < results.length; j++) {
				//	alert(results[j].distance.text+"sfs"+results[j].duration.text);
						document.getElementById(id1).value = results[j].distance.text;
						document.getElementById(id2).value	= results[j].duration.text;
					
				}
			}
		}
	//	alert("aD");
	});
}
