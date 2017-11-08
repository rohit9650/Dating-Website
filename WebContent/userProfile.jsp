<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>	

<head class="no-js" lang="en">   
 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/profile/userProfile.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>   
    <title>Foundation | Welcome</title>
    <link rel="stylesheet" href="css/profile/foundationUserProfile.css" />
    <script src="javascript/vendor/modernizr.js"></script>
    <link rel="stylesheet" type="text/css" href="css/profile/picEffectUserProfile.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
    <script src="javascript/jquery-ui.js"></script>
	    <link rel="stylesheet" href="css/profile/UpdateProfile.css">
        <link rel="stylesheet" type="text/css" href="css/profile/editProfile.css">
</head>

<body>


<div class="header" id="header">
    
    <div class="logoh" id="logoh"><img src="media/logo1.png" style="margin-top: -75px"></div>
    <ul>
        <li><a id="links1" href="index.jsp" style="color: white;text-decoration: none;">HOME</a></li>
        <li><a id="links2" href="links.html#aboutUs" style="color: white;text-decoration: none;">ABOUT US</a></li>
        <li><a id="links3" href="links.html#aboutUs" style="color: white;text-decoration: none;">CONTACT</a></li>
        <li><a id="links4" href="#" style="color: white;text-decoration: none;">PROFILE</a></li>
    </ul>
    <div class="more" id="more"><i  id="more1" class="fa fa-align-left" aria-hidden="true"></i></div>
    <div class="more_container"id="more_container">
    	<div class="arrow-up" id="arrow-up"></div>  		
    	<div class="more_func"id="more_func">
    		<ul>
    			<li><a id="change" >Change</a></li><br/>
    			<li><a id="remove" href="profileImage.jsp?p=2">Remove</a></li><br/>
    			<li><a href="index.jsp">Log Out</a></li>
    		</ul>
    	</div>
    </div>
    <div class="profile_pic" id="profile_pic">
        <img src="media/download.png">
    </div>               
</div>


<div class="popup" id="popup">
<center>
	<form id="profileChange"  method=POST action="profileImage.jsp?p=1" enctype="multipart/form-data">
			<input type="file" name="fname" style="margin-top: 7px;margin-left: 47px;opacity: 1"/><br/>
			<input type="text" name="user" style="display:none"/><br/>
			<input type="hidden" name="email"/><br/>
			<input type="submit" name="submit" style=";border:none;width:100px;background:transparent;color:white;border: 1px solid white;"/>
		</form>
</center>
</div>


<script>
	$(document).ready(function(){
		$('#change').click(function(){
			$('#popup').css({opacity: 0.5});
		});
		
		$('#more1').click(function(){
			$('#more_container').toggle();
		});
	});
</script>



<c:choose>
		<c:when test="${empty loggedUser}">
			<jsp:forward page="error.jsp" />
		</c:when>
		<c:otherwise>
			<% request.getSession().setAttribute("viewProfile",request.getParameter("p") ); %>
			
			<sql:query var="viewProfileInfo">
				SELECT * FROM userInfo WHERE email = ?
				<sql:param value="${viewProfile}"></sql:param>
			</sql:query>
			
			<sql:query var="viewProfileImage">
				SELECT * FROM userImage WHERE email = ?
				<sql:param value="${viewProfile}"></sql:param>
			</sql:query>
			
			<sql:query var="viewProfileDetails">
				SELECT * FROM userDetails WHERE email = ?
				<sql:param value="${viewProfile}"></sql:param>
			</sql:query>
			
			
		</c:otherwise>
</c:choose>	

