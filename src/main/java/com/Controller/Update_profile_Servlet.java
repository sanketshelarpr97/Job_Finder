package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.User;
import com.DB.DatabaseConnection;
import com.Dao.User_Dao;


public class Update_profile_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Update_profile_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int Id=Integer.parseInt(request.getParameter("id"));
		
		String name=request.getParameter("name");
		String quli=request.getParameter("qua");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		
		User u=new User();
		u.setId(Id);
		u.setName(name);
		u.setEmail(email);
		u.setQulification(quli);
		u.setPassword(pass);
		
		
		User_Dao ud=new User_Dao(DatabaseConnection.getConn());
		
		boolean y=ud.Updateuser(u);
		
		HttpSession session=request.getSession();
		if(y) {
			session.setAttribute("Message", "Profile Updated Succesfully !");
			response.sendRedirect("Home.jsp");
			
		}
		else {
			session.setAttribute("Message", "Something Wrong on server !");
			response.sendRedirect("Home.jsp");
		}
		
	}

}
