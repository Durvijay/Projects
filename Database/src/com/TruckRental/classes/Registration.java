/**
 * 
 */
package com.TruckRental.classes;

import java.io.Console;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;
import org.joda.time.DateTime;
import org.joda.time.LocalDateTime;

import com.TruckRental.dao.ConnectionClass;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author durvijay
 *
 */
public class Registration extends ActionSupport implements SessionAware,ServletRequestAware,
ServletResponseAware,ServletContextAware,Serializable{
//---------personal info--------------	
 private String userId;
 private String userName;
 private String userPassword;
 private String fName;
 private String lName;
 private String phoneNo;
 private String emailId;
 private Date regDate;
 private String street;
 private String city;
 private String state;
 private String country;
 private String pincode;
 private String gender;
 private Date dob;
 private String userType;

//------------card info-----------------
 private String cardNo;
 private String cvvNo;
 private Date expDate;
 
 //------------driver Information-------
 private String latitude;
 private String longitude;
 private String truckType;
 private String place;
 private String driverCheck;
 private String  updateField;
 
 
 
 private HttpServletRequest httpServletRequest;
private HttpSession session;
 
 

 
public String getUpdateField() {
	return updateField;
}

public void setUpdateField(String updateField) {
	this.updateField = updateField;
}



public String getDriverCheck() {
	return driverCheck;
}

public void setDriverCheck(String driverCheck) {
	this.driverCheck = driverCheck;
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

public String getTruckType() {
	return truckType;
}

public void setTruckType(String truckType) {
	this.truckType = truckType;
}

public String getUserType() {
	return userType;
}

public void setUserType(String userType) {
	this.userType = userType;
}

public Date getDob() {
	return dob;
}

public void setDob(Date dob) throws ParseException {
	//SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-DD");
	
	this.dob = dob;//sdf.parse(sdf.format(dob));
}

public String getCardNo() {
	return cardNo;
}


public String getUserName() {
	return userName;
}

public void setUserName(String userName) {
	this.userName = userName;
}

public void setCardNo(String cardNo) {
	this.cardNo = cardNo;
}

public String getCvvNo() {
	return cvvNo;
}

public void setCvvNo(String cvvNo) {
	this.cvvNo = cvvNo;
}

public Date getExpDate() {
	return expDate;
}

public void setExpDate(Date expDate) {
	this.expDate = expDate;
}

public String getUserId() {
	return userId;
}

public String getGender() {
	return gender;
}

public void setGender(String gender) {
	this.gender = gender;
}

public void setUserId(String userId) {
	this.userId = userId;
}
public String getUserPassword() {
	return userPassword;
}
public void setUserPassword(String userPassword) {
	this.userPassword = userPassword;
}

public String getfName() {
	return fName;
}

public void setfName(String fName) {
	this.fName = fName;
}

public String getlName() {
	return lName;
}

public void setlName(String lName) {
	this.lName = lName;
}

public String getPhoneNo() {
	return phoneNo;
}
public void setPhoneNo(String phoneNo) {
	this.phoneNo = phoneNo;
}
public String getEmailId() {
	return emailId;
}
public void setEmailId(String emailId) {
	this.emailId = emailId;
}
public Date getRegDate() {
	return regDate;
}
public void setRegDate(Date regDate) {
	this.regDate = regDate;
}
 
 public String getStreet() {
	return street;
}
public void setStreet(String street) {
	this.street = street;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getCountry() {
	return country;
}
public void setCountry(String country) {
	this.country = country;
}
public String getPincode() {
	return pincode;
}
public void setPincode(String pincode) {
	this.pincode = pincode;
}

public String signUp() throws SQLException 
 {
	
	int i=0;
	Connection conn=null;
	PreparedStatement pstmt=null;
		
	 try{
		 
			if (updateField !=null && updateField.equalsIgnoreCase("Updated")){
				System.out.println("updateField--"+updateField+"--");
			 return UpdateSignUpFields();
			 
		 }else{
			
			conn=ConnectionClass.OpenConnection();
			System.out.println("its 123456"+toString());
			conn.setAutoCommit(false);
			StringBuffer query=new StringBuffer();
			query.append("Insert into USER_INFORMATION (USERNAME,USER_PASSWORD,FIRST_NAME,"
					+ "LAST_NAME,CONTACT_NUMBER,EMAIL_ID,STREET,STATE,CITY,COUNTRY,GENDER,DOB,REGISTRATION_DATE,USERTYPE) values "
					+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			
			pstmt=conn.prepareStatement(query.toString());
			pstmt.setString(1, userName);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, fName);
			pstmt.setString(4, lName);
			pstmt.setString(5, phoneNo);
			pstmt.setString(6, emailId);
			pstmt.setString(7, street);
			pstmt.setString(8, state);
			pstmt.setString(9, city);
			pstmt.setString(10, country);
			pstmt.setString(11, gender);
			
			System.out.println("5463154");
			pstmt.setDate(12, new java.sql.Date(dob.getTime()));
			System.out.println("ghgvvh++++");
			LocalDateTime dttime=new LocalDateTime();
			regDate=dttime.toDate();
			System.out.println(regDate.getTime());
			pstmt.setDate(13, new java.sql.Date(regDate.getTime()));
			
			userType="USER";
			System.out.println("ghgv***vh");
			//pstmt.setString(14, userType);
			//System.out.println("ghgvvh");
			if(driverCheck!=null){
				if(driverCheck.equalsIgnoreCase("driverCheck"))
				pstmt.setString(14, "DRIVER");
			}else{
				pstmt.setString(14, "USER");
			}
			
			
			
			System.out.println("pstmt"+pstmt.toString());
			
			i = pstmt.executeUpdate();
			System.out.println("mhbhbhbm");
			if(i>0){
				String id=getUserName(conn,pstmt,userName);
				String driverStatus="asdf";
				String paymentStatus="asdf";
				boolean driverinsert=false;
				
				if(driverCheck!=null){
					driverinsert=true;
					System.out.println("sbfkBD Driver");
					driverStatus=insertDriverDetails(conn,pstmt,id);
					
				}
				
				
				if(!driverinsert || (driverStatus.equals("Success") && driverinsert)){
					System.out.println("sbfkBD insertPaymentDetails");
					paymentStatus=insertPaymentDetails(conn,pstmt,id);
				}
				
				if((paymentStatus.equals("Success") && !driverinsert) || (driverStatus.equals("Success") && paymentStatus.equals("Success"))){
					if(conn!=null){
						conn.commit();
						
					}
					return "Success";
				}else {
					conn.rollback();
				}
				
			}
		 }
	 	}catch(NullPointerException e){
	 		System.out.println("signUp NullPointerException"+ e);
	 		session.setAttribute("ERRORMESSGAE", e.toString());
	 	}catch(SQLException e){
	 		System.out.println("signUp");
	 		session.setAttribute("ERRORMESSGAE", e.toString());
	 		if(conn!=null)
	 			conn.rollback();
			System.out.println(e);
		}catch (Exception e) {
			System.out.println("signUp");
	 		session.setAttribute("ERRORMESSGAE", e.toString());
			System.out.println(e);
		}
	return "Failure";
	 
 }
private String UpdateSignUpFields() throws SQLException {
	int i=0;
	Connection conn=null;
	PreparedStatement pstmt=null;
	boolean driverStatus=false;
	 try{
		 session=httpServletRequest.getSession(true);
		 	String UserType=(String) session.getAttribute("USER_ID");
			
			conn=ConnectionClass.OpenConnection();
			System.out.println(UserType+"its 123456"+toString());
			conn.setAutoCommit(false);
			StringBuffer query=new StringBuffer();
			query.append("UPDATE USER_INFORMATION SET FIRST_NAME = ? ,LAST_NAME =?,CONTACT_NUMBER =?, "
					+ "GENDER=?, STREET=?,CITY = ?,STATE= ?, COUNTRY= ? "
					+ "WHERE USER_ID =?");
			pstmt=conn.prepareStatement(query.toString());
			pstmt.setString(1, fName);
			pstmt.setString(2, lName);
			pstmt.setString(3, phoneNo);
			pstmt.setString(4, gender);
			pstmt.setString(5, street);
			pstmt.setString(6, city);
			pstmt.setString(7, state);
			pstmt.setString(8, country);
			if(((String) session.getAttribute("USERTYPE")).equalsIgnoreCase("USER")){
				pstmt.setString(9, (String)session.getAttribute("USER_ID"));
			}else if(((String) session.getAttribute("USERTYPE")).equalsIgnoreCase("DRIVER")){
				pstmt.setString(9, (String)session.getAttribute("DRIVERID"));
				driverStatus=true;
			}
			

			
			
			System.out.println(pstmt.toString());
			i = pstmt.executeUpdate();
			if(i>0){
				String driverStatus1="";
				String paymentStatus="";
				boolean driverinsert=false;
				if(driverStatus){
					driverinsert=true;
					driverStatus1=updateDriverDetails(conn,pstmt);
					
				}
				
				
				if(!driverStatus || (driverStatus1.equals("Success") && driverinsert)){
					paymentStatus=UpdatePaymentDetails(conn,pstmt);
				}
				if((paymentStatus.equals("Success") && !driverinsert) || (paymentStatus.equals("Success") && driverStatus1.equals("Success") && driverinsert)){
					if(conn!=null){
						conn.commit();
						
					}
					if(driverStatus){
						return "DRIVERUPDATESUCCESS";
					}else{
						return "USERUPDATESUCCESS";
					}
				}else {
					conn.rollback();
				}
			}
		 
	 	}catch(SQLException e){
	 		System.out.println("UpdateSignUpFields");
	 		session.setAttribute("ERRORMESSGAE", e);
	 		if(conn!=null)
	 			conn.rollback();
			System.out.println(e);
		}catch (Exception e) {
			System.out.println("UpdateSignUpFields");
			session.setAttribute("ERRORMESSGAE", e);
			System.out.println(e);
			
		}
	return "Failure";
	
	
}

private String updateDriverDetails(Connection conn2,PreparedStatement pstmt2) throws SQLException {
	
	int j=0;
	 try{
			

		pstmt2=conn2.prepareStatement("UPDATE DRIVER_INFORMATION SET CAR_INFO =?,LONGITUDE = ?,LATITUDE = ?, PLACE=? WHERE DRIVER_ID =?");
		pstmt2.setString(1, truckType);
		pstmt2.setString(2, longitude);
		pstmt2.setString(3, latitude);
		pstmt2.setString(4, place);
		pstmt2.setString(5, (String)session.getAttribute("DRIVERID"));
		System.out.println(pstmt2.toString());
		j = pstmt2.executeUpdate();
		if(j>0){
			return "Success";
		}
		
	}catch (SQLException e){
		System.out.println("updateDriverDetails");
		e.printStackTrace();
		session.setAttribute("ERRORMESSGAE", e);
	} catch (Exception e) {
		System.out.println("updateDriverDetails");
		e.printStackTrace();
		session.setAttribute("ERRORMESSGAE", e);
	}
	 return "Failure";
}


private String insertDriverDetails(Connection conn2,PreparedStatement pstmt2, String id) throws SQLException {
	
	int j=0;
	 try{
			
//		conn2=ConnectionClass.OpenConnection();
//		conn2.setAutoCommit(false);
		//StringBuffer query=new StringBuffer();
		pstmt2=conn2.prepareStatement("Insert into DRIVER_INFORMATION (CAR_INFO,LONGITUDE,LATITUDE,PLACE,DRIVER_ID) "
				+ "values (?,?,?,?,?)");
		pstmt2.setString(1, truckType);
		pstmt2.setString(2, longitude);
		pstmt2.setString(3, latitude);
		pstmt2.setString(4, place);
		pstmt2.setString(5, id);
		System.out.println(pstmt2.toString());
		j = pstmt2.executeUpdate();
		if(j>0){
			return "Success";
		}
		
	}catch (SQLException e){
		System.out.println("insertDriverDetails");
		e.printStackTrace();
		session.setAttribute("ERRORMESSGAE", e);
	} catch (Exception e) {
		System.out.println("insertDriverDetails");
		e.printStackTrace();
		session.setAttribute("ERRORMESSGAE", e);
	}
	 return "Failure";
}

private String insertPaymentDetails(Connection conn1,PreparedStatement pstmt1, String userName2) throws SQLException {
	
	int j=0;
	 try{
			
	//	conn1=ConnectionClass.OpenConnection();
	//	conn1.setAutoCommit(false);
		//StringBuffer query=new StringBuffer();
		pstmt1=conn1.prepareStatement("Insert into PAYMENTDETAILS (CARDNO,CVV,EXP_DATE,USER_ID) values "
				+ "	(?,?,?,?)");
		pstmt1.setString(1, cardNo);
		pstmt1.setString(2, cvvNo);
		pstmt1.setDate(3, new java.sql.Date(expDate.getTime()));
		pstmt1.setString(4, userName2);
		System.out.println(pstmt1.toString());
		j = pstmt1.executeUpdate();
		if(j>0){
			
			return "Success";
		}
		
	}catch (SQLException e){
		System.out.println("insertPaymentDetails");
		e.printStackTrace();
		session.setAttribute("ERRORMESSGAE", e);
	} catch (Exception e) {
		System.out.println("insertPaymentDetails");
		e.printStackTrace();
		session.setAttribute("ERRORMESSGAE", e);
	}
	 return "Failure";
}

private String getUserName(Connection conn1,PreparedStatement pstmt1,String UserName){
	try{
		System.out.println(UserName);
		pstmt1=conn1.prepareStatement("select USER_ID FROM USER_INFORMATION where USERNAME=?");
		pstmt1.setString(1, userName);
		ResultSet rs=pstmt1.executeQuery();
		while (rs.next()) {
			System.out.println(rs.getString("USER_ID").toString());
			String userid=rs.getString("USER_ID");
			return userid;
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	return UserName;
	
}
private String UpdatePaymentDetails(Connection conn1,PreparedStatement pstmt1) throws SQLException {
	
	int j=0;
	 try{
			
	//	conn1=ConnectionClass.OpenConnection();
	//	conn1.setAutoCommit(false);
		//StringBuffer query=new StringBuffer();
		pstmt1=conn1.prepareStatement("UPDATE PAYMENTDETAILS SET CARDNO = ?,CVV = ?,EXP_DATE= ? WHERE USER_ID = ?");
		pstmt1.setString(1, cardNo);
		pstmt1.setString(2, cvvNo);
		pstmt1.setDate(3, new java.sql.Date(expDate.getTime()));
		if(((String) session.getAttribute("USERTYPE")).equalsIgnoreCase("USER")){
			pstmt1.setString(4, (String)session.getAttribute("USER_ID"));
		}else if(((String) session.getAttribute("USERTYPE")).equalsIgnoreCase("DRIVER")){
			pstmt1.setString(4, (String)session.getAttribute("DRIVERID"));
		}
		System.out.println(pstmt1.toString());
		j = pstmt1.executeUpdate();
		if(j>0){
			
			return "Success";
		}
		
	}catch (SQLException e){
		System.out.println("UpdatePaymentDetails");
		e.printStackTrace();
		session.setAttribute("ERRORMESSGAE", e);
	} catch (Exception e) {
		System.out.println("UpdatePaymentDetails");
		e.printStackTrace();
		session.setAttribute("ERRORMESSGAE", e);
	}
	 return "Failure";
}

@Override
public String toString() {
	return "Registration [userId=" + userId + ", userName=" + userName
			+ ", userPassword=" + userPassword + ", fName=" + fName
			+ ", lName=" + lName + ", phoneNo=" + phoneNo + ", emailId="
			+ emailId + ", regDate=" + regDate + ", street=" + street
			+ ", city=" + city + ", state=" + state + ", country=" + country
			+ ", pincode=" + pincode + ", gender=" + gender + ", dob=" + dob
			+ ", userType=" + userType + ", cardNo=" + cardNo + ", cvvNo="
			+ cvvNo + ", expDate=" + expDate + ", latitude=" + latitude
			+ ", longitude=" + longitude + ", truckType=" + truckType + "]";
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


public String signUpValues() {
try {
//	DAO dao = new DAO();
	session = httpServletRequest.getSession(true);
	String usertType=(String) session.getAttribute("USERTYPE");
	System.out.println(usertType+"userTypee");
	if(usertType.equalsIgnoreCase("DRIVER")){
		String userId=(String) session.getAttribute("DRIVERID");
		System.out.println(userId+"DRIVERID");
		Connection conn = ConnectionClass.OpenConnection();
		
		PreparedStatement pstmt=conn.prepareStatement("select * from USER_INFORMATION u,PAYMENTDETAILS p,DRIVER_INFORMATION d where u.USER_ID=? and u.USER_ID=p.USER_ID and d.DRIVER_ID=u.USER_ID");
		pstmt.setString(1, userId);
		ResultSet rs1= pstmt.executeQuery();
		if(rs1!=null){
			while (rs1.next()) {
				ArrayList<Registration> list=(ArrayList<Registration>) mapRow(rs1);
				
					session.setAttribute("REGISTRIONUPDATELIST", list);

			}
		}
		return "SUCCESS";
	}else{
		
		String userId=(String) session.getAttribute("USER_ID");
		System.out.println(userId+"USER_ID");

		Connection conn = ConnectionClass.OpenConnection();
		
		PreparedStatement pstmt=conn.prepareStatement("select * from USER_INFORMATION u,PAYMENTDETAILS p where u.USER_ID=?  and u.USER_ID=p.USER_ID");
		pstmt.setString(1, userId);
		ResultSet rs1= pstmt.executeQuery();
		if(rs1!=null){
			while (rs1.next()) {
				ArrayList<Registration> list=(ArrayList<Registration>) mapRow(rs1);
				
				session.setAttribute("REGISTRIONUPDATELIST", list);

			}
		}
		return "SUCCESS";
	}
	
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
	return "FAILURE";
	//return "agent";

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

public void logout() {
	
		session = httpServletRequest.getSession(false);
		session.invalidate();
		
		
}


 
}
