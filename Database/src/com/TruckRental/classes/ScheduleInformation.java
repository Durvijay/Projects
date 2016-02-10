package com.TruckRental.classes;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;

import com.TruckRental.dao.ConnectionClass;
import com.opensymphony.xwork2.ActionSupport;

public class ScheduleInformation  extends ActionSupport implements SessionAware,
ServletRequestAware, ServletResponseAware, ServletContextAware,
Serializable {

	private String schedule_ID;
	private String user_ID;
	private String driver_ID;
	private String pickup_longitude;
	private String pickup_latitude;
	private String dropoff_longitude;
	private String dropoff_latitude	;
	private Date pickUpDate;
	private String pickuptime;
	private String days;
	private String CustomerName;
	private String pickUpPlace;
	private String dropUpPlace;
	private String taskStatus;
	private String bookingId;
	private HttpServletRequest httpServletRequest;
	private HttpSession session;
	
	public String bookInfo(){
		try {
			session = httpServletRequest.getSession(true);
			
			System.out.println("aa gaaya");
			String userId=(String) session.getAttribute("USER_ID");
			String driverId=(String) session.getAttribute("DRIVERID");
			String pLongitude=(String) session.getAttribute("USERLNG");
			String pLatitude=(String) session.getAttribute("USERLAT");
			String pPlace=(String) session.getAttribute("PickUpPlace");
			String distance=(String) session.getAttribute("TotalDistance");
	//	pickUpDate=session.getAttribute("");
			distance=distance.replace(" mi", "");
			Date pDate=pickUpDate;
			java.sql.Date sqlDate=new java.sql.Date(pickUpDate.getTime());
			System.out.println(sqlDate);
			String pTime=pickuptime;
			Float amount=Float.parseFloat(distance)*9;
			String dPLace=(String) session.getAttribute("DropUpPlace");
			String status="Pending";

			System.out.println("userId"+userId+"driverId"+driverId+"pLongitude"+pLongitude+"pLatitude"+pLatitude);
			System.out.println("pPlace"+pPlace+"distance"+distance+"pTime"+pTime+"pDate"+pDate);
			System.out.println("amount"+amount+"dPLace"+dPLace+"status"+status);
			
			Connection connec=ConnectionClass.OpenConnection();
			PreparedStatement pstmt=connec.prepareStatement("INSERT INTO BOOKING_INFORMATION "
					+ "(USERID,DRIVERID,PLONGITUDE,PLATITUDE,PPLACE,PDATE,DPLACE,STATUS,DISTANCE,PTIME,PRICE,TOTALTIME)"
															+"VALUES(?,?, ?, ?, ?, ?, ?, ?, ?,?,?,?)");
			pstmt.setString(1, userId);
			pstmt.setString(2, driverId);
			pstmt.setString(3, pLongitude);
			pstmt.setString(4, pLatitude);
			pstmt.setString(5, pPlace);
			pstmt.setDate(6, new java.sql.Date(pDate.getTime()));
			pstmt.setString(7, dPLace);
			pstmt.setString(8, status);
			pstmt.setString(9, distance);
			pstmt.setString(10, pTime);			
			pstmt.setFloat(11, Float.parseFloat(distance)*4);
			pstmt.setString(12, (String) session.getAttribute("TotalTime"));
			System.out.println("ffabb"+pstmt.toString());
			int no=pstmt.executeUpdate();
			while(no>0){
				return "Success";
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			session.setAttribute("ERRORMESSGAE", e);
		}
		return "Failure";
	}
	
	
	public String LocationUpdate() throws ClassNotFoundException, SQLException{
		try {
			session = httpServletRequest.getSession(true);
			
			System.out.println("aa gaaya");
			String driverId=(String) session.getAttribute("DRIVERID");
			
			Connection connec=ConnectionClass.OpenConnection();
			PreparedStatement pstmt=connec.prepareStatement("UPDATE DRIVER_INFORMATION SET LONGITUDE = ?,LATITUDE = ?, PLACE=? WHERE DRIVER_ID =?");
			pstmt.setString(1, pickup_longitude);
			pstmt.setString(2, pickup_latitude);
			pstmt.setString(3, pickUpPlace);
			pstmt.setString(4, driverId);

			int no=pstmt.executeUpdate();
			while(no>0){
				return "Success";
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			session.setAttribute("ERRORMESSGAE", e);
		}
		return "Failure";
	}

	
	
	public String getBookingId() {
		return bookingId;
	}



	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}



	public HttpServletRequest getHttpServletRequest() {
		return httpServletRequest;
	}
	public void setHttpServletRequest(HttpServletRequest httpServletRequest) {
		this.httpServletRequest = httpServletRequest;
	}
	public HttpSession getSession() {
		return session;
	}
	public void setSession(HttpSession session) {
		this.session = session;
	}
	public String getCustomerName() {
		return CustomerName;
	}
	public void setCustomerName(String customerName) {
		CustomerName = customerName;
	}
	public String getPickUpPlace() {
		return pickUpPlace;
	}
	public void setPickUpPlace(String pickUpPlace) {
		this.pickUpPlace = pickUpPlace;
	}
	public String getDropUpPlace() {
		return dropUpPlace;
	}
	public void setDropUpPlace(String dropUpPlace) {
		this.dropUpPlace = dropUpPlace;
	}
	public String getSchedule_ID() {
		return schedule_ID;
	}
	public void setSchedule_ID(String schedule_ID) {
		this.schedule_ID = schedule_ID;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public String getDriver_ID() {
		return driver_ID;
	}
	public void setDriver_ID(String driver_ID) {
		this.driver_ID = driver_ID;
	}
	public String getPickup_longitude() {
		return pickup_longitude;
	}
	public void setPickup_longitude(String pickup_longitude) {
		this.pickup_longitude = pickup_longitude;
	}
	public String getPickup_latitude() {
		return pickup_latitude;
	}
	public void setPickup_latitude(String pickup_latitude) {
		this.pickup_latitude = pickup_latitude;
	}
	public String getDropoff_longitude() {
		return dropoff_longitude;
	}
	public void setDropoff_longitude(String dropoff_longitude) {
		this.dropoff_longitude = dropoff_longitude;
	}
	public String getDropoff_latitude() {
		return dropoff_latitude;
	}
	public void setDropoff_latitude(String dropoff_latitude) {
		this.dropoff_latitude = dropoff_latitude;
	}

	public Date getPickUpDate() {
		return pickUpDate;
	}

	public void setPickUpDate(Date pickUpDate) {
		this.pickUpDate = pickUpDate;
	}

	public String getPickuptime() {
		return pickuptime;
	}

	public void setPickuptime(String pickuptime) {
		this.pickuptime = pickuptime;
	}

	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public String getTaskStatus() {
		return taskStatus;
	}
	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
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
