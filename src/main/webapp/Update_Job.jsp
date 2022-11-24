<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="com.Dao.Add_Job_Dao" %>
    <%@page import="com.DB.DatabaseConnection" %>
    <%@page import="java.util.List" %>
    <%@page import="com.Bean.Jobs" %>
<%@ page isELIgnored="false"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="All_Component/Css.jsp"></jsp:include>
</head>
<body>
<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="Login.jsp"></c:redirect>
</c:if>

<jsp:include page="All_Component/Navbar.jsp"></jsp:include>
	<div class="container p-2">
	<div class="col-md-10 offset-md-1">
		<div class="card">
			<div class="card-body">
			<div class="text-center text-success">
			
			<% Add_Job_Dao ad=new Add_Job_Dao(DatabaseConnection.getConn()); 
			
					int id=Integer.parseInt(request.getParameter("id"));			
					Jobs j=ad.getjobbyId(id);
			%>
			
				<h5>Edit Jobs</h5>
			</div>
			<form action="Update_job_servlet" method="post">
			<input type="hidden" value="<%=j.getId() %>" name="id">
				<div class="form-group">
				<label>Enter Title</label>
				<input type="text" required class="form-control" name="title" value="<%=j.getTitle() %>">
				</div>
				
				<div class="form-row">
					<div class="form-group col-md-4">
					<label>Location</label>
					<select name="Location" class="custom-select" id="inputGroupSelect02" >
    						<option value="<%=j.getLocation() %>"><%=j.getLocation() %></option>
						    <option value="1">One</option>
						    <option value="2">Two</option>
						    <option value="3">Three</option>
						  </select>
					</div>
					
					<div class="form-group col-md-4">
					<label>Category</label>
					<select name="category" class="custom-select" id="inputGroupSelect02">
    						<option value="<%=j.getCategory() %>"><%=j.getCategory() %></option>
						    <option value="1">One</option>
						    <option value="2">Two</option>
						    <option value="3">Three</option>
						  </select>
					</div>
					
					<div class="form-group col-md-4">
					<label>Status</label>
					<select name="Status" class="custom-select" >
					 <option class="Active" value="<%=j.getStatus() %>"><%=j.getStatus() %></option>
						    <option class="Active" value="1">Active</option>
						    <option class="Inactive" value="2">Inactive</option>
						    
						  </select>
					</div>
				</div>
		
				<div class="form-group">
					<label>Enter Description</label>
					<textarea reequired rows="6" cols="" name="desc" class="form-control"><%=j.getDescription() %></textarea>
				</div>
				<button  class="btn btn-success">Update Job</button>
			</form>
			</div>
		</div>
	</div>
	
	
	</div>
</body>
</html>