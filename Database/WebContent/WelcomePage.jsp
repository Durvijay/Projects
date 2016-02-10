<!DOCTYPE html>
<html lang="en">
<head>
<title>Creative CSS3 Animation Menus</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="UTF-8" />

<link rel="stylesheet" type="text/css" href="css/style2.css" />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
</head>
<script type="text/javascript">
	
</script>
<body class="banner">

	
		
		

			
	<div class="banner">
		<!-- container -->
		<div class="container">
			<div class="header">
				<div class="logo">
					<a href="#">Truck Rental On The Way</a>
					
						
			</div>
				<div class="clearfix"></div>
			</div>
			<div class="top-nav">
				<span class="menu">MENU</span>
				<ul class="nav1">
						
					</ul>
			</div>
		</div>
		<!-- //container -->
		<div style="margin-top: 2cm;" >
			<input id="origin-input" class="controls" type="text"
				placeholder="Enter an origin location"> <input
				id="destination-input" class="controls" type="text"
				placeholder="Enter a destination location">
			<!-- 		<input type="button" value="Current Location" id="currentLoctionId" onclick="getLocation();" class="controls"> -->



			<div style="padding-right: 1cm;">
				<div id="map" style="width: 1000px; height: 380px; float: right;"></div>

			</div>


			<div>
				<ul class="ca-menu">
					<li><a href="WelcomePage.jsp">
							<div class="ca-content">
								<h2 class="ca-main">Book Truck</h2>
							</div>
					</a></li>
					<li><a href="FareCalculator.html">
							<div class="ca-content">
								<h2 class="ca-main">Fare Calculator</h2>
							</div>
					</a></li>
					<li><a href="signUpVal.action">
							<div class="ca-content">
								<h2 class="ca-main">Personal Information</h2>
							</div>
					</a></li>
					<li>
					<a href="history.action">
							<div class="ca-content">
								<h2 class="ca-main">History</h2>
							</div>
					</a></li>
					<li>
                        <a href="logout1.action">                          
                            <div class="ca-content">
                                <h2 class="ca-main">Logout</h2>                              
                            </div>
                        </a>
                    </li>
				</ul>



			<!-- content -->
		</div>


		<div style="padding-right: 3cm;">
			<br>
			<br>
			<br>
			<br>
			<br>
			<br> <input type="button" name="Proceed" id="proceedID" onclick="redirectToTruckSelection();" value="PROCEED" style="float: right;"> 
				<input type="button" name="RESET"
				value="RESET" onclick="window.location.reload()"
				style="float: right;margin-right: 15px; margin-left: 15px;">
			<p id="demo" style="float: right; padding-right: 5cm;"></p>
		</div>

		<br>
		<br>
		<br>
		<br>
		<br>
	</div>

	<script>

		function redirectToTruckSelection(){
			var origin_input = document.getElementById('origin-input').value;
			var destination_input = document.getElementById('destination-input').value;
			
			window.location.href="TruckSelection.jsp?"+"currentLatitude="+currentLatitude+"&currentLongitude="+currentLongitude+"&PickUpPlace="+origin_input+"&DropUpPlace="+destination_input;
		}
		function expandViewportToFitPlace(map, place) {
			if (place.geometry.viewport) {
				map.fitBounds(place.geometry.viewport);
			} else {
				map.setCenter(place.geometry.location);
			//	alert(place.geometry.location+"place.geometry.location");
				map.setZoom(17);
			}
		}
		function route(origin_place_id, destination_place_id,
				directionsService, directionsDisplay) {
			if (!origin_place_id || !destination_place_id) {
				return;
			}

			//  alert(origin_place_id+" "+destination_place_id);
			directionsService.route({
				origin : {
					'placeId' : origin_place_id
				},
				destination : {
					'placeId' : destination_place_id
				},
				travelMode : google.maps.TravelMode.DRIVING
			}, function(response, status) {

				if (status === google.maps.DirectionsStatus.OK) {
				//	alert("button1"+document.getElementById("proceedID").disabled);
					document.getElementById("proceedID").disabled = false;
				//	alert("button"+document.getElementById("proceedID").disabled);
					directionsDisplay.setDirections(response);
					
				} else {
					document.getElementById("proceedID").disabled = true;
					window.alert('Directions request failed due to ' + status);
				}
			});
		}

		var x = document.getElementById("demo");
		var map = null;
		function getLocation() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(initMap);
			} else {
				x.innerHTML = "Geolocation is not supported by this browser.";
			}
		}

		

		function clear() {
			document.getElementById('origin-input').value = null;
			document.getElementById('destination-input').value = null;
			document.getElementById("proceedID").disabled = true;
		}

		var currentLatitude='';
		var currentLongitude='';

		function initMap(position) {
			clear();
			document.getElementById('map').value = null;
			var origin_place_id = null;
			var destination_place_id = null;
			currentLatitude=position.coords.latitude;
			currentLongitude=position.coords.longitude;
			var map = new google.maps.Map(document.getElementById('map'), {
				mapTypeControl : false,
				center : {
					lat : position.coords.latitude,
					lng : position.coords.longitude
				},
				zoom : 13
			});

			var marker = new google.maps.Marker({
				position : new google.maps.LatLng(position.coords.latitude,
						position.coords.longitude)

			});
			marker.setMap(map);
			x.innerHTML = "Latitude: " + position.coords.latitude
					+ "<br>Longitude: " + position.coords.longitude;

			//  alert("message9");
			var origin_input = document.getElementById('origin-input');
			var destination_input = document
					.getElementById('destination-input');
			//  var current_location = document.getElementById('currentLoctionId');

			//origin_input.value='';
			//destination_input.value='';
			map.controls[google.maps.ControlPosition.TOP_LEFT]
					.push(origin_input);
			map.controls[google.maps.ControlPosition.TOP_LEFT]
					.push(destination_input);
			//  map.controls[google.maps.ControlPosition.TOP_RIGHT].push(current_location);
			// alert("message19");

			var directionsService = new google.maps.DirectionsService;
			var directionsDisplay = new google.maps.DirectionsRenderer;
			directionsDisplay.setMap(map);
			var origin_autocomplete = new google.maps.places.Autocomplete(
					origin_input);
			origin_autocomplete.bindTo('bounds', map);
			var destination_autocomplete = new google.maps.places.Autocomplete(
					destination_input);
			destination_autocomplete.bindTo('bounds', map);

			origin_autocomplete
					.addListener(
							'place_changed',
							function() {
								var place = origin_autocomplete.getPlace();
								marker.setMap(null);
								if (!place.geometry) {
									window
											.alert("Autocomplete's returned place contains no geometry");
									return;
								}
								expandViewportToFitPlace(map, place);

								// If the place has a geometry, store its place ID and route if we have
								// the other place ID
								origin_place_id = place.place_id;
								route(origin_place_id, destination_place_id,
										directionsService, directionsDisplay);
							});

			destination_autocomplete
					.addListener(
							'place_changed',
							function() {
								var place = destination_autocomplete.getPlace();
								marker.setMap(null);
								if (!place.geometry) {
									window
											.alert("Autocomplete's returned place contains no geometry");
									return;
								}
								expandViewportToFitPlace(map, place);

								// If the place has a geometry, store its place ID and route if we have
								// the other place ID
								destination_place_id = place.place_id;

								route(origin_place_id, destination_place_id,
										directionsService, directionsDisplay);
							});

		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKzK3QizTYZt6WzCHFGHM37mRqFiaZdU0&signed_in=true&libraries=places&callback=getLocation"></script>

</body>
</html>