<!--****************************************************************************
CSE532 -- Project 2
File name: query4.jsp
Author(s): Siddharth Jain (111425239)
           Shubham Kumar Jain (111482623)

Brief description: Query 4

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

<h3 align="center"><font><strong>Query 4</strong></font></h3>
<table align="center" cellpadding="7" cellspacing="1" border="1">

<tr>
<td><font size="3"><b>Company 1</b></font></td>
<td><font size="3"><b>Company 2</b></font></td>
</tr>

<%
try{ 

conn=ConnectionProvider.getCon();
if(conn!=null)
	System.out.println("Database established.");

String sql ="SELECT c1.name AS com1,c2.name AS com2 FROM company c1, company c2, unnest(c1.ind) AS i1, unnest(c2.ind) AS i2 WHERE c1.id != c2.id AND i1=i2 AND NOT EXISTS(SELECT * FROM person P2, unnest(c2.board) AS x, unnest(P2.owns) AS y WHERE x = P2.id AND y.shares >0 AND NOT EXISTS (SELECT * FROM person P1, unnest(c1.board) AS w, unnest(P1.owns) AS z WHERE w = P1.id AND z.cid=y.cid AND z.shares >= y.shares ) ) GROUP BY c1.name,c2.name;";
statement = conn.createStatement();
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<tr>
<td><%=resultSet.getString("com1") %></td>
<td><%=resultSet.getString("com2") %></td>
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