<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.sql.*" %>
	<sql:query var="userLoginInfo">
			SELECT password FROM userInfo WHERE email = ? && password = ?
			<sql:param value="${param.email}"/>	 
			<sql:param value="${param.password}"/>
	</sql:query>
	<c:choose>
		<c:when test="${userLoginInfo.rowCount !=0}">
			<c:set var = "loggedUser" scope = "session" value = "${param.email}"/>
			<c:set var = "viewProfile" scope="session" value="${param.email}"/>
			<c:set var = "num" scope = "session" value = "1"/>
			<c:set var = "numRow" scope = "session" value = ""/>
			<c:set var = "filterForm" scope = "session" value = "1"/>
			<c:set var = "filterFormLocation" scope = "session" value = ""/>
			<c:set var = "filterFormName" scope = "session" value = ""/>
			<c:set var = "filterFormMinAge" scope = "session" value = ""/>
			<c:set var = "filterFormMaxAge" scope = "session" value = ""/>
		   	<jsp:forward page="userHome.jsp"></jsp:forward>
		</c:when>	
		<c:otherwise>
			<form action="index.jsp#includeLogin" >
				<input type="submit" id='btnSignIn' style="display: none;"/>
			</form>
			<script type="text/javascript">
				document.getElementById('btnSignIn').click();
			</script>
			
		</c:otherwise>
	</c:choose>




			
