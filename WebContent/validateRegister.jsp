<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.sql.*" %>
	<jsp:useBean id="userInfo"
		scope="request"
		class="bean.userInfoBean">
		<jsp:setProperty name="userInfo" property="*" />
	</jsp:useBean>
	<c:choose>
		<c:when test="${userInfo.getValid()}">
			<sql:query var="userDbInfo">
				SELECT * FROM userInfo WHERE email = ?
				<sql:param value="${userInfo.getEmail()}"/>	 
			</sql:query>
			<c:choose>
				<c:when test="${userDbInfo.rowCount == 0}">
					<sql:update>
						INSERT INTO userInfo (email,userName,gender,dob,age,password,lookingFor,cityPincode) VALUES (?,?,?,?,?,?,?,?)
						<sql:param value="${userInfo.getEmail()}"></sql:param>
						<sql:param value="${userInfo.getUserName()}"></sql:param>
						<sql:param value="${userInfo.getGender()}"></sql:param>
						<sql:param value="${userInfo.getDate()}"></sql:param>
						<sql:param value="${userInfo.getAge()}"></sql:param>
						<sql:param value="${userInfo.getPassword()}"></sql:param>
						<sql:param value="${userInfo.getLookingFor()}"></sql:param>
						<sql:param value="${userInfo.getCityPincode()}"></sql:param>
					</sql:update>
					<c:set var = "loggedUser" scope = "request" value = "${userInfo.getEmail()}"/>
					<c:set var = "num" scope = "session" value = "1"/>
					<c:set var = "numRow" scope = "session" value = ""/>
					<c:set var = "filterForm" scope = "session" value = "1"/>
					<c:set var = "filterFormLocation" scope = "session" value = ""/>
					<c:set var = "filterFormName" scope = "session" value = ""/>
					<c:set var = "filterFormMinAge" scope = "session" value = ""/>
					<c:set var = "filterFormMaxAge" scope = "session" value = ""/>
					<jsp:forward page="userHome.jsp" />
				</c:when>
				<c:otherwise>
					<form action="index.jsp#include" >
						<input type="submit" id='btnSignIn' style="display: none;"/>
					</form>
					<script type="text/javascript">
						document.getElementById('btnSignIn').click();
					</script>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<form action="index.jsp#includeRegister" >
						<input type="submit" id='btnSignIn' style="display: none;"/>
					</form>
					<script type="text/javascript">
						document.getElementById('btnSignIn').click();
			
			</script>
		</c:otherwise>
	</c:choose>	
	
	