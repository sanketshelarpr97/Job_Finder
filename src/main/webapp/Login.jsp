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
<jsp:include page="All_Component/Navbar.jsp"></jsp:include>

	<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<div class="text-center">
					<i class="fa-solid fa-user-plus"></i>
					<h5>Login </h5>
					</div>
					
					<c:if test="${not empty message }">
			<div class="alert alert-success" role="alert">${message }</div>
			<c:remove var="message"/>
			</c:if>
					
					<form action="LoginServlet" method="post">
							
								<div class="form-group ">
									<label for="exampleInputEmail1">Enter Email </label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email" name="uemail">
									
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password" name="upass" >
								</div>
								
								
								<button type="submit" class="btn btn-primary bodge-pill btn-block">Login</button>
						

						</form>
					
					
					</div>
				</div>
			</div>
			
		</div>
	
	</div>
</body>
</html>