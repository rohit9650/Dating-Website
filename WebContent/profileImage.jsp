<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
		<c:when test="${empty loggedUser && empty param.form}">
			<jsp:forward page="error.jsp" />
		</c:when>
		<c:when test="${param.p == 2}">
				<sql:update>
					UPDATE userImage SET path = 'media/download.png' WHERE email = ?
					<sql:param value="${loggedUser}"></sql:param>
				</sql:update>
				
				<form action="userProfile.jsp?p=<%=session.getAttribute("loggedUser") %>" method="post">
								<input type="submit" id='btnSignIn' style="display: none;"/>
				</form>
				<script type="text/javascript">
								document.getElementById('btnSignIn').click();		
				</script>
		</c:when>
		<c:when test="${param.p == 1}">
				
				<% 
					
					
					 String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
					 String DB_URL = "jdbc:mysql://localhost/catchYourMatch";
					
					//  Database credentials
					 String USER = "root";
					 String PASS = "12345";
					
					 Connection conn = null;
					 Statement stmt = null;
					 PreparedStatement st = null;
					 ResultSet result = null;
					 try{
					    //STEP 2: Register JDBC driver
					    Class.forName("com.mysql.jdbc.Driver");
					
					    //STEP 3: Open a connection
					    conn = DriverManager.getConnection(DB_URL,USER,PASS);
					
					    //STEP 4: Execute a query
					    //
					 
					 	String userEmail =  session.getAttribute("loggedUser").toString();
					 
					 	String sql1 = "SELECT userName FROM userInfo where email= '"+ userEmail + "'";
					 	//st = conn.prepareStatement(sql1);
					 	stmt = conn.createStatement();
					    //stmt.setInt(1,lookingFor);
					    //out.println("<br/>test pin:"+pin);
					    result = stmt.executeQuery(sql1);
					 	result.next();
					 	String user = result.getString("userName");
					 	
					 	String s = "/home/rohit/Documents/eclipse_workspace/CatchYourMatch/WebContent/media/userImage/";
						MultipartRequest m =new MultipartRequest(request,s,20971520);
						Enumeration files = m.getFileNames();
						String name = m.getFilesystemName(files.nextElement().toString()) ;
						s = user.replaceAll("\\s+", "") + ".jpg";
						Path source = Paths.get("/home/rohit/Documents/eclipse_workspace/CatchYourMatch/WebContent/media/userImage/" + name);
						Files.move(source, source.resolveSibling(s));
						out.print("successfully uploaded ");
					 	
					 	
					 
					    String sql="update userImage set path='media/userImage/"
					    		+ user.replaceAll("\\s+", "") + ".jpg'" +" where email = '" + userEmail + "'";
					    
					    stmt.executeUpdate(sql);
					    
					    
					 }catch(Exception e){
						 out.print(e.toString());
					 }finally{
						 
					 } 
					
					%>
					
				
		</c:when>
		<c:otherwise>
		
				<form action="userProfile.jsp?p=<%=session.getAttribute("loggedUser") %>" method="post">
								<input type="submit" id='btnSignIn' style="display: none;"/>
				</form>
				<script type="text/javascript">
								document.getElementById('btnSignIn').click();		
				</script>
		</c:otherwise>
</c:choose>		
</body>
</html>