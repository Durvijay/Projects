<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.TruckRental.classes.ScheduleInformation"%>
<html lang="en">
    <head>
        <title>Welcome Driver</title>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="UTF-8" />

        <link rel="stylesheet" type="text/css" href="css/style2.css" />
        <link rel="stylesheet" type="text/css" href="css/TableCSSCode.css">
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
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
		<div style="margin-top: 2cm;" >
		
   

   
		<div style="margin-right: 1cm;">
            <table class="CSSTableGenerator" style="float: right;">
		  <tr><td>Customer Name</td><td>Pick Up Place</td><td>Destination</td><td>PickUp DateTime</td><td>Status</td><td>Navigate</td></tr>
		  <tr><%!ScheduleInformation sch=null; %>
		  <%
				ArrayList<ScheduleInformation> arr = (ArrayList) session.getAttribute("SCHEDULEINFO");
			   // Iterator<ScheduleInfo> itr=arr.iterator();
			   if(arr!=null){
			    for(int i=0;i<arr.size();i++){ 
			    	ScheduleInformation sch=arr.get(i);
			
			%>
			
			<td><%=sch.getCustomerName() %></td>
			<td><%=sch.getPickUpPlace() %></td>
			<td><%=sch.getDropUpPlace() %><a href="#" onclick="markStatusComplete();"></a></td>
			<td><%=sch.getPickuptime() %></td>
			<td><%=sch.getTaskStatus() %></td>
			<td><a href="NavigateDriverPage.jsp?PickUpPlace=<%=sch.getPickUpPlace()%>
			&DropUpPlace=<%=sch.getDropUpPlace() %>">View</a></td>
			
			</tr>
			<%} }%> 
		  
        </table>
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
        
    
         
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
  
    </body>
</html>