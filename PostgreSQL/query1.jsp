<!--****************************************************************************
CSE532 -- Project 2
File name: query1.jsp
Author(s): Siddharth Jain (111425239)
           Shubham Kumar Jain (111482623)

Brief description: Query 1

We, pledge our honor that all parts of this project were done by us alone and without 
collaboration with anybody else.
**************************************************************************** -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.woco.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WOCO Project</title>
</head>
<body>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.woco.*"%>

<%

Connection conn=null;
Statement statement=null;
ResultSet resultSet=null;

%>

<h3 align="center"><font><strong>Query 1</strong></font></h3>
<table align="center" cellpadding="7" cellspacing="1" border="1">

<tr>
<td><font size="3"><b>Company</b></font></td>
</tr>

<%
try{ 

conn=ConnectionProvider.getCon();
if(conn!=null)
	System.out.println("Database established.");

String sql ="SELECT C.name FROM company C, unnest(C.board) AS x, person P, unnest(P.owns) AS y WHERE x = P.id AND C.id=y.cid AND y.shares > 0 ORDER by C.name;";
statement = conn.createStatement();
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<tr>
<td><%=resultSet.getString("name") %></td>
</tr>

<% 
}
conn.close();

} catch (Exception e) {
e.printStackTrace();
System.out.println("Failed.");
}
%>
</table>
</body> 
</html>