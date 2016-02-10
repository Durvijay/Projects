package com.TruckRental.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;

import com.TruckRental.classes.Registration;
import com.opensymphony.xwork2.ActionSupport;


public class DAO extends ActionSupport implements SessionAware,
		ServletRequestAware, ServletResponseAware, ServletContextAware,
		Serializable {
	


	public String checkLogin(String userName, String password,HttpSession httpSession) {

		
		Connection conn=null;
		String status="FAILURE";
		try {
			conn = ConnectionClass.OpenConnection();
			System.out.println();
			PreparedStatement pstmt = conn.prepareStatement("select * from USER_INFORMATION u,PAYMENTDETAILS p where u.USERNAME=? and u.USER_PASSWORD=? and u.USER_ID=p.USER_ID");
			pstmt.setString(1, userName);
			pstmt.setString(2, password);
			System.out.println(pstmt.toString());
			ResultSet rs= pstmt.executeQuery();
			System.out.println(rs+"rs");
			if(rs!=null){
				while (rs.next()) {
					
					if(rs.getString("USERTYPE").equalsIgnoreCase("DRIVER")){							
						status=rs.getString("USERTYPE");
						httpSession.setAttribute("DRIVERID", rs.getString("USER_ID"));						
					}else {
						status=rs.getString("USERTYPE");
						String userId=rs.getString("USER_ID");
						System.out.println(status+"---"+userId);
						httpSession.setAttribute("USER_ID", userId);
						
					}
										
				}
				return status;
			}
			return status;
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.toString()+"rse");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "Exception";
	}

	
	@Override
	public void setServletContext(ServletContext arg0) {

	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {

	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
	}

	@Override
	public void setSession(Map arg0) {

	}

	public List mapRow(ResultSet rs) throws SQLException {
		   Registration reg = new Registration();
		   ArrayList<Registration> list=new ArrayList<>();
		   if(rs!=null){
				   
			   if(rs.getString("USERNAME")!=null){
				   reg.setUserName(rs.getString("USERNAME"));
			   }
			   if(rs.getString("USER_ID")!=null){
				   reg.setUserId(rs.getString("USER_ID"));
			   }
			   if(rs.getString("USER_PASSWORD")!=null){
				   reg.setUserPassword(rs.getString("USER_PASSWORD"));   
			   }
			   if(rs.getString("FIRST_NAME")!=null){
				   reg.setfName(rs.getString("FIRST_NAME"));
			   }
			   if(rs.getString("LAST_NAME")!=null){
				   reg.setlName(rs.getString("LAST_NAME"));
			   }
			   if(rs.getString("CONTACT_NUMBER")!=null){
				   reg.setPhoneNo(rs.getString("CONTACT_NUMBER"));
			   }
			   if(rs.getString("EMAIL_ID")!=null){
				   reg.setEmailId(rs.getString("EMAIL_ID"));
			   }
			   if(rs.getString("GENDER")!=null){
				   reg.setGender(rs.getString("GENDER"));
			   }
			   try {
			   if(rs.getDate("DOB")!=null){
				  
					reg.setDob(rs.getDate("DOB"));
			   }
			   if(rs.getDate("EXP_DATE")!=null){
				   reg.setExpDate(rs.getDate("EXP_DATE"));
			   }
			   }catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println(e);
				
			   }
			   if(rs.getString("STREET")!=null){
				   reg.setStreet(rs.getString("STREET"));
			   }
			   if(rs.getString("CITY")!=null){
				   reg.setCity(rs.getString("CITY"));
			   }
			   if(rs.getString("STATE")!=null){
				   reg.setState(rs.getString("STATE"));
			   }
			   if(rs.getString("COUNTRY")!=null){
				   reg.setCountry(rs.getString("COUNTRY"));
			   }
			   if(rs.getString("USERTYPE")!=null){
				   reg.setUserType(rs.getString("USERTYPE"));
			   }
			   if(rs.getString("CARDNO")!=null){
				   reg.setCardNo(rs.getString("CARDNO"));
			   }
			   if(rs.getString("CVV")!=null){
				   reg.setCvvNo(rs.getString("CVV"));
			   }
			   if(reg.getUserType().equalsIgnoreCase("driver")){
				   if(rs.getString("CAR_INFO")!=null){
					   reg.setTruckType(rs.getString("CAR_INFO"));
				   }
				   if(rs.getString("LONGITUDE")!=null){
					   reg.setLongitude(rs.getString("LONGITUDE"));
				   }
				   if(rs.getString("LATITUDE")!=null){
					   reg.setLatitude(rs.getString("LATITUDE"));
				   }
				   if(rs.getString("PLACE")!=null){
					   reg.setPlace(rs.getString("PLACE"));
				   }
				   /*if(rs.getString("PLACE")!=null){
					   reg.setPlace(rs.getString("PLACE"));
				   }*/
			   }
			   list.add(reg);
		
		   }
			   return list;
	   }

	
	
}