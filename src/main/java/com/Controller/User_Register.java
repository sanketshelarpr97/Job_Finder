package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.Jobs;
import com.Bean.User;
import com.DB.DatabaseConnection;
import com.Dao.Add_Job_Dao;
import com.Dao.User_Dao;

/**
 * Servlet implementation class User_Register
 */
public class User_Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("uname");
		String quli=request.getParameter("uquli");
		String email=request.getParameter("uemail");
		String pass=request.getParameter("upass");
		
		User u=new User(name,email,quli,pass,"User");
		
		
		User_Dao ud=new User_Dao(DatabaseConnection.getConn());
		boolean f=ud.adduser(u);
		
		HttpSession session=request.getSession();
		if(f) {
			session.setAttribute("message", "Register Sucessfully");
			response.sendRedirect("Signup.jsp");
		}
		else {
			session.setAttribute("message", "Something went Wrong on server..");
			response.sendRedirect("Signup.jsp");
		}
		
		
	}

}
