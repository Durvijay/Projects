<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.TruckRental.classes.ScheduleInformation"%>
<html lang="en">
    <head>
        <title>Location Update</title>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="UTF-8" />

        <link rel="stylesheet" type="text/css" href="css/style2.css" />
        <link rel="stylesheet" type="text/css" href="css/TableCSSCode.css">
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
		<script src="js/GetCurrentPlaceInfo.js"></script>
    </head>
    <script type="text/javascript">

        
        function getLocation() {
    	    if (navigator.geolocation) {
    	        navigator.geolocation.getCurrentPosition(showPosition);
    	    } else { 
    	        alert("Geolocation is not supported by this browser.");
    	    }
    	}
        function showPosition(position) {
    		
    		var addresss=document.getElementById("placeId").value;
    		//alert("---"+addressssss+"-----");
    		if(addresss.length>0){
    			var map = new google.maps.Map(document.getElementById('map'));
        		var geocoder = new google.maps.Geocoder;
    			geocodeLatLng(geocoder, map,'#latitudeId','#longitudeId',addresss);
    		}else{
    			alert("Enter the Address you want to search");
    		}
    		
    		//alert(address);
    		//document.getElementById("placeId").value=address;
    	}
  </script>
     <body >
    <div class="banner">
    <!-- container -->
		<div class="container">
			<div class="header">
				<div class="logo">
					<a href="#">Truck Rental On The Way</a>
					
				</div>
				
				<div class="clearfix"> </div>
			</div>
			<div class="top-nav">
					<span class="menu">MENU</span>
					
			</div>
		</div>
		<!-- //container -->
		<div style="margin-top: 2cm;" >
		
   
        <input style="border:1px solid #d9d9d9" type="hidden" id="map" >
   
		<div style="padding-right: 19cm;">
		<div style="float: right;">
		<form action="driverLocationUpdate.action">
           <p>
                    <label>Latitude *
                    </label>&nbsp;&nbsp;&nbsp;
                    <input style="border:1px solid #d9d9d9" type="text" name="pickup_latitude" class="long" id="latitudeId" required />
<!--                     <input style="border:1px solid #d9d9d9"  id="get_current" type="button" style="cursor: pointer;" value="Get Current Location" onclick="getLocation();"><p class="wait_time">maa chudao</p> -->
                </p>
                <p>
                    <label>Longitude *
                    </label>
                    <input style="border:1px solid #d9d9d9" type="text" name="pickup_longitude" maxlength="10" class="long"  required id="longitudeId" />
                </p>
                <p  class="place">
                    <label>Place *
                    </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input style="border:1px solid #d9d9d9" type="text" name="pickUpPlace" maxlength="100" class="long" required  id="placeId"/>
                    <input style="border:1px solid #d9d9d9"  id="get_latlng" type="button" style="cursor: wait;" value="Search Place" onclick="getLocation();"><p class="wait_time">Working On it!</p>
                    <input style="border:1px solid #d9d9d9"   type="submit" style="cursor: progress;" value="Submit" >
               		
                </p>
           </form>
                </div>
        </div>
       
            <div>
            	<ul class="ca-menu">
                    <li>
                        <a href="DriverWelcomePage.jsp">                           
                            <div class="ca-content">
                                <h2 class="ca-main">Customers</h2>                               
                            </div>
                        </a>
                    </li>
                    
                    <li>
                        <a href="signUpVal.action">                            
                            <div class="ca-content">
                                <h2 class="ca-main">Personal Information</h2>                              
                            </div>
                        </a>
                    </li>
                   
                    <li>
                        <a href="#">                          
                            <div class="ca-content">
                                <h2 class="ca-main">Location Update</h2>                              
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="logout1.action">                          
                            <div class="ca-content">
                                <h2 class="ca-main">Logout</h2>                              
                            </div>
                        </a>
                    </li>
                </ul>
            	
            	
                                
 				         
            </div>
            
            
            <!-- content -->
        </div>
        
    
         
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
  
    </body>
     <script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKzK3QizTYZt6WzCHFGHM37mRqFiaZdU0&signed_in=true&libraries=places"></script>
    
</html>