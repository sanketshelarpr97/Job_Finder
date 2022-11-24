
<%@page import="com.DB.DatabaseConnection" %>
<%@page import="java.sql.Connection" %>
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
	background:url("img/1.jpg");
	width:100%;
	height:85vh;
	background-repeat:no-repeat;
	background-size:cover;
	

</style>

</head>
<body>


<jsp:include page="All_Component/Navbar.jsp"></jsp:include>

	<div class="container-fluid back-img">
	<div class="text-center">
	
	<h1 class="text-black p-4">
		<i class="fa-solid fa-book"></i>Online Job portal
	</h1>
	</div>	
	</div>

<jsp:include page="All_Component/Footer.jsp"></jsp:include>
</body>
</html>