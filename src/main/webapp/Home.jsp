<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"  %>
<%@page import="com.Dao.Add_Job_Dao" %>
    <%@page import="com.DB.DatabaseConnection" %>
    <%@page import="java.util.List" %>
    <%@page import="com.Bean.Jobs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User: Home</title>
<jsp:include page="All_Component/Css.jsp"></jsp:include>
</head>
<body style="background-color:#f0f1f2;">

	
	<c:if test="${empty userobj }">
	<c:redirect url="Login.jsp"></c:redirect>
	</c:if>
	
	
	
	<jsp:include page="All_Component/Navbar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
		<div class="col-md-12">
			<h5 class="text-center text-primary">All Jobs</h5>
			
			<c:if test="${not empty Message }">
			<h4 class="text-center text-danger">${Message}</h4>
			<c:remove var="Message"/>
			</c:if>
			
			<div class="card">
				<div class="card-body">
					<form class="form-inline" action="more_view.jsp" method="post">
						<div class="form-group col-md-5 mt-1">
							<h5>Location</h5>
						</div>
						
						<div class="form-group col-md-4 mt-1">
							<h5>Category</h5>
						</div>
						
						<div class="form-group col-md-5">
							<select name="loc" class="custom-select" id="inlineFormCustomSelectPref">
							<option selected value="lo">Choose..</option>
							<option calue="Pune">Pune</option>
							<option calue="Pune">Pune</option>
							<option calue="Pune">Pune</option>
							<option calue="Pune">Pune</option>
							</select>
						</div>
						
						<div class="form-group col-md-5">
							<select name="cat" class="custom-select" id="inlineFormCustomSelectPref">
							<option selected value="ca">Choose..</option>
							<option calue="IT">IT</option>
							<option calue="Pune">Pune</option>
							<option calue="Pune">Pune</option>
							<option calue="Pune">Pune</option>
							</select>
						</div>
						<button class="btn btn-success">Submit</button>
					</form>
				</div>
			
			</div>
			
			<% 
 			Add_Job_Dao add=new Add_Job_Dao(DatabaseConnection.getConn());
			List<Jobs> list1=add.getalljob();
			
			for(Jobs j:list1){
			%>
		      <div class="card mt-2">			
			    <div class="card-body">
				<div class="text-center text-primary">
				<i class="far fa-clipboard fa-2x"></i>
				</div>
				
			<h6><%=j.getTitle() %></h6>
			
			
			<%
			if(j.getDescription().length() > 0 && j.getDescription().length() < 120){
			%>
			
			<p><%=j.getDescription() %>.</p>
			
			<%
			}else{
			%>
			<p><%=j.getDescription().substring(0, 120) %>...</p>
			<%
			}
			%>
			
			<br>
			<div class="form-row">
				<div class="form-group col-md-3">
					<input type="text" class="form-control form-control-sm" value="Location:<%=j.getLocation() %>" readonly >
				</div>
				
				<div class="form-group col-md-3">
					<input type="text" class="form-control form-control-sm" value="Category:<%=j.getCategory() %>" readonly >
				</div>
			</div>
			<h6>
			Publish Date:<%=j.getPdate() %>
			</h6>
			<div class="text-center">
			<a href="One_View.jsp?id=<%=j.getId() %>"
			  class="btn btn-sm bg-success text-white">View More</a>
			
			</div>
			
			</div>
			
			</div>
				
			<%
			}
			%>
			
		</div>
		
		
		</div>
	
	
	</div>

</body>
</html>