<div class="vd_content-section clearfix" style="padding-top: 6%">
        <div class="row">
            <div class="col-sm-3">
                <div class="panel widget light-widget panel-bd-top">
                  <div class="panel-heading no-title"> </div>
                  <div class="panel-body">
                    <div class="text-center vd_info-parent" > 
                    <img src="<c:forEach items="${viewProfileImage.rows}" var="row">
                     <c:choose>
                     	<c:when test="${empty row.path}">
                     		media/download.png
                     	</c:when>
                     	<c:otherwise>
                     		${fn:escapeXml(row.path)}
                     	</c:otherwise>
                     	
                     </c:choose>
                     	
                    </c:forEach>"  onerror="standby()" style="height:100%;width:100%;" />	 
                    </div>
                   
                    <h3 class="font-semibold mgbt-xs-5" align="center"><c:forEach items="${viewProfileInfo.rows}" var="row">${fn:escapeXml(row.userName)}</c:forEach> </h3>
                    	
                    <p align="center"><c:forEach items="${viewProfileDetails.rows}" var="row">${fn:escapeXml(row.about)}</c:forEach> </p>
                    <div class="mgtp-20">
                      <table class="table table-striped table-hover">
                        <tbody>
                          <tr>
                            <td style="width:60%;">Status</td>
                            <td><span class="label label-success">Active</span></td>
                          </tr>
                          <tr>
                            <td>User Rating</td>
                            <td><i class="fa fa-star vd_yellow fa-fw"></i><i class="fa fa-star vd_yellow fa-fw"></i><i class="fa fa-star vd_yellow fa-fw"></i><i class="fa fa-star vd_yellow fa-fw"></i><i class="fa fa-star vd_yellow fa-fw"></i></td>
                          </tr>
                          <tr>
                            <td>Member Since</td>
                            <td> Jan 07, 2014 </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
			
                <!-- panel widget -->
                
                
                <!-- panel widget --> 
            </div>
		
<div class="col-sm-9">
<div class="tabs widget">
 
<div class="tab-content">
<div id="profile-tab" class="tab-pane active">
	<div class="pd-20">
		<div class="vd_info tr" id="edit_btn"> <a class="btn vd_btn btn-xs vd_bg-yellow" style="float:right"> <i class="fa fa-pencil append-icon"></i> Edit </a> </div>      
        <h3 class="mgbt-xs-15 mgtp-10 font-semibold"><i class="fa fa-user" aria-hidden="true"></i> ABOUT</h3><br>
		<div class="row">
		
					<div class="col-sm-6">
						<div class="row mgbt-xs-0">
						  <label class="col-xs-5 control-label">Name:</label>
						  <div class="col-xs-7 controls"><c:forEach items="${viewProfileInfo.rows}" var="row">${fn:escapeXml(row.userName)}</c:forEach> 
						  </div>
						  <!-- col-sm-10 -->
						</div>
					  </div>
					  <div class="col-sm-6">
						<div class="row mgbt-xs-0">
						  <label class="col-xs-5 control-label">Age:</label>
						  <div class="col-xs-7 controls"><c:forEach items="${viewProfileInfo.rows}" var="row">${fn:escapeXml(row.age)}</c:forEach> 
						  </div>
						  <!-- col-sm-10 --> 
						</div>
					  </div>
					  <div class="col-sm-6">
						<div class="row mgbt-xs-0">
						  <label class="col-xs-5 control-label">Email:</label>
						  <div class="col-xs-7 controls"><c:forEach items="${viewProfileInfo.rows}" var="row">${fn:escapeXml(row.email)}</c:forEach> 
						  </div>
						  <!-- col-sm-10 --> 
						</div>
					  </div>
					  <div class="col-sm-6">
						<div class="row mgbt-xs-0">
						  <label class="col-xs-5 control-label">Phone number:</label>
						  <div class="col-xs-7 controls">
						  </div>
						  <!-- col-sm-10 --> 
						</div>
					  </div>
					  <div class="col-sm-6">
						<div class="row mgbt-xs-0">
						  <label class="col-xs-5 control-label">City Pincode:</label>
						  <div class="col-xs-7 controls"><c:forEach items="${viewProfileInfo.rows}" var="row">${fn:escapeXml(row.cityPincode)}</c:forEach> </div>
						  <!-- col-sm-10 --> 
						</div>
					  </div>
					  <div class="col-sm-6">
						<div class="row mgbt-xs-0">
						  <label class="col-xs-5 control-label">Country:</label>
						  <div class="col-xs-7 controls">India</div>
						  <!-- col-sm-10 --> 
						</div>
					  </div>
					  <div class="col-sm-6">
						<div class="row mgbt-xs-0">
						  <label class="col-xs-5 control-label">Birthday:</label>
						  <div class="col-xs-7 controls"><c:forEach items="${viewProfileInfo.rows}" var="row">${fn:escapeXml(row.dob)}</c:forEach> </div>
						  <!-- col-sm-10 --> 
						</div>
					  </div>
					  <div class="col-sm-6">
						<div class="row mgbt-xs-0">
						  <label class="col-xs-5 control-label">Interests:</label>
						  <div class="col-xs-7 controls">To be Included</div>
						  <!-- col-sm-10 --> 
						</div>
					  </div>
					  <div class="col-sm-6">
						<div class="row mgbt-xs-0">
						  <label class="col-xs-5 control-label">Gender:</label>
						  <div class="col-xs-7 controls">
						  <c:forEach items="${viewProfileInfo.rows}" var="row">
							<c:choose>
								<c:when test="${fn:escapeXml(row.gender) == 1}">
									Female
								</c:when>
								<c:when test="${fn:escapeXml(row.gender) == 2}">
									Others
								</c:when>
								<c:otherwise>
									Male
								</c:otherwise>
							</c:choose>
						  </c:forEach> 
						  </div>
						  <!-- col-sm-10 --> 
						</div>
					  </div>
					  <div class="col-sm-6">
						<div class="row mgbt-xs-0">
						  <label class="col-xs-5 control-label">Looking For:</label>
						  <div class="col-xs-7 controls">
							<c:forEach items="${viewProfileInfo.rows}" var="row">
							<c:choose>
								<c:when test="${fn:escapeXml(row.lookingFor) == 1}">
									Female
								</c:when>
								<c:when test="${fn:escapeXml(row.lookingFor) == 2}">
									Others
								</c:when>
								<c:otherwise>
									Male
								</c:otherwise>
							</c:choose>
						  </c:forEach>
						  </div>
						  <!-- col-sm-10 --> 
						</div>
					  </div>
					</div>	
							
	</div>
