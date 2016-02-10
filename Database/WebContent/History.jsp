<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.TruckRental.classes.ScheduleInformation"%>
<html lang="en">
    <head>
        <title>History</title>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="UTF-8" />
        

        <link rel="stylesheet" type="text/css" href="css/style2.css" />
        <link rel="stylesheet" type="text/css" href="css/TableCSSCode.css">
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
		
    </head>
    
    <script type="text/javascript">
//     header("Cache-Control: private, must-revalidate, max-age=0");
//     header("Pragma: no-cache");
//     header("Expires: Sat, 26 Jul 1997 05:00:00 GMT"); 
    window.addEventListener("hashchange", function(e){
    	//alert("Dsfd");
    	<%-- var sessionstatus='<%=session%>'
    	alert(sessionstatus) --%>
    	<%
    	  if (session == null)
    	  {
    	    %><jsp:forward page="index.html" /><%
    	  }
    	%>
    }
    
    
  </script>
     <body >
     <input type="hidden" id="refresh" value="no">
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
            <table class="CSSTableGenerator" style="float: right;">
		  <tr><td>Booking Id</td><td>Driver Name<td>Source</td><td>Destination</td><td>Pick Date Time</td></tr>
		  <tr><%!ScheduleInformation sch=null; %>
		  <%
				ArrayList<ScheduleInformation> arr = (ArrayList) session.getAttribute("HISTORY");
			   // Iterator<ScheduleInfo> itr=arr.iterator();
			   if(arr!=null){
			    for(int i=0;i<arr.size();i++){ 
			    	ScheduleInformation sch=arr.get(i);
			
			%>
		
			<td><%=sch.getBookingId()%></td>
			<td><%=sch.getDriver_ID() %></td>
			<td><%=sch.getPickUpPlace() %></td>
			<td><%=sch.getDropUpPlace() %></td>
			<td><%=sch.getPickuptime() %></td>
						
			</tr>
			<%} }%> 
		  
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
            	
            	
                                
 				         
            </div>
            
            
            <!-- content -->
        </div>
        
    
         
		<br><br><br><br><br><br><br><br><br><br>
		</div>
  
    </body>
</html>