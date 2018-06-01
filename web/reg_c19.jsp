<%-- 
    Document   : reg_c19
    Created on : Jun 7, 2017, 2:32:43 AM
    Author     : welcome
--%>
<%@page import="java.security.MessageDigest"%>

<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%!
    public ArrayList generateRandomNumber(int start, int end ){
    // int c=0;
     ArrayList numbers = new ArrayList();
      for(int i = 0; i<end-start; i++)
      {
         numbers.add(i+1);
        
       }
        //Random random = new Random();
        Collections.shuffle(numbers);
        return numbers;
}

  public String getHash(String path) throws IOException, Exception
{
        String s="";
        try
       {
        File in = new File(path);
        BufferedImage buffImg = ImageIO.read(in);
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ImageIO.write(buffImg, "png", outputStream);
        byte[] data = outputStream.toByteArray();

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(data);
        byte[] hash = md.digest();
        s=returnHex(hash);
        //out.print("<h3>hash value is</h3>"+s);
        
        
       }catch(FileNotFoundException e1)
         {
         // out.println("File not Found");
             }
        return s;
}
static String returnHex(byte[] inBytes) throws Exception {
        String hexString = null;
        for (int i=0; i < inBytes.length; i++) { //for loop ID:1
            hexString +=
            Integer.toString( ( inBytes[i] & 0xff ) + 0x100, 16).substring( 1 );
        }                                   // Belongs to for loop ID:1
    return hexString;
  }        

%>
<!DOCTYPE html>
<html>
<head>
<style>
.rcorners1 {
    border-radius: 50px;
    background: #73A321;
    padding: 10px; 
    width: 30px;
    height: 30px;    
}

#rcorners2 {
    border-radius: 50px;
    border: 2px solid #73AD21;
    padding: 10px; 
    width: 20px;
    height: 20px;    
}

#rcorners3 {
    border-radius: 50px;
    background: url(paper.gif);
    background-position: left top;
    background-repeat: repeat;
    padding: 10px; 
    width: 20px;
    height: 20px;    
}
img {
    border-radius: 50%;
    height:50px;
    width:50px;
    }
body {
    background-image: url("images.jpg");
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
<script language="javascript"> 
 var rate_value="";
 var hasher="";
 var count=0;
 var pwd="";
 var x=""; var y="";
 var z="";
 var w="";
function allowDrop(ev) {
    ev.preventDefault();
}

//function drag(ev) {
 //   ev.dataTransfer.setData("text", ev.target.id);
   // alert(x);
//}

function drop_p1(ev) {
   // ev.preventDefault();
  //  var data = ev.dataTransfer.getData("text");
    //var s1=document.getElementById(p1).value;
   // var s=document.getElementById(p1).setData(data);
    var x = document.getElementById("p1").value; 
    window.alert(x);
   // ev.target.appendChild(document.getElementById(data));
}
function drop_p2(ev) {
   // ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    var s2=getHash(data);
    var p2=document.getElementById("p2").setData(s2);
    //var s2=document.getElementById(p2).setData(data);
      pwd+=p2;
      out.print("<h3> password is</h3>"+pwd);
 //  ev.target.appendChild(document.getElementById(data));
}
function drop_p3(ev) {
   // ev.preventDefault();
  //  var data = ev.dataTransfer.getData("text");
   var z=document.getElementById("p3").value;
  //  var s3=document.getElementById(p3).setData(data);
   window.alert(z);
    //ev.target.appendChild(document.getElementById(data));
}
function drop_p4(ev) {
   // ev.preventDefault();
  //  var data = ev.dataTransfer.getData("text");
   var w=document.getElementById("p4").value; 
 //   var s4=document.getElementById(p4).setData(data);
    window.alert(w);
    //ev.target.appendChild(document.getElementById(data));
}


function var generate_pwd()
{
    if(document.getElementById('r1').checked){
        var pwd+=x;
    }
    else if(document.getElementById('r2').checked){
        var pwd+=y;
    }
    else if(document.getElementById('r3').checked){
        var pwd+=z;
    }
    else if(document.getElementById('r4').checked){
        var pwd+=w;
    }
    
   return pwd;
 
  //  window.alert(pwd);
}
    </script>
</head>
<body>
    <form action="userregister.jsp" method="post" onsubmit="generate_pwd()">
    <div align="center">
<h1>User Authentication Using Graphical Passwords  </h1>

  
    <%
       HttpSession sess = request.getSession(false);
       String user = (String)(sess.getAttribute("userid"));
       //sess.getAttribute("userid");
       String pwd1=request.getParameter("pwd");
       HttpSession sess2 = request.getSession(); 
       sess2.setAttribute("userid", user);
       sess2.setAttribute("password",pwd1);
       %>
       
        <h2> Hello,<%= sess.getAttribute("userid")%></h2>
   <p>Select  images by Drag and Drop <br />
Method and Select and Rearrange Images, <br />
Click on Next to get set of Images <br />
and finally submit the Password Using CheckBox</p> 
    </div>
<div align="center">
<div style="position:fixed;left:450px ">
    <input type="checkbox" id="r1" /><input type="password" class="rcorners1" id="p1" ondrop="drop_p1(ev)" ondragover="allowDrop(event)" name="corner1" /></div>
<div style=" position:fixed ;right:400px" />
<input type="checkbox" id="r2"/><input type="password"  class="rcorners1" id="p2" ondrop="drop_p2(ev)" ondragover="allowDrop(event)" name="corner2"/>
</div>
</div>
<div align="center"/>
<%
     int n=0;
    //PrintWriter pw=new PrintWriter();
         ArrayList loopEnd1 = generateRandomNumber(0,50);
         out.print("<pre>");

      for(int i=3; i<=5; i++) {
       for (int k=1; k<=i; k++) {


 //    document.write(imgArray[c]);
  //   c++;
  out.print("<img draggable='true' ondragover='allowDrop(event)' align='center' " + "src='images/" +loopEnd1.get(n)+ ".png'>");
//document.write("<img align='center' "+"src='images/'"+i+"'.png'"+"height='40px' width='40px'/>");
//count++;
//document.write("*");
n++;
}

out.print("<br>");
}

//document.write("<br>");
 //int n1=13;
//ArrayList loopEnd2 = generateRandomNumber(40,70);

for(int i=4; i>=3; i--){
 
for(int k=i; k>=1; k--) {
   // count++;
  
//document.write("<img align='center' "+"src='images/'"+i+"'.png'""/>");
out.print("<img draggable='true' ondragover='allowDrop(event)' align='center' " + "src='images/" +loopEnd1.get(n)+ ".png'>");
//document.write(imgArray[c].src);
n++;
//document.write("*");
}
 out.print("<br>");

}
out.print("</pre>");



%>
    </div>
   
 
    <div style="position:fixed;left:450px "><input type="checkbox" id="r3" /><input type="password" class="rcorners1" id="p3" ondrop="drop_p3(ev)" ondragover="allowDrop(event)" name="corner3"/></div>
<div style="position:fixed;right:400px ">
<input type="checkbox" id="r4"/> <input type="password" class="rcorners1" id="p4" ondrop="drop_p4(ev)" ondragover="allowDrop(event)" name="corner4"/> 

</div>
<div align="center">
<button class="button" type="reset" style="vertical-align:middle"> <span>ReSetFields</span> </button>
<button class="button" style="vertical-align:middle"> <span>Next</span> </button>
<button class="button" type="submit" style="vertical-align:middle" onsubmit="function generate_pwd()"> <span>Submit</span> </button>
</div>
    </form>
</body>

</html>


