<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.Dao.Add_Job_Dao" %>
    <%@page import="com.DB.DatabaseConnection" %>
    <%@page import="java.util.List" %>
    <%@page import="com.Bean.Jobs" %>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<div class="container">
	<div class="row">
	
	
		<div class="col-md-12">
			<h5 class="text-center text-primary">All Jobs</h5>
			<c:if test="${not empty message }">
			<div class="alert alert-success" role="alert">${message}</div>
			<c:remove var="message"/>
			</c:if>
			
			<%  Add_Job_Dao ad = new Add_Job_Dao(DatabaseConnection.getConn()); 
			
				List<Jobs> list=ad.getjob();
				
				for(Jobs j:list)
				{ %>
					
					<div class="card mt-2">
				<div class="card-body">
					<div class="text-center text-primary">
				<i class="fa fa-clipboard fa-2x"></i>
					</div>
					
					<h6><%=j.getTitle() %></h6>
					<p><%=j.getDescription() %></p>
				<br>
				
				<div class="form-row">
				<div class="form-group col-md-3">
					<input type="text" value="Location:<%=j.getLocation() %>" readonly class="form-control form-control-sm">
				</div>
				
				<div class="form-group col-md-3">
					<input type="text" value="Category:<%=j.getCategory() %>" readonly class="form-control form-control-sm">
				</div>
				
				<div class="form-group col-md-3">
					<input type="text" value="Status:<%=j.getStatus() %>" readonly class="form-control form-control-sm">
				</div>
				
				</div>
				<h6>Publish Date:<%=j.getPdate() %></h6>
				<div class="text-center">
				<a href="Update_Job.jsp?id=<%=j.getId() %>" class="btn btn-sm bg-success text-white">Edit</a>
				<a href="Delete?id=<%=j.getId() %>" class="btn btn-sm bg-danger text-white">Delete</a>
				</div>
				</div>
			
			</div>		
					
				 <%}
				
				
				
			
			%>
			
			
		</div>
	
	</div>


</div>
</body>
</html>