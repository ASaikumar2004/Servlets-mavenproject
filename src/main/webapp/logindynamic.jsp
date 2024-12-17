<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="bootstrap.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<form>
		<%
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/swiggy", "root", "root");
			String sql = "select * from login where email=? and password=?";
			PreparedStatement pmst = conn.prepareStatement(sql);
			pmst.setString(1, "email");
			pmst.setString(2, "password");
			ResultSet rs = pmst.executeQuery();
			while (rs.next()) {
		%>
		<input type="email" name="email" placeholder="enter email"><br>
		<input type="password" name="password" placeholder="enter password"><br>
		<button type=submit>Submit</button>


		<%
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</form>

</body>
</html>