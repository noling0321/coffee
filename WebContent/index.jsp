<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/css.css">
<%
	String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>
</head>
<body>
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	
	<%
		switch(section){
		case "insert_sales":
			%><%@ include file="page/insert_sales.jsp" %><% 
			break;
		case "total_sales":
			%><%@ include file="page/total_sales.jsp" %><% 
			break;
		case "shop_by_sales":
			%><%@ include file="page/shop_by_sales.jsp" %><% 
			break;
		case "product_by_sales":
			%><%@ include file="page/product_by_sales.jsp" %><% 
			break;
		default:
			%><%@ include file="static/index.jsp" %><% 
		}
	%>
	
	<%@ include file="static/footer.jsp" %>
</body>
</html>