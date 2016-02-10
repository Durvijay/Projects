<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Truck Selection</title>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="UTF-8" />

        <link rel="stylesheet" type="text/css" href="css/style2.css" />
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    </head>
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
		<div style="text-align: center;color: #F7F7F7;margin-top: 1cm;"><p><h1>Please Select Truck Type</h1></p></div>
		<!-- //container -->
		
      
       
            <div style="width: 100%;overflow: auto; ">
             
             	<div style="padding-right: 1cm;">
		        	<br>	
		          <img src="images/Dodge_Truck.jpg" alt="Mountain View" style="padding-top:20px;width:304px;height:228px;float: right;margin-right: 15px; margin-left: 15px;"/>
		                
		          <img src="images/Cat_Truck.jpg" alt="Mountain View" style="padding-top:20px;width:304px;height:228px;float: right;margin-right: 15px; margin-left: 15px;"/>
		        
		          <img class="ca-menu" src="images/Kenworth_W900.jpg" alt="Mountain View" style="padding-top:20px;width:304px;height:228px;float: right;margin-right: 15px; margin-left: 15px;"/>
		          
		        
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
                    <li>
                        <a href="signUpVal.action">                            
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
             <div align="right">  
             <form action="driverLocations.action" method="post" name="Dirver_Locations">
		     	<input type="submit" name="truckType" value="Kenworth W900" onclick="assigntLatLng();"  style="margin-right: 6cm; margin-left: 15px;">
		      	<input type="hidden" name="latitude" id="latID">
		      	<input type="hidden" name="longitude" id="lonID" >
		     	<input type="submit" name="truckType" value="Cat Truck" onclick="assigntLatLng();" style="margin-right: 6cm; margin-left: 15px;">
		     
		     	<input type="submit" name="truckType" value="Dodge Truck" onclick="assigntLatLng();" style="margin-right: 4cm; margin-left: 15px;">
				<div style="padding-top: 1cm;">
				<label>Range :</label><input type="text" maxlength="2" required name="range" value="0" ><label>(in miles)</label>
				<input type="submit" name="truckType" value="ALL" onclick="assigntLatLng();"  style=" margin-left: 5cm;margin-right: 5cm;">
				</div>     
		     </form>
		     </div>
		     
            <br><br>
            <!-- content -->
        </div>
        
        
		

    </body>
    <script type="text/javascript">
    
    	function assigntLatLng(){
    		<%
    		
    		String lat=request.getParameter("currentLatitude");
    		String lng=request.getParameter("currentLongitude");
    		String pickUpPlace=request.getParameter("PickUpPlace");
    		String dropUpPlace=request.getParameter("DropUpPlace");
    		session.setAttribute("USERLAT", lat);
    		session.setAttribute("USERLNG", lng);
    		session.setAttribute("DropUpPlace", dropUpPlace);
    		session.setAttribute("PickUpPlace", pickUpPlace);
    		System.out.print(pickUpPlace+"+++"+lat+"======== "+lng+"+++++"+dropUpPlace);
    		%>
    		
    		document.getElementById('latID').value='<%=request.getParameter("currentLatitude")%>';
    		document.getElementById('lonID').value='<%=request.getParameter("currentLongitude")%>';
    		//alert(document.getElementById('latID').value+"message"+document.getElementById('lonID').value);
    	}
    </script>
</html>