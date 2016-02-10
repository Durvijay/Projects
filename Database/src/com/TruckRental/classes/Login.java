package com.TruckRental.classes;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
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

import com.TruckRental.dao.ConnectionClass;
import com.TruckRental.dao.DAO;
import com.opensymphony.xwork2.ActionSupport;



public class Login extends ActionSupport implements SessionAware,
		ServletRequestAware, ServletResponseAware, ServletContextAware,
		Serializable {

	
	int loginId;
	private String userName;
	private String password;
	private int loginCount = 3;
	private String firstLogin;
	private HttpServletRequest httpServletRequest;
	private static HttpSession session;
	

	public Login() {
		// TODO Auto-generated constructor stub
	}

	
	public String getFirstLogin() {
		return firstLogin;
	}


	public void setFirstLogin(String firstLogin) {
		this.firstLogin = firstLogin;
	}


	public int getLoginId() {
		return loginId;
	}

	public void setLoginId(int loginId) {
		this.loginId = loginId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(int loginCount) {
		this.loginCount = loginCount;
	}

	public String execute() {
		return SUCCESS;
	}
	
	public String logout15(){
		System.out.println(",jsdabjsb");
		session.removeAttribute("USERTYPE");
		session = httpServletRequest.getSession(false);
		session.invalidate();
//		System.out.println(session.getAttribute("USERTYPE")+"--++");
		
		return "Success1";
	}

	public String login() {
		System.out.println(getUserName());
		System.out.println(getPassword());
		DAO dao = new DAO();
		session = httpServletRequest.getSession(true);
		String status = dao.checkLogin(userName, password,session);
		
			session.setAttribute("userName", userName);
			session.setAttribute("USERTYPE", status);
		//	System.out.println(session.getAttribute("USER_ID")+"---***////"+session.getAttribute("REGISTRIONUPDATELIST"));
			if(!status.equals("FAILURE") && status.equals("DRIVER")){
				//	out.println("Login Successful");
				ArrayList<ScheduleInformation> list=new ArrayList<>();
				list = getUserSchdelueInfo(userName);
				
				session.setAttribute("SCHEDULEINFO", list);
				System.out.println(list.size()+" sixw");
				return "DRIVER";
			}else if(!status.equals("FAILURE") && status.equals("USER")){
				return "USER";
			}else if(status.equals("Exception")){
				session.setAttribute("ERRORMESSGAE", "SQL Server Connection Timeout");
			}else{
				session.setAttribute("ERRORMESSGAE", "Invalid User Credentials");
			}
			
		return status;
		//return "agent";

	}
	

public static ArrayList<ScheduleInformation> getUserSchdelueInfo(String username) {
		
		ArrayList<ScheduleInformation> schedulelist=new ArrayList<>();
try{
	Connection conn = ConnectionClass.OpenConnection();

		
		PreparedStatement pstmt = conn.prepareStatement("SELECT CONCAT(CONCAT(u.FIRST_NAME, ' '), u.LAST_NAME) CustName, s.PPLACE, s.DPLACE, CONCAT(CONCAT(s. PDATE, ' '), s.PTIME) pickUpTime, s.STATUS FROM BOOKING_INFORMATION s, USER_INFORMATION u WHERE u.USERNAME=? AND s.DRIVERID =u.USER_ID AND s.STATUS ='Pending'");
		pstmt.setString(1, username);

		ResultSet resultSet = pstmt.executeQuery();
		
		if (resultSet!=null){
			while (resultSet.next()) {
				ScheduleInformation scInfo=new ScheduleInformation();
				scInfo.setCustomerName(resultSet.getString("CustName"));
				scInfo.setPickUpPlace(resultSet.getString("PPLACE"));
				scInfo.setDropUpPlace(resultSet.getString("DPLACE"));
				scInfo.setPickuptime(resultSet.getString("pickUpTime"));
				scInfo.setTaskStatus(resultSet.getString("status"));
				schedulelist.add(scInfo);
			}
			return schedulelist;
		}
			
		else
			return schedulelist;
		}catch(SQLException e){
			e.printStackTrace();
			session.setAttribute("ERRORMESSGAE", e);
		}catch (Exception ee) {
			ee.printStackTrace();
			session.setAttribute("ERRORMESSGAE", ee);
		}
		return schedulelist;
}


public String historyInfo(){
	Connection conn;
	ArrayList<ScheduleInformation> list=new ArrayList<>();
	try {
		session = httpServletRequest.getSession(true);
		conn = ConnectionClass.OpenConnection();

		PreparedStatement pstmt = conn.prepareStatement("SELECT  a.BOOKINGID,a.DPLACE,a.DRIVERID,a.PPLACE, PTIME,"
				+ "CONCAT(CONCAT(u.FIRST_NAME, ' '), u.LAST_NAME) driverName FROM USER_INFORMATION u,(SELECT b.BOOKINGID, "
				+ "b.DRIVERID, b.PPLACE, b.DPLACE,CONCAT(CONCAT(b.PDATE, ' '), b.PTIME)  PTIME FROM BOOKING_INFORMATION b "
				+ "WHERE b.USERID=? ) a where a.DRIVERID=u.USER_ID");
		String userId=(String) session.getAttribute("USER_ID");
		
		pstmt.setString(1,userId );
		System.out.println(pstmt.toString()+" "+session.getAttribute("USER_ID")+"session.getAttribute()");
		ResultSet rs= pstmt.executeQuery();
		if(rs!=null){
			while (rs.next()) {
				ScheduleInformation scd=new ScheduleInformation();
				scd.setBookingId(rs.getString("BOOKINGID"));
				scd.setDriver_ID(rs.getString("driverName"));
				scd.setPickUpPlace(rs.getString("PPLACE"));
				scd.setDropUpPlace(rs.getString("DPLACE"));
				scd.setPickuptime(rs.getString("PTIME"));
				list.add(scd);
				
			}
			session.setAttribute("HISTORY", list);
			return "Success";
		}
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		session.setAttribute("ERRORMESSGAE", e);
	}
	
		
	
	return "Failure";
	
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
