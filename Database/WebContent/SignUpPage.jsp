<%@page import="java.util.ArrayList"%>
<%@page import="com.TruckRental.classes.Registration"%>

<!DOCTYPE html>
<html>
    <head>
        <title>CSS Registration Form</title>
 
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="css/default.css"/>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  		<script src="js/GetCurrentPlaceInfo.js"></script>
  		<script src="js/userNameCheck.js"></script>
  	</head>
    <body>  

    	<script type="text/javascript">
    	
    	 <% 

    	  String userType="";
    	  Registration reg=new Registration();
    	  if(session!=null && null!=session.getAttribute("USERTYPE") && null!=session.getAttribute("REGISTRIONUPDATELIST"))
    	  {
    		  System.out.println(session.getAttribute("USERTYPE")+"++--++");
    		  userType=(String)session.getAttribute("USERTYPE");
    		  
    		  ArrayList<Registration> list=new ArrayList();
    		  list=(ArrayList<Registration>)session.getAttribute("REGISTRIONUPDATELIST");
    		  System.out.print(list.size());
    		  if(list.size()>0){
    			  reg=list.get(0);
    			  System.out.println(reg.getUserName());
    			  
    		  }
   			
    	  }
    	  %> 
    	  var userType='<%=userType %>';
    	  



		$(document).ready(function (){
			$("#driverFieldSetId").hide();
			$( "#datepicker" ).datepicker({ changeMonth: true });
		    $( "#datepickerdob" ).datepicker({maxDate: "-1D"});
		});
    	$(function() {
    		/* $('#chkId').onClick(function () {
                alert('changed');
          }); */
    		 $('#chkId').change(function() {
    		        if($(this).is(":checked")) {
    		        	$("#driverFieldSetId").show();
    		        	$("#truckTypeID").attr("required", true);
    		        	$("#latitudeId").attr("required", true);
    		        	$("#longitudeId").attr("required", true);
    		        	$("#placeId").attr("required", true);
    		         //   var returnVal = confirm("Are you sure?");
    		           // $(this).attr("checked", returnVal);
    		        }else{
    		        	$("#driverFieldSetId").hide();
    		        	$('#truckTypeID').val('');
    		        	$('#latitudeId').val('');
    		        	$('#longitudeId').val('');
    		        	$('#placeId').val('');
    		        }
    		               
    		    });
    		
    	//	 alert("message");
    		    
    		//    alert("---"+userType+"---");
    		    if (userType!=null && userType!='' && userType!='null') {
    	    		  $("#userName").attr('disabled', 'disabled');
    	      		  $("#emailID").attr('disabled', 'disabled');
    	      		  $("#datepickerdob").attr('disabled', 'disabled');
    	      		  $("#repeatEmailId").attr('disabled', 'disabled');
    	      		$("#repeatUserPassword").attr("required", false);
		        	$("#userPasswordId").attr("required", false);
    	      			  $('#userNAmeChkId').hide();  
    	      		$('#emailCheckId').hide();
    	      		  $("p#UserpasswordBlock" ).hide();
    	      		
    	      		document.getElementById("updateId").value='Updated';
    	      		  document.getElementById("registerId").value='Update ';
    	      		  //$('#registerId').val("Update &raquo;");
    	      		  $("#userName").val('<%=reg.getUserName()%>');
	   	      		 $('#emailID').val('<%=reg.getEmailId()%>');
		      		 $('#repeatEmailId').val('<%=reg.getEmailId()%>');
		      		 $('#fName').val('<%=reg.getfName()%>');
		      		 $('#lName').val('<%=reg.getlName()%>');
		      		 $('#street').val('<%=reg.getStreet()%>');
		      		 $('#city').val('<%=reg.getCity()%>');
		      		 $('#state').val('<%=reg.getState()%>');
		      		 $('#phoneNo').val('<%=reg.getPhoneNo()%>');
		      		
		      		 var number=Number('<%=reg.getCardNo()%>');
		      		 $('#cardNo').val(number);
		      		$('#cvvNo').val('<%=reg.getCvvNo()%>');
		      		$('#countryId').val('<%=reg.getCountry()%>');
		      		$("[name=gender]").val(['<%=reg.getGender()%>']);
		      		var date = new Date('<%=reg.getDob()%>');
		      		//alert(date.getHours()+24+"  "+date);
		      		date.setHours(date.getHours()+24, date.getMinutes(), date.getSeconds(), 0);
		      		
		      		//alert(date);
		      	//	$("#your-input").val(date.getMonth()+"/"+date.getDate()+"/"+date.getFullYear());
		      		$('#datepickerdob').datepicker("setDate", date );
		      		var expdate = new Date('<%=reg.getExpDate()%>');
		      		
		      		expdate.setHours(expdate.getHours()+24, expdate.getMinutes(), expdate.getSeconds(), 0);
		      	//	alert(expdate);
		      		$('#datepicker').datepicker("setDate", expdate );
		      		
		      		
    				if (userType=='USER') {
    					//alert("256");
    					$("#chckFieldSetID").hide();
    					$("#driverFieldSetId").hide();;
    				}else if (userType='DRIVER') {
    				//	alert(userType);
    				    $("#driverFieldSetId").show();
    			//		$("#chkId").attr('checked', true);
    					$("#chckFieldSetID").hide();
    					
    					   
    					$("#truckTypeID").val('<%=reg.getTruckType()%>');
    					$("#latitudeId").val('<%=reg.getLatitude()%>');
    					$("#longitudeId").val('<%=reg.getLongitude()%>');
    					$("#placeId").val('<%=reg.getPlace()%>');
    					
    					
    				}
    				
    			}else{
    			//	alert(userType+"1");
    				  $("#userName").attr('disabled', false);
    	      		  $("#emailID").attr('disabled', false);
    	      		  $("#repeatEmailId").attr('disabled', false);
    	      		$("#datepickerdob").attr('disabled', false);
    	      		$("#repeatUserPassword").attr("required", true);
		        	$("#userPasswordId").attr("required", true);
    	      		  $( "p#UserpasswordBlock" ).show();
    	      		  $('#userNAmeChkId').show();  
    	      		  $('#emailCheckId').show();
    	      		document.getElementById("updateId").value="";
    	      		  document.getElementById("registerId").value="Register ";
    			}
    		    
    		    
    		  //  alert("message23");
    		  });
    	function getLocation() {
    	    if (navigator.geolocation) {
    	        navigator.geolocation.getCurrentPosition(showPosition);
    	    } else { 
    	        alert("Geolocation is not supported by this browser.");
    	    }
    	}

    	function showPosition(position) {
    		$('#').val('');
    		$('#longitudeId').val('');
    		$('#latitudeId').val('');
        	
        //	$('#placeId').val('');
  //      	alert(position.coords);
    		//document.getElementById("latitudeId").value=position.coords.latitude;
    		//document.getElementById("longitudeId").value=position.coords.longitude;
    		
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
    	
    	
    	//var checkI=false;
	        function validateForm() {
		//		alert(checkI+"---"+document.getElementById("userNAmeChkId").innerHTML+"--");
	        	if(document.getElementById("userNAmeChkId").innerHTML=='Already Taken' || document.getElementById("emailIdChkId").innerHTML=='Already Taken' ){
	        		alert('Please Correct Highlighted Fields');
	 	        	   
	 	        	  
 	        	    return false;
	        	}
	            
 	           if (!($('input[name=gender]:checked').length > 0)) {
 	        	  alert('gender is required');
 	        	   
 	        	  
 	        	    return false;
 	        	}
 	           
 	           if(!(document.getElementById("emailID").value==document.getElementById("repeatEmailId").value)){
 	        	  alert('Entered email id does not match');
 	        	   return false;
 	        	   
 	           }
 	          if(!(document.getElementById("userPasswordId").value==document.getElementById("repeatUserPassword").value)){
 	        	  alert('Entered password does not match');
 	        	   return false;
 	        	   
 	           }
 	          
 	         
 	         	return true;
 	          //  return false;
	        }
	        
	        $(window).unload(function () {
	        	$("#registrationForm")[0].reset();
	        	});

        </script>
        <input style="border:1px solid #d9d9d9" type="hidden" id="map" >
        <form  class="register" action="signUp.action" id="registrationForm" onsubmit="return validateForm();">
        
            <h1>Registration</h1>
            <fieldset class="row1">
                <legend>Account Details
                </legend>
                <p>
                    <label>User Name *</label>
                    <input style="border:1px solid #d9d9d9" type="text" name="userName" maxlength="10" id="userName" required onload="makeRequest(this.value,'userNAmeChkId');" onkeyup="makeRequest(this.value,'userNAmeChkId');"/>
                    <label id="userNAmeChkId" style="color: red;"></label>   
                </p>
               
                <p>
                    <label>Email *
                    </label>
                    <input style="border:1px solid #d9d9d9" type="email" name="emailId" id="emailID" maxlength="30"  placeholder="me@example.com" required onload="makeRequest(this.value,'userNAmeChkId');" onkeyup="makeRequest(this.value,'emailIdChkId');"/>
                   	<label id="emailIdChkId" style="color: red;"></label> 
                    <label>Repeat email *
                    </label>
                    <input style="border:1px solid #d9d9d9" type="email" name="repeatEmailId" id="repeatEmailId" placeholder="me@example.com" required/>
                    
                </p>
                <div id="emailCheckId"></div>
                <p id="UserpasswordBlock">
                    <label>Password*
                    </label>
                    <input style="border:1px solid #d9d9d9" type="text" name="userPassword" id="userPasswordId" maxlength="25" required/>
                    <label>Repeat Password*
                    </label>
                    <input style="border:1px solid #d9d9d9" type="text" name="repeatUserPassword" id="repeatUserPassword" required/>
                    <label class="obinfo">* obligatory fields
                    </label>
                </p>
            </fieldset>
            <fieldset class="row2">
                <legend>Personal Details
                </legend>
                <p>
                    <label>First Name *
                    </label>
                    <input style="border:1px solid #d9d9d9" type="text" name="fName" id="fName" maxlength="30" class="long" required />
                </p>
                <p>
                    <label>Last Name *
                    </label>
                    <input style="border:1px solid #d9d9d9" type="text" name="lName" id="lName" maxlength="30" class="long"  required/>
                </p>
                <p>
                    <label>Phone *
                    </label>
                    <input style="border:1px solid #d9d9d9" type="text" name="phoneNo" id="phoneNo" maxlength="10" required/>
                </p>
                
                <p>
                    <label>Gender *</label>
                    <input style="border:1px solid #d9d9d9" type="radio" name="gender" id="maleId" value="M">
                    <label class="gender">Male</label>
                    <input style="border:1px solid #d9d9d9" type="radio" value="F" name="gender" id="femaleId">
                    <label class="gender">Female</label>
                    
                </p>
                <p>
                    <label>Birthdate *
                    </label>
                    <input style="border:1px solid #d9d9d9" type="text" name="dob" maxlength="0"  id="datepickerdob" required/>
                </p>
               
            </fieldset>
            <fieldset class="row3">
                <legend>Further Information
                </legend>
                <p>
                    <label class="optional">Street
                    </label>
                    <input style="border:1px solid #d9d9d9" type="text" class="long" id="street" maxlength="30" name="street" required/>
                </p>
                <p>
                    <label>City *
                    </label>
                    <input style="border:1px solid #d9d9d9" type="text" class="long" id="city" maxlength="30"  name="city" required/>
                </p>
                <p>
                    <label>State *
                    </label>
                    <input style="border:1px solid #d9d9d9" type="text" class="long" id="state" maxlength="30"  name="state" required/>
                </p>
                <p>
                    <label>Country *
                    </label>
                    <select  name="country" id="countryId" required>
                        <option>
                        </option>
                        <option value="United States">United States
                        </option>
                    </select>
                </p>
               
                
            </fieldset>
            <fieldset class="row1">
                <legend>Credit Card Information
            	</legend>
            	 <p>
                    <label>Card No *
                    </label>
                    <input style="border:1px solid #d9d9d9;-moz-appearance:textfield;" type="number" oninvalid="setCustomValidity('Invalid Card Number.')"
     					oninput="setCustomValidity('')"
                    id="cardNo" name="cardNo" min="999999999999999" max="9999999999999999" class="long" required 
                    />
                </p>
                <p>
                    <label>Cvv No *
                    </label>
                    <input style="border:1px solid #d9d9d9;-moz-appearance:textfield;" type="number" id="cvvNo" oninvalid="this.setCustomValidity('Invalid Number')" oninput="setCustomValidity('')"
                      min="99" max="999" name="cvvNo" class="long" required/>
                </p>
                <p>
                    <label>Expiry Date *
                    </label>
                    <input style="border:1px solid #d9d9d9" type="text"  name="expDate" maxlength="0"  id="datepicker" required/>
                </p>
                
            </fieldset>
            <fieldset class="row6" id="chckFieldSetID">
            	<p>
                	<label id="chkLabelId"> Please check if you would like to be registered as Driver</label>
                	<input style="border:1px solid #d9d9d9" type="checkbox" id="chkId" name="driverCheck" value="driverCheck"/>
                </p>
            </fieldset>
            <fieldset class="row1" id="driverFieldSetId">
                <legend>Driver Information
            	</legend>
            	 <p>
                    <label>Truck Type *
                    </label>
                    <select  name="truckType" id="truckTypeID" >
                        <option>
                        </option>
                        <option value="Kenworth W900">Kenworth W900</option>
                        <option value="Cat Truck">Cat Truck</option>
                        <option value="Dodge Truck">Dodge Truck</option>
                    </select>
                </p>
                <p>
                    <label>Latitude *
                    </label>
                    <input style="border:1px solid #d9d9d9" type="text" name="latitude" class="long" id="latitudeId" />
<!--                     <input style="border:1px solid #d9d9d9"  id="get_current" type="button" style="cursor: pointer;" value="Get Current Location" onclick="getLocation();"><p class="wait_time">maa chudao</p> -->
                </p>
                <p>
                    <label>Longitude *
                    </label>
                    <input style="border:1px solid #d9d9d9" type="text" name="longitude" maxlength="10" class="long"   id="longitudeId" />
                </p>
                <p  class="place">
                    <label>Place *
                    </label>
                    <input style="border:1px solid #d9d9d9" type="text" name="place" maxlength="100" class="long"   id="placeId"/>
                    <input style="border:1px solid #d9d9d9"  id="get_latlng" type="button" style="cursor: pointer;" value="Search Place" onclick="getLocation();"><p class="wait_time">Working On it!</p>
                </p>
            </fieldset>
            
            <fieldset class="row4">
                
            </fieldset>
            <div><input style="border:1px solid #d9d9d9" type="submit" class="button" onclick="return validateForm();" name="myButton" id="registerId" value="Register &raquo;" ></input></div>
            <input type="hidden" name="updateField" value="" id="updateId">
        </form>
    </body>
    <script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKzK3QizTYZt6WzCHFGHM37mRqFiaZdU0&signed_in=true&libraries=places"></script>
    
</html>





