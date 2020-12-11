<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.text.DecimalFormat" %>


<!DOCTYPE html>
<html>
<body>
<h3>판매현항</h3>
<table border=1>
	<tr>
		<td>비번호</td>
		<td>상점코드</td>
		<td>판매날짜</td>
		<td>매장코드</td>
		<td>상품명</td>
		<td>판매수량</td>
		<td>총판매액</td>
	</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "sdh11", "1234");
		
		Statement stmt = conn.createStatement();
		String query = "select SALELIST.SALENO, PRODUCT.PCODE, SALELIST.SALEDATE, SHOP.SCODE, PRODUCT.NAME, SALELIST.AMOUNT, PRODUCT.COST * SALELIST.AMOUNT as TOTAL_COST "+
						"FROM TBL_SALELIST_01 SALELIST, TBL_SHOP_01 SHOP, TBL_PRODUCT PRODUCT "+
						"WHERE SALELIST.SCODE = SHOP.SCODE AND SALELIST.PCODE = PRODUCT.PCODE "+
						"ORDER BY SALELIST.SALENO";
		ResultSet rs = stmt.executeQuery(query);
		%>
		<%
		DecimalFormat df = new DecimalFormat("#,###");
		while (rs.next()) {
			%>
					<tr>
						<td><%= rs.getInt(1)%></td>
						<td><%= rs.getString(2)%></td>
						<td><%= rs.getString(3)%></td>
						<td><%= rs.getString(4)%></td>
						<td><%= rs.getString(5)%></td>
						<td><%= rs.getInt(6)%></td>
						<td><%= df.format(rs.getInt(7)) %></td>
					</tr>
			<%
		}
		%>
		<%
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>
</body>
</html>
