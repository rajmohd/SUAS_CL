<%-- 
    Document   : Reset
    Created on : Jun 6, 2017, 2:16:50 AM
    Author     : welcome
--%>

<%-- 
    Document   : reg
    Created on : May 22, 2017, 3:32:02 PM
    Author     : welcome
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                    <form action="Reset1.jsp">
                       UserName <input type="text" name="usr" placeholder="Enter UserName"/>
                       <input type="submit" value="Next"/><br/>
                      
                    </form>
                </td>
            </tr>
        </tbody>
    </table>
        
    </body>
</html>

