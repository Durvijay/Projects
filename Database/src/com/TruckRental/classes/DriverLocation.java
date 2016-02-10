package com.TruckRental.classes;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Map;




import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;
import org.json.simple.JSONArray;

import com.TruckRental.dao.ConnectionClass;
import com.opensymphony.xwork2.ActionSupport;

public class DriverLocation extends ActionSupport implements SessionAware,
ServletRequestAware, ServletResponseAware, ServletContextAware,
Serializable {
	

private String place;
private String latitude;
private String longitude;
private String name;
private int id;
private String truckType;
private String range;

private HttpServletRequest httpServletRequest;
private HttpSession session;

public String getTruckType() {
	return truckType;
}
public void setTruckType(String truckType) {
	this.truckType = truckType;
}


public String getPlace() {
	return place;
}
public void setPlace(String place) {
	this.place = place;
}
public String getLatitude() {
	return latitude;
}
public void setLatitude(String latitude) {
	this.latitude = latitude;
}
public String getLongitude() {
	return longitude;
}
public void setLongitude(String longitude) {
	this.longitude = longitude;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}



	public String getRange() {
	return range;
}
public void setRange(String range) {
	this.range = range;
}
	public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
	
	public String locations() throws ClassNotFoundException, SQLException{
	try{
		System.out.println(latitude+"-********************************-- "+longitude);
		Connection conn=ConnectionClass.OpenConnection();
		PreparedStatement pstmt;
		if(truckType.equalsIgnoreCase("ALL")){
			pstmt=conn.prepareStatement("select d.CAR_INFO,d.DRIVER_ID,d.LONGITUDE,d.LATITUDE,d.PLACE,CONCAT(CONCAT(u.FIRST_NAME, ' '), u.LAST_NAME) NAMES from DRIVER_INFORMATION d,USER_INFORMATION u where u.USER_ID=d.DRIVER_ID ");
		}else{
			pstmt=conn.prepareStatement("select d.CAR_INFO,d.DRIVER_ID,d.LONGITUDE,d.LATITUDE,d.PLACE,CONCAT(CONCAT(u.FIRST_NAME, ' '), u.LAST_NAME) NAMES from DRIVER_INFORMATION d,USER_INFORMATION u where u.USER_ID=d.DRIVER_ID  AND d.CAR_INFO=?");
			pstmt.setString(1, truckType);
		}
		System.out.println(truckType+"+ locations[i+2] ");
		
		ResultSet rs=pstmt.executeQuery();
		ResultSetMetaData md = rs.getMetaData();
		
		JSONArray list = new JSONArray();
		System.out.println(rs);
		if(!(rs == null)){
			session = httpServletRequest.getSession(true);
			
			 while( rs.next() )
		      {
				 
		          for( int i = 1; i <= md.getColumnCount(); i++ )
		             System.out.print( rs.getString(i) + " " ) ;
		          System.out.println() ;
		          float distance = distFrom(Float.parseFloat(latitude), Float.parseFloat(longitude), Float.parseFloat(latitude), Float.parseFloat(rs.getString("LONGITUDE")));
		          System.out.println("distanec  "+distance);
		          if(distance<Float.parseFloat(range)|| range.equalsIgnoreCase("0")){
			          list.add(rs.getString("CAR_INFO"));
			          list.add(rs.getString("LATITUDE"));
			          list.add(rs.getString("LONGITUDE"));
			          list.add(rs.getString("PLACE"));
			          list.add(rs.getString("DRIVER_ID"));
			          list.add(rs.getString("NAMES"));			          
		          }
		          
		     
				
			}
			 
			 
			
			 session.setAttribute("DRIVERLOCATION1", list);
			// System.out.println(strbuff + "complete list");
			 return "Success";
		}
	}catch(SQLException e){
		System.out.println(e);
		session.setAttribute("ERRORMESSGAE", e);
	}catch (Exception e) {
		System.out.println(e);
		session.setAttribute("ERRORMESSGAE", e);
	}
	return "Failure";
		

		
	}
	
	
	public static float distFrom(float lat1, float lng1, float lat2, float lng2) {
	    double earthRadius = 6371000; //meters
	    double dLat = Math.toRadians(lat2-lat1);
	    double dLng = Math.toRadians(lng2-lng1);
	    double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
	               Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
	               Math.sin(dLng/2) * Math.sin(dLng/2);
	    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	    float dist = (float) (earthRadius * c );
	    dist=(float) (dist*0.000621371);
	    System.out.println("distance in miles"+dist);
	    return dist;
	    }
	
@Override
public void setServletContext(ServletContext arg0) {
	// TODO Auto-generated method stub
	
}
@Override
public void setServletResponse(HttpServletResponse arg0) {
	// TODO Auto-generated method stub
	
}
@Override
public void setServletRequest(HttpServletRequest arg0) {
	// TODO Auto-generated method stub
	httpServletRequest = arg0;
	
}
@Override
public void setSession(Map arg0) {
	// TODO Auto-generated method stub
	
}


}
