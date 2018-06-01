<%-- 
    Document   : userregister
    Created on : Jun 7, 2017, 1:54:15 AM
    Author     : welcome
--%>
<%-- 
    Document   : imgreg
    Created on : May 30, 2017, 12:07:19 AM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import ="java.sql.*" %>
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title></title>
 </head>
 <body>
 <center> <H6 style="color:black;font-family:Arial;font-size:100px" >
HASP</H3> </center>
 <%
        Connection con = null;
        HttpSession sess2 = request.getSession(false); 
        String name = (String)(sess2.getAttribute("user"));
        String pass = (String)(sess2.getAttribute("password"));
 //String name = request.getParameter("username");
// String pass = request.getParameter("password");
 //String mob = request.getParameter("mobile");

 try {
 Class.forName("com.mysql.jdbc.Driver").newInstance ();
 con =DriverManager.getConnection("jdbc:mysql://localhost:3306/rajdb","root","pass1234");
 String qt = "insert into user(username,password)values('"+name+"','"+pass+"')";
 PreparedStatement stmt = con.prepareStatement(qt);
 int pos = stmt.executeUpdate();
 System.out.println(pos);
 stmt.close();

 con.close();
 } catch (Exception e) {
out.println(e); }
 out.println("successfully registered");

%>
 </body>
</html>

