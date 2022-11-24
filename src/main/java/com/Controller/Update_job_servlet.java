package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.Jobs;
import com.DB.DatabaseConnection;
import com.Dao.Add_Job_Dao;


public class Update_job_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Update_job_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			String ti=request.getParameter("title");
			String lo=request.getParameter("Location");
			String ca=request.getParameter("category");
			String sta=request.getParameter("Status");
			String de=request.getParameter("desc");
			
			Jobs j=new Jobs();
			j.setTitle(ti);
			j.setLocation(lo);
			j.setDescription(de);
			j.setStatus(sta);
			j.setCategory(ca);
			j.setId(id);
			
			Add_Job_Dao ad=new Add_Job_Dao(DatabaseConnection.getConn());
			boolean f=ad.updatejob(j);
			
			HttpSession session=request.getSession();
			if(f) {
				session.setAttribute("message", "Job has been updated Sucessfully");
				response.sendRedirect("View_Jobs.jsp");
			}
			else {
				session.setAttribute("message", "Something went Wrong on server..");
				response.sendRedirect("View_Jobs.jsp");
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
