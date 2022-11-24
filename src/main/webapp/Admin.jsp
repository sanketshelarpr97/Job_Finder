
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="All_Component/Css.jsp"></jsp:include>
<style type="text/css">
.back-img{
	background:url("img/2.jpg");
	width:100%;
	height:91.5vh;
	background-repeat:no-repeat;
	background-size:cover;

</style>

	


</head>
<body>
<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="Login.jsp"></c:redirect>
</c:if>

<jsp:include page="All_Component/Navbar.jsp"></jsp:include>

<div class="container-fluid back-img">
	<div class="text-center">
	
	<h1 class="text-black p-4">
		Welcome Admin
	</h1>
	</div>	
	</div>
</body>
</html>