<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.TruckRental.classes.ScheduleInformation"%>
<html lang="en">
    <head>
        <title>Summary Page</title>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="UTF-8" />

        <link rel="stylesheet" type="text/css" href="css/style2.css" />
        <link rel="stylesheet" type="text/css" href="css/TableCSSCode.css">
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
		<script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
		
		<link rel="stylesheet" href="include/ui-1.10.0/ui-lightness/jquery-ui-1.10.0.custom.min.css" type="text/css" />
    <link rel="stylesheet" href="js/jquery.ui.timepicker.css?v=0.3.3" type="text/css" />

     <script type="text/javascript" src="include/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="include/ui-1.10.0/jquery.ui.core.min.js"></script>
    <script type="text/javascript" src="include/ui-1.10.0/jquery.ui.widget.min.js"></script>
    <script type="text/javascript" src="include/ui-1.10.0/jquery.ui.tabs.min.js"></script>
    <script type="text/javascript" src="include/ui-1.10.0/jquery.ui.position.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

    <script type="text/javascript" src="js/jquery.ui.timepicker.js?v=0.3.3"></script>
    </head>
   
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
		
		<div align="center" style="color: #99e6ff; margin-top: 2cm;"><h1>Confirmation</h1></div>
		<div >
		
   

   		
		<div style="padding-right: 10cm;">
		
            <table class="CSSTableGenerator" style="float: right;">
		  <tr><td>Summary</td><td></td></tr>
		  
		  <tr><td>Driver Name:</td><td><%=request.getParameter("driverName") %></td></tr>  
		  <tr><td>Pick Up Location:</td><td><%=session.getAttribute("PickUpPlace") %></td></tr>  
		  <tr><td>Drop Up Location:</td><td><%=session.getAttribute("DropUpPlace") %></td></tr> 
		  <tr><td>Total Distance:</td><td><%=request.getParameter("TotalDistance") %></td></tr> 
		  <tr><td>Total Time:</td><td><%=request.getParameter("TotalTime")%></td></tr> 
		  <tr><td>Amount :</td><td id="data1"></td></tr> 
		   
        </table>
        
        
                </div>
       
       
            <div>
            	<ul class="ca-menu">
                    <li><a href="WelcomePage.jsp">
							<div class="ca-content">
								<h2 class="ca-main">Book Truck</h2>
							</div>
					</a></li>
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
            	
            	
             <div align="center">
        	<form action="bookingInformation.action" method="post" name="Booking_Information" onsubmit="return BookingComplete();">
        	<label>Pick up Date :</label>
        	<input style="border:1px solid #d9d9d9" type="text" name="pickUpDate" maxlength="0"  id="pickUpDate" required/>
        	<pre id="script_1" style="display: none" class="code">$('#timepicker').timepicker();</pre>
        	<label for="timepicker.[1]">Pick Up time :</label>
        	<input type="text" style="width: 70px;" name="pickuptime" id="timepicker.[1]" maxlength="0" required/>
        	<br>
  			<input type="submit" name="book" value="Book" id="bookId" > 
  					
  					
  				</form>
        </div>              
 				         
            </div>
            
            
            <!-- content -->
        </div>
        
    
         
		<br><br><br><br><br>
		</div>
  
    </body>
    <script type="text/javascript">
    function BookingComplete(){
    	
    	var confirm = confirm("Do You Want To Confirm Booking");
        if (confirm == true) {
            return true;
        } else {
            return false;
        }
    }

  </script>
  <script type="text/javascript">
            $(document).ready(function() {
                $('#timepicker\\.\\[1\\]').timepicker( {
                    showAnim: 'blind'
                } );
                $( "#pickUpDate" ).datepicker();
            });
            
           
        </script>
     <script type="text/javascript">
    
    var dist = '<%=request.getParameter("TotalDistance") %>';
    <% 	session.setAttribute("TotalDistance", request.getParameter("TotalDistance"));
    	session.setAttribute("TotalTime", request.getParameter("TotalTime"));
    	session.setAttribute("DRIVERID", request.getParameter("driverSelectionId"));
    %>
    var res = dist.replace(" mi", "");
    var price=String(Number(res)*4);
    document.getElementById("data1").innerHTML = price+"$";
    
   
  </script>
</html>