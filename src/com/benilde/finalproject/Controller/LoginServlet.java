package com.benilde.finalproject.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.benilde.finalproject.Model.UserBean;
import com.benilde.finalproject.Utilities.Mysql;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final String SELECT_USER_BY_ID = "select first_name, last_name, role, password from users where username = ?";

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		HttpSession session = request.getSession();

		if (!correctInput(username, password)) {
			session.setAttribute("errorMessage", "Invalid Input");
			response.sendRedirect("login.jsp");
			return;
		}

		UserBean authUser = getUser(username, password);

		if (authUser == null) {
			session.setAttribute("errorMessage", "Invalid Credentials");
			response.sendRedirect("login.jsp");
			return;
		}

		session.setAttribute("authUser", authUser);
		if (authUser.getRole().equals("withDisability")) {
			response.sendRedirect("disability.jsp");
		} else if (authUser.getRole().equals("student")) {
			response.sendRedirect("student.jsp");
		}
	}

	private boolean correctInput(String username, String password) {
		if (username.equals("")) {
			return false;
		}

		if (password.equals("")) {
			return false;
		}

		return true;
	}

	private UserBean getUser(String username, String password) {
		UserBean user = null;

		try (Connection connection = Mysql.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
			preparedStatement.setString(1, username);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				
				if(! BCrypt.checkpw(password, rs.getString("password"))) {
					return null;
				}
				
				String firstname = rs.getString("first_name");
				String lastname = rs.getString("last_name");
				String role = rs.getString("role");
				user = new UserBean(firstname, lastname, username, role);
			}
		} catch (SQLException e) {
			System.out.print(e);
		}
		return user;
	}
}
