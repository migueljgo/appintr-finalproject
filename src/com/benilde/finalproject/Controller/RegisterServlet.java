package com.benilde.finalproject.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.benilde.finalproject.Model.UserBean;
import com.benilde.finalproject.Utilities.Mysql;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final String INSERT_USERS_SQL = "INSERT INTO users" 
			+ " (first_name, last_name, role, username, password) VALUES " 
			+ " (?, ?, ?, ?, ?);";
	private static int workload = 12;
	String firstname;
	String lastname;
	String role;
	String username;
	String password;
	String confirmPassword;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.firstname = request.getParameter("firstname");
		this.lastname = request.getParameter("lastname");
		this.role = request.getParameter("role");
		this.username = request.getParameter("username");
		this.password = request.getParameter("password");
		this.confirmPassword = request.getParameter("confirmPassword");
		
		HttpSession session = request.getSession();
		if(! correctInput()) {
			session.setAttribute("errorMessage", "Invalid Input");
			response.sendRedirect("register.jsp");
			return;
		}

		try {
			Connection connection = Mysql.getConnection(); 
					
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
			preparedStatement.setString(1, firstname);
			preparedStatement.setString(2, lastname);
			preparedStatement.setString(3, role);
            preparedStatement.setString(4, username);
            preparedStatement.setString(5, BCrypt.hashpw(password, BCrypt.gensalt()));
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            System.out.print(e);
        }
		
		UserBean authUser = new UserBean(firstname, lastname, username, role);
		
		session.setAttribute("authUser", authUser);
		if (authUser.getRole().equals("withDisability")) {
			response.sendRedirect("disability.jsp");
		} else if (authUser.getRole().equals("student")) {
			response.sendRedirect("student.jsp");
		}
	}
	
	private boolean correctInput() {
		if(firstname.equals("")) {
			return false;
		}
		
		if(lastname.equals("")) {
			return false;
		}
		
		if(role.equals("")) {
			return false;
		}
		
		if(username.equals("")) {
			return false;
		}
		
		if(password.equals("")) {
			return false;
		}
		
		if(! password.equals(confirmPassword)) {
			return false;
		}
		
		return true;
	}
}
