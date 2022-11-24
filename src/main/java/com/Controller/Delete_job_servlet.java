package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DatabaseConnection;
import com.Dao.Add_Job_Dao;

/**
 * Servlet implementation class Delete_job_servlet
 */
@WebServlet("/Delete")
public class Delete_job_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Delete_job_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		
		Add_Job_Dao ad=new Add_Job_Dao(DatabaseConnection.getConn());
		boolean f=ad.deletejob(id);
		
		HttpSession session=request.getSession();
		if(f) {
			session.setAttribute("message", "Job has been deleted Sucessfully");
			response.sendRedirect("View_Jobs.jsp");
		}
		else {
			session.setAttribute("message", "Something went Wrong on server..");
			response.sendRedirect("View_Jobs.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