</div>
</div>
</div>
<div class="editProfile" id="editProfile" >
    <div class="profileName" id="profileName">
        <h4><font>Profile</font>&nbsp<i id="pencil" class="fa fa-pencil" aria-hidden="true" style="opacity: 0;transition: 0.2s;cursor:pointer" ></i></h4>
        <!--<i id="pencil" class="fa fa-pencil" aria-hidden="true" style="position: absolute;top: 365px;left: 15%;cursor: pointer;z-index: 1000" ></i> -->
        <div class="editProfileForm" id="editProfileForm">
        
            <form action="updateProfile.jsp?form=1" id="form1" method="post">
                

                <label style="margin-left: 21%">Username</label><input type="text" name="userName" style="margin-left: 4%"><br><br>
                <label style="margin-left:21%">Birthday</label>
                        <select name="DOBMonth" class="month" style="margin-left:29px">
                            <option> - Month - </option>
                            <option value="January">January</option>
                            <option value="Febuary">Febuary</option>
                            <option value="March">March</option>
                            <option value="April">April</option>
                            <option value="May">May</option>
                            <option value="June">June</option>
                            <option value="July">July</option>
                            <option value="August">August</option>
                            <option value="September">September</option>
                            <option value="October">October</option>
                            <option value="November">November</option>
                            <option value="December">December</option>
                        </select>
                        <select name="DOBDay" class="date">
                            <option> - Day - </option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                            <option value="31">31</option>
                        </select>
                        <select name="DOBYear" class="year">
                            <option> - Year - </option>
                            <option value="1986">2000</option>
                            <option value="1985">1999</option>
                            <option value="1984">1998</option>
                            <option value="1983">1997</option>
                            <option value="1982">1996</option>
                            <option value="1981">1995</option>
                            <option value="1980">1994</option>
                            <option value="1993">1993</option>
                            <option value="1992">1992</option>
                            <option value="1991">1991</option>
                            <option value="1990">1990</option>
                            <option value="1989">1989</option>
                            <option value="1988">1988</option>
                            <option value="1987">1987</option>
                            <option value="1986">1986</option>
                            <option value="1985">1985</option>
                            <option value="1984">1984</option>
                            <option value="1983">1983</option>
                            <option value="1982">1982</option>
                            <option value="1981">1981</option>
                            <option value="1980">1980</option>
                            <option value="1979">1979</option>
                            <option value="1978">1978</option>
                            <option value="1977">1977</option>
                            <option value="1976">1976</option>
                            <option value="1975">1975</option>
                            <option value="1974">1974</option>
                            <option value="1973">1973</option>
                            <option value="1972">1972</option>
                            <option value="1971">1971</option>
                            <option value="1970">1970</option>
                            <option value="1969">1969</option>
                            <option value="1968">1968</option>
                            <option value="1967">1967</option>
                            <option value="1966">1966</option>
                            <option value="1965">1965</option>
                            <option value="1964">1964</option>
                            <option value="1963">1963</option>
                            <option value="1962">1962</option>
                            <option value="1961">1961</option>
                            <option value="1960">1960</option>
                            <option value="1959">1959</option>
                            <option value="1958">1958</option>
                            <option value="1957">1957</option>
                            <option value="1956">1956</option>
                            <option value="1955">1955</option>
                            <option value="1954">1954</option>
                            <option value="1953">1953</option>
                            <option value="1952">1952</option>
                            <option value="1951">1951</option>
                            <option value="1950">1950</option>
                            <option value="1949">1949</option>
                            <option value="1948">1948</option>
                            <option value="1947">1947</option>
                        </select><br><br>
                <label style="margin-left: 21%">Location</label><input type="number" name="cityPincode" style="margin-left: 4%"><br><br>
                <label style="margin-left: 21%">Looking For</label><select name="lookingFor" class="lookingFor" style="margin-left: 4%">
                    <option value="0">Male</option>
                    <option value="1">Female</option>
                    <option value="2">Others</option>
                </select><br><br><br>
                <a class="pclose" id="pclose">CANCEL</a>
                <a class="psave" id="psave" style="color: white;line-height: 43px">SAVE</a>
            </form>
        </div>
    </div>
    <div class="aboutMe" id="aboutMe">
         		
        <h4><font>About Me</font>&nbsp<i id="pencil1" class="fa fa-pencil" aria-hidden="true" style="opacity: 0;transition: 0.2s;cursor:pointer"></i></h4>
        <!-- <i id="pencil1" class="fa fa-pencil" aria-hidden="true" style="position: absolute;cursor: pointer;left: 200px;top: 564px;transition: 0.4s;z-index: 1000" ></i>-->
   		 
        <form action="updateProfile.jsp?form=2" id="form2" method="post">
        	<textarea style="margin-left:30%" name="about" id="aboutMeText"></textarea><br><br>
        		<a class="aclose" id="aclose">CANCEL</a>
                <a class="asave" id="asave" style="color: white;line-height: 43px">SAVE</a>
        </form>        
    </div>
    <div class="details" id="details">
        
        <h4><font>Details</font>&nbsp<i id="pencil2" class="fa fa-pencil" aria-hidden="true" style="opacity: 0;transition: 0.2s;cursor:pointer" ></i></h4>
        <!-- <i id="pencil2" class="fa fa-pencil" aria-hidden="true" style="position: absolute;cursor: pointer;left: 158px;top: 765px;transition: 0.4s;z-index: 1000" ></i>-->
            <br><br><form action="updateProfile.jsp?form=3" id="form3" method="post">
            <label>orientation</label>
                <select name="orientation" class="orientation">
                    <option value="Asexual">Asexual</option>
                    <option value="Bisexual">Bisexual</option>
                    <option value="Hetrosexual">Hetrosexual</option>
                    <option value="Homosexual">Homosexual</option>
                </select>
            <label>Education</label>
                <select name="education" class="education">
                    <option value="High school">High school</option>
                    <option value="Some college">Some college</option>
                    <option value="Post graduation">Post graduation</option>
                </select>
            <label>Height</label>
                <select name="height" class="height">
                    <option value="0">Male</option>
                    <option value="1">Female</option>
                    <option value="2">Others</option>
                </select>
                <br><br>
            <label>Status</label>
                <select name="status" class="relationship_status">
                    <option value="Single">Single</option>
                    <option value="Separated">Separated</option>
                </select>
            <label>Built</label>
                <select name="build" class="built">
                    <option value="Thin">Thin</option>
                    <option value="Slim">Slim</option>
                    <option value="Chubby">Chubby</option>
                </select>
            <label>Facial Hair</label>
                <select name="facialHair" class="facial_hair">
                    <option value="Heavy">Heavy</option>
                    <option value="Light">Light</option>
                    <option value="No">No</option>
                </select>
                <br><br>
            <label>Work Status</label>
                <select name="workStatus" class="work_status">
                    <option value="Student">Student</option>
                    <option value="Part time">Part time</option>
                    <option value="Unemployed">Unemployed</option>
                    <option value="Employed">Employed</option>
                </select>
            <label>Weight</label>
                <select name="weight" class="weight">
                    <option value="0">Male</option>
                    <option value="1">Female</option>
                    <option value="2">Others</option>
                </select>
            <label>Glasses</label>
                <select name="glasses" class="glasses">
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                </select><br><br>
                <a class="dclose" id="dclose">CANCEL</a>
        		<a class="dsave" id="dsave" style="color: white;line-height: 43px">SAVE</a>
        		
          </form>      
    </div><br>
    <div class="personality" id="personality" style="width:100%">
        
        <h4><font>Personality</font>&nbsp<i id="pencil3" class="fa fa-pencil" aria-hidden="true" style="opacity: 0;transition: 0.2s;cursor:pointer" ></i></h4>
        <!-- <i id="pencil5" class="fa fa-pencil" aria-hidden="true" style="position: absolute;cursor: pointer;left: 211px;top: 966px;transition: 0.4s;z-index: 1000" ></i>-->
        <h3>Me</h3><br>
        <div id="myPersonality" style="opacity: 0;height:0px">
        <form action="updateProfile.jsp?form=4" id="form4" method="post"><br>     
	        <label style="float: left;margin-left: 235px;">Bond Level</label>
	        <input type="range" name="myBondLevel" id="pslide1" style="margin-left: 40%"><label class="prange1" for="range" style="margin-left: 450px;"></label><br>
	        <label style="float: left;margin-left: 235px;">Freedom Level</label>
	        <input type="range" name="myFreedomLevel" id="pslide2" style="margin-left: 40%"><label class="prange2" for="range" style="margin-left: 450px;"></label><br>
	        <label style="float: left;margin-left: 235px;">Extrovert</label>
	        <input type="range" name="myExtrovert" id="pslide3" style="margin-left: 40%"><label class="prange3" for="range" style="margin-left: 450px;"></label><br>
	        <label style="float: left;margin-left: 235px;">Religious</label>
	        <input type="range" name="myReligious" id="pslide4" style="margin-left: 40%"><label class="prange4" for="range" style="margin-left: 450px;"></label><br>
	        <label style="float: left;margin-left: 235px;">Adventurous</label>
	        <input type="range" name="myAdventure" id="pslide5" style="margin-left: 40%"><label class="prange5" for="range" style="margin-left: 450px;"></label><br><br><br>
	        <a class="prclose" id="prclose">CANCEL</a>
	        <a class="prsave" id="prsave" style="color: white;line-height: 43px">SAVE</a>
        </form> 
        </div>
    </div>
    <br><br>
    <div class="personality" id="personalityP">
        
        <h4><font>Personality</font>&nbsp<i id="pencil4" class="fa fa-pencil" aria-hidden="true" style="opacity: 0;transition: 0.2s;cursor:pointer" ></i></h4>
        <!-- <i id="pencil4" class="fa fa-pencil" aria-hidden="true" style="position: absolute;cursor: pointer;left: 211px;top: 966px;transition: 0.4s;z-index: 1000" ></i>-->
        <br>
        <h3>Preferred</h3><br>
        <div id="prePersonality" style="opacity: 0">
        <form action="updateProfile.jsp?form=5" id="form5" method="post">
	         <label style="float: left;float: left;margin-left: 235px;">Bond Level</label>
	        <input type="range" name="bondLevel" id="slide1" style="margin-left: 40%"><label class="range1" for="range" style="margin-left: 450px;"></label><br>
	        <label style="float: left;float: left;margin-left: 235px;">Freedom Level</label>
	        <input type="range" name="freedomLevel" id="slide2" style="margin-left: 40%"><label class="range2" for="range" style="margin-left: 450px;"></label><br>
	        <label style="float: left;float: left;margin-left: 235px;">Extrovert</label>
	        <input type="range" name="extrovert" id="slide3" style="margin-left: 40%"><label class="range3" for="range" style="margin-left: 450px;"></label><br>
	        <label style="float: left;float: left;margin-left: 235px;">Religious</label>
	        <input type="range" name="religious" id="slide4" style="margin-left: 40%"><label class="range4" for="range" style="margin-left: 450px;"></label><br>
	        <label style="float: left;float: left;margin-left: 235px;">Adventurous</label>
	        <input type="range" name="adventure" id="slide5" style="margin-left: 40%"></input><label class="range5" for="range" style="margin-left: 450px;"></label><br><br><br>
        	<a class="prPclose" id="prPclose">CANCEL</a>
        	<a class="prPsave" id="prPsave" style="color: white;line-height: 43px">SAVE</a>
        </form>	
        </div>
    </div>
