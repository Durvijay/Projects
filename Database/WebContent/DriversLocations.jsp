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
     <script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKzK3QizTYZt6WzCHFGHM37mRqFiaZdU0&signed_in=true&libraries=places"></script>
    
    <script type="text/javascript" src="js/DistanceMatrix.js"></script>
   <script src="js/jquery-1.11.1.min.js"> </script>
   
  <script type="text/javascript">
  
  </script>
     <body class="banner" >
    <div >
    <!-- container -->
		<div class="container" >
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
		<div style="text-align: center;color: #F7F7F7;margin-top: 2cm;"><p><h1>Please Select Truck For Booking</h1></p></div>
		<!-- //container -->
		
      
       
            <div style="width: 100%;overflow: auto; ">
              <div style="padding-right: 1cm;">
				<div id="map" style="width: 1000px; height: 380px; float: right;"></div>
				

			</div>
             
            		       
            	<ul class="ca-menu">
                    <li>
                        <a href="WelcomePage.jsp">                           
                            <div class="ca-content">
                                <h2 class="ca-main">Book Truck</h2>                               
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="FareCalculator.html">                           
                            <div class="ca-content">
                                <h2 class="ca-main">Fare Calculator</h2>                               
                            </div>
                        </a>
                    </li>
                   
                        <li><a href="signUpVal.action">                           
                            <div class="ca-content">
                                <h2 class="ca-main">Personal Information</h2>                              
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="history.action">                          
                            <div class="ca-content">
                                <h2 class="ca-main">History</h2>                              
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
            
		    <div style="float: right;margin-right: 3cm;">
 				<input type="text" disabled="disabled" id="driverSelectionMessageID" style="width: 400px;margin-right: 1cm;">
<!--  				 <form action="bookingInformation.action" method="post" name="Booking_Information"> -->
<!--  					<input type="submit" name="book" value="Book" id="bookId" onclick="addDetailsToSession();"> -->
<!--  				</form> -->
				<input type="submit" name="book" value="Book" id="bookId" onclick="addDetailsToSession();">
 				<input type="hidden" name="total_Distance" class="controls" id="total_distance" disabled="disabled">							
				<input type="hidden" name="total_time" class="controls" id="total_time" disabled="disabled">
								
							
							
 			</div>                                
 			
            <br><br><br>
            <!-- content -->
        </div>
        
        
		

    </body>
    <script type="text/javascript">
    var driverSelection='';
    var driverName='';
    function addDetailsToSession(){
    	
    	
    	window.location.href = "ConfirmationPage.jsp?TotalTime="+document.getElementById("total_time").value+"&TotalDistance="+document.getElementById("total_distance").value+"&driverSelectionId="+driverSelection+"&driverName="+driverName;
    	
    }
  /*    var locations = [
      ['Bondi Beach', -33.890542, 151.274856, 4],
      ['Coogee Beach', -33.923036, 151.259052, 5],
      ['Cronulla Beach', -34.028249, 151.157507, 3],
      ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
      ['Maroubra Beach', -33.950198, 151.259302, 1]
    ]; */
    
    var locations=JSON.parse('<%=session.getAttribute("DRIVERLOCATION1")%>');
   // alert(locs);
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 10,
      center: new google.maps.LatLng(33.79336,-118.1355026),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;
    
    var image;

    $(window).load(function(){
    	//alert("SAd");
    	$('#bookId').hide();
    	$("#driverSelectionMessageID").val('');
    });
    $(window).unload(function () {
    	$('#bookId').hide();
    	$("#driverSelectionMessageID").val('');
    	});
	if(!(locations.length>0)){
		alert("Currently Trucks are not Available for this Location, Please select some other Location");
	}
    for (i = 0; i < locations.length; i=i+6) {  
    //	alert(locations[i]+"  "+locations[i+1]+ "   "+ locations[i+2] +"  "+ locations[i+3] +"  "+locations.length+ "  "+i);
    	if(locations[i]=='Kenworth W900'){
    	image = {
       		  url: "images/kenworthMapMarker.jpg",
       		  size: new google.maps.Size(71, 71),
       		  origin: new google.maps.Point(0, 0),
       		  anchor: new google.maps.Point(17, 34),
       		  scaledSize: new google.maps.Size(25, 25)
       		};
    	}else if(locations[i]=='Dodge Truck'){
    		image = {
    	       		  url: "images/DodgeTruckMapMarker.jpg",
    	       		  size: new google.maps.Size(71, 71),
    	       		  origin: new google.maps.Point(0, 0),
    	       		  anchor: new google.maps.Point(17, 34),
    	       		  scaledSize: new google.maps.Size(25, 25)
    	       		};
    	}else{
    		image = {
    	       		  url: "images/catTruckMapMarker.jpg",
    	       		  size: new google.maps.Size(71, 71),
    	       		  origin: new google.maps.Point(0, 0),
    	       		  anchor: new google.maps.Point(17, 34),
    	       		  scaledSize: new google.maps.Size(25, 25)
    	       		};
    	}
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i+1],locations[i+2]),
        map: map,
        icon: image
        /* ,
        icon: "images/kenworthMapMarker.jpg" */
      });
      
		 
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
        	var html = "<b> Place :" + locations[i+3]+ "</b> <br/><b>Car Type:" + locations[i]+"</b>";
          infowindow.setContent(html);
          infowindow.open(map, marker);
          driverSelection=locations[i+4];
          driverName=locations[i+5];
          var origin1='<%=session.getAttribute("PickUpPlace")%>';
      		var destinationA='<%=session.getAttribute("DropUpPlace")%>';
      		initMaps(origin1, destinationA, "total_distance", "total_time");
          $('#bookId').show();
        <%--   <% session.setAttribute("DRIVERID", );%> --%>
          $('#driverSelectionMessageID').val(locations[i+3]+" driver is Selected");
        };
      })(marker, i));
      google.maps.event.addListener(marker, 'mouseover', (function(marker, i) {
          return function() {
        	//  alert(locations[i+3]);
        	  var html = "<b> Place :" + locations[i+3]+ "</b> <br/><b>Car Type:" + locations[i]+"</b>";
            infowindow.setContent(html);
            infowindow.open(map, marker);
          };
        })(marker, i)); 
    }
  </script>
 
  
</html>