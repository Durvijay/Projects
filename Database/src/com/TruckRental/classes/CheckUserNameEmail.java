package com.TruckRental.classes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TruckRental.dao.ConnectionClass;

public class CheckUserNameEmail extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) {

		try {
			String value = request.getParameter("name");
			Connection conn = ConnectionClass.OpenConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt
					.executeQuery("select * from USER_INFORMATION where USERNAME='"
							+ value + "' or EMAIL_ID='" + value + "'");
			if (rs.next()) {
				response.getWriter().print("Already Taken");
			}
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		doPost(request, response);
	}
}
