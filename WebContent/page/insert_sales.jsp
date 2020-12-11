<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3 style="text-align: center; ">판매등록</h3>

<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "sdh11", "1234");
%>

<script>
function submit_form() {
	if (document.input_form.saleno.value === "") {
		alert("비번호가 입력되지 않았습니다!");
		return;
	}
	if (document.input_form.pcode.value === "") {
		alert("상품코드가 입력되지 않았습니다!");
		return;
	}
	if (document.input_form.saledate.value === "") {
		alert("판매날짜가 입력되지 않았습니다!");
		return;
	}
	if (document.input_form.scode.value === "") {
		alert("매장코드가 입력되지 않았습니다!");
		return;
	}
	if (document.input_form.amount.value === "") {
		alert("판매수량이 입력되지 않았습니다!");
		return;
	}
	alert("매출전표가 정상적으로 등록되었습니다!");
	document.input_form.submit();
}
function reset_form() {
	alert("정보를 지우고 처음부터 다시 입력합니다.");
	document.input_form.reset();
}
</script>
<h3>매출전표등록</h3>
<form action="action/registry_sales.jsp" method="post" name="input_form">
	<table border="1">
		<tr>
			<td>비번호</td>
			<td><input type="number" name="saleno"></td>
		</tr>
		<tr>
			<td>상품코드</td>
			<td><input type="text" name="pcode"></td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td><input type="date" name="saledate"></td>
		</tr>
		<tr>
			<td>매장코드</td>
			<td><input type="text" name="scode"></td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="number" name="amount"></td>
		</tr>
		<tr>
			<td>
				<input type="button" onclick="submit_form()" value="등록">
				<input type="button" onclick="submit_form()" value="다시쓰기">
			</td>
		</tr>
	</table>
</form>
<%
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>