</div>
</div>
</div>
</div>
<script>
document.querySelector("#slide1").addEventListener("change", function(e){
    document.querySelector(".range1").textContent=e.currentTarget.value;
});
document.querySelector("#slide2").addEventListener("change", function(e){
    document.querySelector(".range2").textContent=e.currentTarget.value;
});
document.querySelector("#slide3").addEventListener("change", function(e){
    document.querySelector(".range3").textContent=e.currentTarget.value;
});
document.querySelector("#slide4").addEventListener("change", function(e){
    document.querySelector(".range4").textContent=e.currentTarget.value;
});
document.querySelector("#slide5").addEventListener("change", function(e){
    document.querySelector(".range5").textContent=e.currentTarget.value;
});

document.querySelector("#pslide1").addEventListener("change", function(e){
    document.querySelector(".prange1").textContent=e.currentTarget.value;
});
document.querySelector("#pslide2").addEventListener("change", function(e){
    document.querySelector(".prange2").textContent=e.currentTarget.value;
});
document.querySelector("#pslide3").addEventListener("change", function(e){
    document.querySelector(".prange3").textContent=e.currentTarget.value;
});
document.querySelector("#pslide4").addEventListener("change", function(e){
    document.querySelector(".prange4").textContent=e.currentTarget.value;
});
document.querySelector("#pslide5").addEventListener("change", function(e){
    document.querySelector(".prange5").textContent=e.currentTarget.value;
});
</script>

    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <script>
        $(document).scroll(function() {
        if ($(this).scrollTop() > 125) {
            $('#header').addClass('shrinked');
            $('#logoh').addClass('shrinked1');
            $('#links1').addClass('shrinked4');
            $('#links2').addClass('shrinked4');
            $('#links3').addClass('shrinked4');
            $('#links4').addClass('shrinked4');
            $('#profile_pic').addClass('shrinked3');
            $('#header').addClass('shrink_header');
            //$('#more_func').css({top: 65px});
            //$('#arrow-up').css({top: 53px});
            } else {
            $('#header').removeClass('shrinked');
            $('#logoh').removeClass('shrinked1');
            $('#links1').removeClass('shrinked4');
            $('#links2').removeClass('shrinked4');
            $('#links3').removeClass('shrinked4');
            $('#links4').removeClass('shrinked4');
            $('#profile_pic').removeClass('shrinked3');
            $('#header').removeClass('shrink_header');
            //$('#more_func').css({top: 110px});
            //$('#arrow-up').css({top: 98px});
            }
        });

