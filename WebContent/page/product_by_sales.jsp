<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.text.DecimalFormat" %>


<!DOCTYPE html>
<html>
<body>
<h3>지점별 매출 현황</h3>
<table border=1>
	<tr>
		<td>상품 코드</td>
		<td>상품 명</td>
		<td>상품별 판매액</td>
	</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "sdh11", "1234");
		
		Statement stmt = conn.createStatement();
		String query = "SELECT PRODUCT.PCODE, PRODUCT.NAME, SUM(SALE.AMOUNT * PRODUCT.COST) total "+
					   "FROM TBL_SHOP_01 SHOP, tbl_salelist_01 SALE, TBL_PRODUCT PRODUCT "+
					   "WHERE SALE.SCODE = SHOP.SCODE AND SALE.PCODE = PRODUCT.PCODE "+
					   "GROUP BY PRODUCT.PCODE, PRODUCT.NAME "+
					   "ORDER BY PRODUCT.PCODE ASC";
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
