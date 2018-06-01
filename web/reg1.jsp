<%-- 
    Document   : reg1
    Created on : Jun 6, 2017, 1:27:07 AM
    Author     : welcome
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %>
 <%@page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Check Page</title>
          <style>
      body {
        background-image: url("images.jpeg");
        background-color: #cccccc;
	background-repeat:no-repeat;
	background-attachment:scroll;
	background-position:center top;
           }
  .button {
  display: inline-block;
  border-radius: 4px;
  background-color:blue;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 14px;
  padding: 10px;
  width: 100px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 3px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
</style>
    </head>
    <body>
        
        <% 
          String userid=request.getParameter("usr");
           session.putValue("userid", userid);
         // String pwd=request.getParameter("pwd");
          
              
         Class.forName("com.mysql.jdbc.Driver");
         java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rajdb","root","pass1234");
        // con.setAutoCommit(false);
         Statement st=con.createStatement();
String sql="select * from user where username='"+userid+"'";
  // String sql2="select exists(select * from user where username='"+userid+"'""limit "'+1+"'")";
    ResultSet rs=st.executeQuery(sql);
//ResultSet rs=st.executeQuery("select * from users where userid='"+userid+"'");

 if (rs.next()) {
       
      // out.println("welcome " + userid);
        
      //  out.println("<a href='logout.jsp'>Log out</a>");
      out.println("User ID already available");
       out.println("Choose the another User ID ");
       %>
       <table border="0" align="center">
        <thead>
            <tr>
                <th>User Authentication Using Graphical Passwords</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>To login to the Web site first Enter User name</td>
            </tr>
            <tr>
                <td>
                    <form action="reg1.jsp">
                       UserName <input type="text" name="usr" placeholder="Enter UserName"/>
                       <input type="submit" value="Next"/><br/>
                      
                    </form>
                </td>
            </tr>
        </tbody>
    </table>
      <% 
    }
 else {
      HttpSession sess = request.getSession(); 
      sess.setAttribute("userid", userid);
      response.sendRedirect("reg_c19.jsp");
    }
    
   /*String s1=rs.getString(2);
   if(s1.equals(pwd))
    {
        out.println("Welcome Mr"+userid);
        out.println("You have Logged in Successfully");
        //out.println("User is "+rs.getString(1));
       // out.println("Password is "+rs.getString(2));
   }
  else
  {
   out.println("Login Failure");
  }
//st.close();
//con.close();

*/
%> 

        
  </body>
</html>
