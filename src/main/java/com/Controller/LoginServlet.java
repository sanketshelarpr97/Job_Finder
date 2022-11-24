package com.Controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.User;
import com.DB.DatabaseConnection;
import com.Dao.User_Dao;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		try {
			String uEmail=request.getParameter("uemail");
			String uPass =request.getParameter("upass");
			
			User u=new User();
			
			HttpSession session=request.getSession();
			
			if("admin@gmail.com".equals(uEmail) && "Admin@1234".equals(uPass)) {
				session.setAttribute("userobj", u);
				u.setRole("admin");
				response.sendRedirect("Admin.jsp");
				
			}
			else {
				
				User_Dao ud=new User_Dao(DatabaseConnection.getConn()); 
					
				User user=ud.login(uEmail, uPass);
				
				if(user!=null) {
					session.setAttribute("userobj", user);
					response.sendRedirect("Home.jsp");
				}else {
					session.setAttribute("message", "Invalid Username and Password");
					response.sendRedirect("Login.jsp");
				}
				
			}
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
