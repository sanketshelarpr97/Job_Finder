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
<body style="background-color:#f7f7f7">

<c:if test="${empty userobj }">
	<c:redirect url="Login.jsp"></c:redirect>
	</c:if>
<jsp:include page="All_Component/Navbar.jsp"></jsp:include>

<div class="container-fluid">
	<div class="row p-4">
		<div class="col-md-4 offset-md-4">
			<div class="card">
			<div class="card-body">
					<div class="text-center">
						<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
						<h5>Edit Profile</h5>
					</div>
			
				<form action="Update_profile_Servlet" method="post">
					<input type="hidden" name="id" value="${userobj.id }">
					
					<div class="form-group">
						<label>Enter Full Name</label> 
						<input type="text" requird="required" class="form-control" 
						id="exampleInputEmail1" aria-describedby="emailHelp"
						name="name" value="${userobj.name }">
					</div>
					
					<div class="form-group">
						<label>Enter Qulification </label> 
						<input type="text" requird="required" class="form-control" 
						id="exampleInputEmail1" aria-describedby="emailHelp"
						name="qua" value="${userobj.qulification}">
					</div>
					
					<div class="form-group">
						<label>Enter Email</label> 
						<input type="text" requird="required" class="form-control" 
						id="exampleInputEmail1" aria-describedby="emailHelp"
						name="email" value="${userobj.email }">
					</div>
					
					<div class="form-group">
						<label>Enter Password</label> 
						<input type="text" requird="required" class="form-control" 
						id="exampleInputEmail1" aria-describedby="emailHelp"
						name="pass" value="${userobj.password }">
					</div>
				
				<button type="submit" 
							class="btn btn-primary btn-lg btn-block">Update</button>
				</form>
			
			</div>			
			</div>
		
		
		</div>	
	</div>


</div>

</body>
</html>