//function show(){
              //  $("#pencil").css({opacity: 1});
            //}

//function hide(){
                //$("#pencil").css({opacity: 0});   
            //}
        $(document).ready(function() {
        	
        	if("${loggedUser}" != "${viewProfile}"){
        		$('#editProfile').css("display","none");
        		$('#edit_btn').css("display","none");
        	}
        	
            $('#home').hover(function(){
                $('#hr1').addClass('display');
            });
            $('#aboutUs').hover(function(){
                $('#hr2').addClass('display');
            });
            $('#contact').hover(function(){
                $('#hr3').addClass('display');
            });
            $('#search').hover(function(){
                $('#hr4').addClass('display');
            });
            $('#test').click(function(){
                $('#hr4').addClass('display');
            });
            $('#reset').click(function(){
                document.getElementById('search').reset();
            });
			
            
            $("#edit_btn").click(function() {
                $('html,body').animate({
                scrollTop: $(".editProfile").offset().top},'slow');
            });
            
            $('#pencil').click(function(){
                $('#profileName').animate({height: 500});
                //$('#pencil1').animate({top: 763});
                //$('#pencil2').animate({top: 964});
                //$('#pencil3').animate({top: 1166});
                $('#editProfileForm').animate({height: 450});
                $('#editProfileForm').css("padding","30");
                $('#editProfileForm').css("opacity","1");
                $('#pclose').css("opacity","1");
                $('#psave').css("opacity","1");
            });

            $('#pclose').click(function(){
                $('#profileName').animate({height: 200});
                //$('#pencil1').animate({top: 564});
                //$('#pencil2').animate({top: 759});
                //$('#pencil3').animate({top: 966});
                $('#editProfileForm').animate({height: 0});
                $('#editProfileForm').css("padding","0");
                $('#editProfileForm').css("opacity","0");
                $('#pclose').css("opacity","0");
                $('#psave').css("opacity","0");
            });

            $('#pencil1').click(function(){
                $('#aboutMe').animate({height: 300});
                //$('#pencil2').animate({top: 864});
                //$('#pencil3').animate({top: 1064});
                $('#aclose').css("opacity","1");
                $('#asave').css("opacity","1");
                $('#aboutMeText').css("opacity", "1");
            });

            $('#aclose').click(function(){
                $('#aboutMe').animate({height: 200});
                //$('#pencil2').animate({top: 765});
                //$('#pencil3').animate({top: 966});
                $('#aclose').css("opacity","0");
                $('#asave').css("opacity","0");
                $('#aboutMeText').css("opacity", "0");
            });

            $('#pencil2').click(function(){
                $('#details').animate({height: 383});
                //$('#pencil3').animate({top: 1164});
                $('#dclose').css("opacity","1");
                $('#dsave').css("opacity","1");
                $('#form3').css("opacity","1");
                
            });
			
            
            
            $('#dclose').click(function(){
                $('#details').animate({height: 200});
                //$('#pencil3').animate({top: 966});
                $('#dclose').css("opacity","0");
                $('#dsave').css("opacity","0");
                $('#form3').css("opacity","0");
            });

            $('#pencil3').click(function(){
            	//$('#details').animate({height: 400});
                //$('#pencil4').animate({top: 1164});
                $('#prclose').css("opacity","1");
                $('#prsave').css("opacity","1");
                $('#myPersonality').css("opacity","1");
                $('#personality').animate({height: 500});
            });

            	
            $('#pencil4').click(function(){
            	$('#prPclose').css("opacity","1");
                $('#prPsave').css("opacity","1");
                $('#prePersonality').css("opacity","1");
                $('#personalityP').animate({height: 550});
            });
            
            
            $('#prPclose').click(function(){
                //$('#details').animate({height: 200});
                //$('#pencil3').animate({top: 966});
                $('#prPclose').css("opacity","0");
                $('#prPsave').css("opacity","0");
                $('#prePersonality').css("opacity","0");
                $('#personalityP').animate({height: 200});
            });
            
            
            
            $('#prclose').click(function(){
                //$('#personality').animate({height: 200});
                $('#prclose').css("opacity","0");
                $('#prsave').css("opacity","0");
                $('#myPersonality').css("opacity","0");
                $('#personality').animate({height: 200});
            });
            
            $('#psave').click(function(){
                //$('#personality').animate({height: 200});
            	document.getElementById("form1").submit();
            });
            $('#asave').click(function(){
                //$('#personality').animate({height: 200});
            	document.getElementById("form2").submit();
            });
            $('#dsave').click(function(){
                //$('#personality').animate({height: 200});
            	document.getElementById("form3").submit();
            });
            $('#prsave').click(function(){
                //$('#personality').animate({height: 200});
            	document.getElementById("form4").submit();
            });
            $('#prPsave').click(function(){
                //$('#personality').animate({height: 200});
            	document.getElementById("form5").submit();
            });
            
            
            $(document).mousemove(function() {    
                if($('#profileName').is(':hover')) {
                    $('#pencil').css({opacity:1});
                }
                else 
                {
                    $('#pencil').css({opacity:0});
                }

                if($('#aboutMe').is(':hover')) {
                    $('#pencil1').css({opacity:1});
                }
                else 
                {
                    $('#pencil1').css({opacity:0});
                }

                if($('#details').is(':hover')) {
                    $('#pencil2').css({opacity:1});
                    
                }
                else 
                {
                    $('#pencil2').css({opacity:0});
                    
                }

                if($('#personality').is(':hover')) {
                    $('#pencil3').css({opacity:1});
                }
                else 
                {
                    $('#pencil3').css({opacity:0});
                }
                
                if($('#personalityP').is(':hover')) {
                    $('#pencil4').css({opacity:1});
                }
                else 
                {
                    $('#pencil4').css({opacity:0});
                }

            });
            
            
            function standby() {
                document.getElementById('foo').src = 'medai/download.png'
            }

    });
        
    </script>

