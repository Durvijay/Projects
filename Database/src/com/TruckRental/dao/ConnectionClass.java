package com.TruckRental.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionClass {
	private static Connection  conn=null;
	public static Connection OpenConnection() throws ClassNotFoundException, SQLException
	{
		if(conn==null)
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://mysql42754-TruckRentalOnTheWay-DB.whelastic.net/TruckRentalDB","root","0YT8muVIug");												
		}
		return conn;
}
/*	public static Connection OpenConnection() throws ClassNotFoundException, SQLException{
		if(conn==null)
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","Accenture012");
		
		}
		return conn;
}*/
	
	public static void closeConnection() throws SQLException{
	conn.close();
	conn=null;
	}
}
