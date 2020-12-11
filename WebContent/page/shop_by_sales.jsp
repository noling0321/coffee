<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.text.DecimalFormat" %>


<!DOCTYPE html>
<html>
<body>
<h3>매장별 판매액</h3>
<table border=1>
	<tr>
		<td>매장코드</td>
		<td>매장명</td>
		<td>매장별 판매액</td>
	</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "sdh11", "1234");
		
		Statement stmt = conn.createStatement();
		String query = "SELECT SHOP.SCODE, SHOP.SNAME, SUM(SALE.AMOUNT * product.COST) total "+
					   "FROM TBL_SHOP_01 SHOP, tbl_salelist_01 SALE, TBL_product product "+
					   "WHERE SALE.SCODE = SHOP.SCODE AND SALE.PCODE = product.PCODE "+
					   "GROUP BY SHOP.SCODE, SHOP.SNAME "+
					   "ORDER BY SHOP.SCODE ASC";
		ResultSet rs = stmt.executeQuery(query);
		%>
		<%
		DecimalFormat df2 = new DecimalFormat("#,###");
		while (rs.next()) {
			%>
					<tr>
						<td><%= rs.getString(1)%></td>
						<td><%= rs.getString(2)%></td>
						<td><%= df2.format(rs.getInt(3)) %></td>
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