<!--    <script src="js/xSlider.js"></script>
    <script src="js/vendor/jquery.js"></script>
    <script src="js/foundation.min.js"></script>
-->

<div class="col-sm-12">
 <footer id="myFooter">
        <div class="container1" style="margin-left: 120px;">
            <div class="row">
                <div class="col-sm-3">
                    <h2 class="logo"><img src="media/logo(resized)new.jpg" style="margin-top: 25px;"></h2>
                </div>
                <div class="col-sm-2">
                    <h5>Get started</h5>
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Sign up</a></li>
   <!--                    <li><a href="#">Downloads</a></li> -->
                    </ul>
                </div>
                <div class="col-sm-2">
                    <h5>About us</h5>
                    <ul>
                      <!--  <li><a href="#">Company Information</a></li> -->
                        <li><a href="#">Contact us</a></li>
                        <li><a href="#">Reviews</a></li>
                    </ul>
                </div>
                <div class="col-sm-2">
                    <h5>Support</h5>
                    <ul>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Help desk</a></li>
                    </ul>
                </div>
                <div class="col-sm-3">
                    <div class="social-networks">
                        <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
                        <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                        <a href="#" class="google"><i class="fa fa-google-plus"></i></a>
                    </div>
                    <button type="button" class="btn btn-default">Contact us</button>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <p>Copyright © 2017 CatchUrMatch</p>
        </div>
    </footer>
	</div>

</body>

</html>
