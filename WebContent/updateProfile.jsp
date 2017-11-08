<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.sql.*" %>
    
<% 		
				String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
				String DB_URL = "jdbc:mysql://localhost/catchYourMatch";
				
				// Database credentials
				String USER = "root";
				String PASS = "12345";
				
				Connection conn = null;
				PreparedStatement stmt = null;
				Statement st = null;
				ResultSet result=null;
				try{
				   //STEP 2: Register JDBC driver
				   Class.forName("com.mysql.jdbc.Driver");
				   //STEP 3: Open a connection
				   	conn = DriverManager.getConnection(DB_URL,USER,PASS);
				   //STEP 4: Execute a query
					
				}catch(Exception e){
					 out.print(e.toString());
				}finally{
					 
				}
				
%>    
    
<c:choose>
		<c:when test="${empty loggedUser && empty param.form}">
			<jsp:forward page="error.jsp" />
		</c:when>
		<c:when test="${param.form == 1}">
			<c:if test="${not empty param.userName}">
				<sql:update>
					UPDATE userInfo SET userName = ? WHERE email = ?
					<sql:param value="${param.userName}"></sql:param>
					<sql:param value="${loggedUser}"></sql:param>
				</sql:update>
			</c:if>
			<c:if test="${not empty param.cityPincode}">
				<sql:update>
					UPDATE userInfo SET cityPincode = ? WHERE email = ?
					<sql:param value="${param.cityPincode}"></sql:param>
					<sql:param value="${loggedUser}"></sql:param>
				</sql:update>
			</c:if>
			<c:if test="${not empty param.lookingFor}">
				<sql:update>
					UPDATE userInfo SET lookingFor = ? WHERE email = ?
					<sql:param value="${param.lookingFor}"></sql:param>
					<sql:param value="${loggedUser}"></sql:param>
				</sql:update>
			</c:if>
			<c:if test="${not empty param.DOBDay and not empty param.DOBMonth and not empty DOBYear }">
				<%  String date = request.getParameter("DOBYear")+"-"+request.getParameter("DOBMonth")+"-"+request.getParameter("DOBDay"); 
					pageContext.setAttribute("DOB", date);
				%>
				<sql:update>
					UPDATE userInfo SET dob = ? WHERE email = ?
					<sql:param value="${DOB}" />
					<sql:param value="${loggedUser}" />
				</sql:update>
			</c:if>
			
				<form action="userProfile.jsp?p=<%=session.getAttribute("loggedUser") %>" method="post">
								<input type="submit" id='btnSignIn' style="display: none;"/>
				</form>
					<script type="text/javascript">
								document.getElementById('btnSignIn').click();		
				</script>
				
		</c:when>
		
		<c:when test="${param.form == 2}">
			<c:if test="${not empty param.about}">
				<sql:query var="isProfileThere">
					SELECT email from userDetails WHERE email = ?
					<sql:param value="${loggedUser}"></sql:param>
				</sql:query>
				<c:choose>
					<c:when test="${isProfileThere.rowCount == 0}">
						<sql:update >
							INSERT into userDetails (email) VALUES (?)
							<sql:param value="${loggedUser}"></sql:param>
						</sql:update>
						<sql:update>
							UPDATE userDetails SET about = ? WHERE email = ?
							<sql:param value="${param.about}"></sql:param>
							<sql:param value="${loggedUser}"></sql:param>
						</sql:update>
					</c:when>
					<c:otherwise>
						<sql:update>
							UPDATE userDetails SET about = ? WHERE email = ?
							<sql:param value="${param.about}"></sql:param>
							<sql:param value="${loggedUser}"></sql:param>
						</sql:update>
					</c:otherwise>	
				</c:choose>	
			</c:if>
				<form action="userProfile.jsp?p=<%=session.getAttribute("loggedUser") %>" method="post">
								<input type="submit" id='btnSignIn' style="display: none;"/>
				</form>
				<script type="text/javascript">
								document.getElementById('btnSignIn').click();		
				</script>
		</c:when>
		
		
		<c:when test="${param.form == 3}">
			<sql:query var="isProfileThere">
				SELECT email from userDetails WHERE email = ?
				<sql:param value="${loggedUser}"></sql:param>
			</sql:query>
			
			<c:if test="${(isProfileThere.rowCount == 0) && (not empty param.orientation || not empty param.education || not empty param.height || not empty param.status || not empty param.build || not empty param.facialHair || not empty param.workStatus || not empty param.weight || not empty param.glasses)} ">
				<sql:update >
					INSERT into userDetails (email) VALUES (?)
					<sql:param value="${loggedUser}"></sql:param>
				</sql:update>
			</c:if>		
				
				<c:if test="${not empty param.orientation}">
					<sql:update>
						UPDATE userDetails SET orientation = ? WHERE email = ?
						<sql:param value="${param.orientation}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.education}">
					<sql:update>
						UPDATE userDetails SET education = ? WHERE email = ?
						<sql:param value="${param.education}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.height}">
					<sql:update>
						UPDATE userDetails SET height = ? WHERE email = ?
						<sql:param value="${param.height}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.status}">
					<sql:update>
						UPDATE userDetails SET status = ? WHERE email = ?
						<sql:param value="${param.status}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.build}">
					<sql:update>
						UPDATE userDetails SET build = ? WHERE email = ?
						<sql:param value="${param.build}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.facialHair}">
					<sql:update>
						UPDATE userDetails SET facialHair = ? WHERE email = ?
						<sql:param value="${param.facialHair}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.workStatus}">
					<sql:update>
						UPDATE userDetails SET workStatus = ? WHERE email = ?
						<sql:param value="${param.workStatus}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.weight}">
					<sql:update>
						UPDATE userDetails SET weight = ? WHERE email = ?
						<sql:param value="${param.weight}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.glasses}">
					<sql:update>
						UPDATE userDetails SET glasses = ? WHERE email = ?
						<sql:param value="${param.glasses}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
					
					<form action="userProfile.jsp?p=<%=session.getAttribute("loggedUser") %>" method="post">
								<input type="submit" id='btnSignIn' style="display: none;"/>
					</form>
					<script type="text/javascript">
									document.getElementById('btnSignIn').click();		
					</script>
		</c:when>
		
		
		
		<c:when test="${param.form == 4}">
		
				<sql:query var="isProfileThere">
					SELECT email from userPersonality WHERE email = ?
					<sql:param value="${loggedUser}"></sql:param>
				</sql:query>
				
				<c:if test="${(isProfileThere.rowCount == 0) && (not empty param.myBondLevel || not empty param.myFreedomLevel || not empty param.myExtrovert || not empty param.myAdventure || not empty param.myReligious)}">
					<sql:update >
						INSERT into userPersonality (email) VALUES (?)
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.myBondLevel}">
					<sql:update>
						UPDATE userPersonality SET myBondLevel = ? WHERE email = ?
						<sql:param value="${param.myBondLevel}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.myFreedomLevel}">
					<sql:update>
						UPDATE userPersonality SET myFreedomLevel = ? WHERE email = ?
						<sql:param value="${param.myFreedomLevel}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.myExtrovert}">
					<sql:update>
						UPDATE userPersonality SET myExtrovert = ? WHERE email = ?
						<sql:param value="${param.myExtrovert}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.myAdventure}">
					<sql:update>
						UPDATE userPersonality SET myAdventure = ? WHERE email = ?
						<sql:param value="${param.myAdventure}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.myReligious}">
					<sql:update>
						UPDATE userPersonality SET myReligious = ? WHERE email = ?
						<sql:param value="${param.myReligious}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
					<form action="userProfile.jsp?p=<%=session.getAttribute("loggedUser") %>">
						<input type="submit" id='btnSignIn' style="display: none;"/>
					</form>
					<script type="text/javascript">
						document.getElementById('btnSignIn').click();		
					</script>
					
		</c:when>
		
		
		<c:when test="${param.form == 5}">
				
				<sql:query var="isProfileThere">
					SELECT email from userPersonality WHERE email = ?
					<sql:param value="${loggedUser}"></sql:param>
				</sql:query>
				
				<c:if test="${(isProfileThere.rowCount == 0) && (not empty param.bondLevel || not empty param.freedomLevel || not empty param.extrovert || not empty param.adventure || not empty param.religious)}">
					<sql:update >
						INSERT into userPersonality (email) VALUES (?)
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.bondLevel}">
					<sql:update>
						UPDATE userPersonality SET bondLevel = ? WHERE email = ?
						<sql:param value="${param.bondLevel}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.freedomLevel}">
					<sql:update>
						UPDATE userPersonality SET freedomLevel = ? WHERE email = ?
						<sql:param value="${param.freedomLevel}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.extrovert}">
					<sql:update>
						UPDATE userPersonality SET extrovert = ? WHERE email = ?
						<sql:param value="${param.extrovert}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.adventure}">
					<sql:update>
						UPDATE userPersonality SET adventure = ? WHERE email = ?
						<sql:param value="${param.adventure}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
				<c:if test="${not empty param.religious}">
					<sql:update>
						UPDATE userPersonality SET religious = ? WHERE email = ?
						<sql:param value="${param.religious}"></sql:param>
						<sql:param value="${loggedUser}"></sql:param>
					</sql:update>
				</c:if>
				
					<form action="userProfile.jsp?p=<%=session.getAttribute("loggedUser") %>">
						<input type="submit" id='btnSignIn' style="display: none;"/>
					</form>
					<script type="text/javascript">
						document.getElementById('btnSignIn').click();		
					</script>
					
		</c:when>
				
				
				
		<c:otherwise>
			<form action="userProfile.jsp?p=<%=session.getAttribute("loggedUser") %>">
						<input type="submit" id='btnSignIn' style="display: none;"/>
					</form>
					<script type="text/javascript">
						document.getElementById('btnSignIn').click();		
			</script>
		</c:otherwise>
</c:choose>		    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>