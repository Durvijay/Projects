<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.TruckRental.classes.ScheduleInformation"%>
<html lang="en">
    <head>
        <title>Creative CSS3 Animation Menus</title>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="UTF-8" />

        <link rel="stylesheet" type="text/css" href="css/style2.css" />
        <link rel="stylesheet" type="text/css" href="css/TableCSSCode.css">
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    </head>
    <script type="text/javascript">
  <%
  String PickUpPlace = (String)request.getParameter("PickUpPlace"); 
  String DropUpPlace = (String)request.getParameter("DropUpPlace"); 
 //System.out.println("session_val"+PickUpPlace);
  %>
 
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
					<ul class="nav1">
					
					</ul>
			</div>
		</div>
		<!-- //container -->
		<div style="margin-top: 2cm;">
		
   

   
		<div style="padding-right: 1cm;">
          <div  id="map" style="width:1000px;height:380px;float:right;">
          
          </div> 
          
          <div id="error" style="float:right;"></div>
          <div style="padding-right: 1cm;">
          
          </div > 
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
                        <a href="LocationUpdate.jsp">                          
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
       
    
           <br><br><br><br><br><br><br><br><br>
		
		</div>
    <script>
    
   function initMap() {
	 //  var session_obj= 
	//   alert("message"+session_obj);
	   var map = new google.maps.Map(document.getElementById('map'), {
		    center: {lat: 33.783823, lng: -118.114090},
		    zoom: 13
		  });
	  var from='<%=PickUpPlace%>';
	  var to='<%=DropUpPlace%>';
//	 alert(from +"  " +to);
	  
	 calculateRoute(from,to);
	  }
	
	function calculateRoute(start, end) {
    
    var myOptions = {
      zoom: 10,
      center: {lat: 33.783823, lng: -118.114090},
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      position: google.maps.ControlPosition.LEFT_TOP
    };
    // Draw the map
    var mapObject = new google.maps.Map(document.getElementById("map"), myOptions);

    var directionsService = new google.maps.DirectionsService();
    var directionsRequest = {
      origin: start,
      destination: end,
      travelMode: google.maps.DirectionsTravelMode.DRIVING,
      unitSystem: google.maps.UnitSystem.METRIC
    };
    directionsService.route(
      directionsRequest,
      function(response, status)
      {
    //	  alert(status);
        if (status == google.maps.DirectionsStatus.OK)
        {
          new google.maps.DirectionsRenderer({
            map: mapObject,
            directions: response
          });
        }
        else
          $("#error").append("Unable to retrieve your route<br />"+status);
      }
    );
    var mystartLatlng=start
    var getDistance = google.maps.geometry.spherical.computeDistanceBetween (start, end);
  //  alert(getDistance);
    
    }

    </script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCte1gu8YgsCVRdtD5JQ5eYByDbJbvVeNM&signed_in=false&libraries=places&callback=initMap"
        async defer></script>
    </body>
</html>