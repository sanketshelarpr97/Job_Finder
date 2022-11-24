<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<div class="container p-2">
	<div class="col-md-10 offset-md-1">
		<div class="card">
			<div class="card-body">
			<div class="text-center text-success">
			
			<c:if test="${not empty message }">
			<div class="alert alert-success" role="alert">${message}</div>
			<c:remove var="message"/>
			</c:if>
			
				<h5>Add Jobs</h5>
			</div>
			<form action="Add_job_Servlet" method="post">
				<div class="form-group">
				<label>Enter Title</label>
				<input type="text" required class="form-control" name="title">
				</div>
				
				<div class="form-row">
					<div class="form-group col-md-4">
					<label>Location</label>
					<select name="Location" class="custom-select" id="inputGroupSelect02">
    						<option selected>Choose...</option>
						    <option value="Pune">Pune</option>
						    <option value="Mumbai">Mumbai</option>
						    <option value="Banglore">Banglore</option>
						    <option value="Chennai">Chennai</option>
						    <option value="Ahmadabad">Ahmadabad</option>
						    <option value="Hydrabad">Hydrabad</option>
						    <option value="Nashik">Nashik</option>
						    
						  </select>
					</div>
					
					<div class="form-group col-md-4">
					<label>Category</label>
					<select name="category" class="custom-select" id="inputGroupSelect02">
    						<option selected>Choose...</option>
						    <option value="IT">IT</option>
						    <option value="Mechanical">Mechanical</option>
						    <option value="Non-Technical">Non-Technical</option>
						    <option value="Educational">Educational</option>
						    <option value="Medical-field">Medical-field</option>
						  </select>
					</div>
					
					<div class="form-group col-md-4">
					<label>Status</label>
					<select name="Status" class="custom-select" >
						    <option class="Active" value="1">Active</option>
						    <option class="Inactive" value="2">Inactive</option>
						    
						  </select>
					</div>
				</div>
		
				<div class="form-group">
					<label>Enter Description</label>
					<textarea reequired rows="6" cols="" name="desc" class="form-control"></textarea>
				</div>
				<button  class="btn btn-success">Publish Job</button>
			</form>
			</div>
		</div>
	</div>
	
	
	</div>
</body>
</html>