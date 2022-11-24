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
<title>Insert title here</title>
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
			
				<%
				int id = Integer.parseInt(request.getParameter("id"));
				Add_Job_Dao add=new Add_Job_Dao(DatabaseConnection.getConn());
				Jobs j=add.getjobbyId(id);
				
				%>
				<div class="card mt-2">			
			    <div class="card-body">
				<div class="text-center text-primary">
				<i class="far fa-clipboard fa-2x"></i>
				</div>
				
				
				<h6><%=j.getTitle() %></h6>
			     <p><%=j.getDescription() %>.</p>
				<div class="form-row">
				<div class="form-group col-md-3">
					<input type="text" class="form-control form-control-sm" value="Location:<%=j.getLocation() %>" readonly >
				</div>
				
				<div class="form-group col-md-3">
					<input type="text" class="form-control form-control-sm" value="Category:<%=j.getCategory() %>" readonly >
				</div>
			</div>
			<h6>
			Publish Date:<%=j.getPdate().toString() %>
			</h6>
			
				
				</div>
				</div>
				
			</div>
		
		</div>
	
	</div>
	
	
	
	
</body>
</html>