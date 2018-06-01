<%-- 
    Document   : userlogin
    Created on : Jun 7, 2017, 1:53:47 AM
    Author     : welcome
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
    <body bgcolor="grey"font-color="white">
<%@ page import ="java.sql.*" %>
<%
    try{
        HttpSession sess2 = request.getSession(false); 
        String username = (String)(sess2.getAttribute("user"));
        String password = (String)(sess2.getAttribute("password"));
        //sess2.getAttribute("userid", userid);
     //   String username = request.getParameter("usr");   
      //  String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rajdb","root","pass1234");    
        PreparedStatement pst = conn.prepareStatement("Select username,password from user where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())           
           out.println("you're logged in successfully");               
        else
           out.println("Invalid login credentials");            
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>

    </body>
</html>
