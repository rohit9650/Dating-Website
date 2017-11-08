<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.sql.*" %>
<html>

<head class="no-js" lang="en">    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>   
    <title>Foundation | Welcome</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" type="text/css" href="css/picEffect.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
	<link rel="stylesheet" href="css/userHome.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body> 

<!-- HEADER -->
<div class="header" id="header">
    
    <div class="logoh" id="logoh"><img src="media/logo1.png" style="margin-top: -75px"></div>
    <ul id="header_ul">
        <li><a id="links1" href="index.jsp" style="color: white;text-decoration: none;">HOME</a></li>
        <li><a id="links2" href="links.html#aboutUs" style="color: white;text-decoration: none;">ABOUT US</a></li>
        <li><a id="links3" href="links.html#aboutUs" style="color: white;text-decoration: none;">CONTACT</a></li>
        <li><a id="links4" href="userProfile.jsp?p=<%=session.getAttribute("loggedUser") %>" style="color: white;text-decoration: none;">PROFILE</a></li>
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







<div style="width: 20%;height: 100%;position: fixed;float:left;padding-left: 30px;padding-top: 60px;padding-right: 20px;padding-bottom: 20px;">
    <div data-role="main">
    <form method="get" action="userHome.jsp" id="search">
        <h5 style="margin-left: 40px;font-family: Comic">Search Here</h5><br>
        
        <label style="font-family: 'Ubuntu','Trebuchet MS',Arial,sans-serif;">UserName</label><input type="text" name="name" style="width: 200px;border: none;">
        <label style="font-family: 'Ubuntu','Trebuchet MS',Arial,sans-serif;">Location</label><input type="text" name="location" style="width: 200px;border: none;">
        <label style="font-family: 'Ubuntu','Trebuchet MS',Arial,sans-serif;">Age  </label><span id="spanOutput"></span>
      	<div class="row">
	      	<input class="col-sm-2" type="text" name="minAge" id="price-min" min="18" max="39" value="18">
	      	<div class="col-sm-7" id="slider-range"></div>
	      	<input class="col-sm-3" type="text" name="maxAge" id="price-max" min="19" max="40" value="40">
      	</div>
      <br>
        <input type="checkbox" name="accept"><font style="font-size: 10px;font-family: 'Ubuntu','Trebuchet MS',Arial,sans-serif;margin-left: 32px;float: left;">&nbspshow results as per my PREFERENCE</font><br>  
        <font id="reset" style="float: right;font-size: 10px;cursor: pointer;">&#215;Reset</font><br><br>
        <input type="submit" name="submit" value="Search" style="margin-bottom: 10px;border: none;background-color: rgba(66,165,245,.8);border-radius: 5px;margin-left: 28%;margin-left: 65px">
      </form>
  </div>    
</div>

<div class="suggestions" id="suggestions">
	<c:choose>
		<c:when test="${empty loggedUser && empty param.id}">
			<jsp:forward page="error.jsp" />
		</c:when>
		<c:otherwise>
		
	<sql:query var="userLoggedDetails">
			SELECT * FROM userDetails WHERE email = ? 
			<sql:param value="${loggedUser}"/>	 
	</sql:query>	
	<c:choose>
		<c:when test="${userLoggedDetails.rowCount!=0}">
			<%-- algorithm --%>
			
			<sql:query var="userLoggedInfo">
				SELECT lookingFor FROM userInfo WHERE email = ? 
				<sql:param value="${loggedUser}" />	 
			</sql:query>
			<c:forEach items="${userLoggedInfo.rows}" var="row" >
				<c:set var="lookingFor" value="${row.lookingFor}" />
			</c:forEach>	
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
				int total=0;
				int i=0;
				int pageid = 0;
				int entry = 15;
				if(request.getParameter("page") != null){
					if(request.getParameter("page").equals("next")){
						int n = Integer.parseInt(session.getAttribute("num").toString())+1;
						session.setAttribute("num",n);
						pageid = (n-1)*15;
						out.println("next");
					}
					if(request.getParameter("page").equals("prev")){
						int n = Integer.parseInt(session.getAttribute("num").toString())-1;
						session.setAttribute("num",n);
						pageid = (n-1)*15;
						out.println("previous");
					}
				}
				try{
				   //STEP 2: Register JDBC driver
				   Class.forName("com.mysql.jdbc.Driver");
				   //STEP 3: Open a connection
				 	//out.println("test1:" + "filterFormLocation:" + session.getAttribute("filterFormLocation").toString() + "filterFormName:"+session.getAttribute("filterFormName") + "filterForm:" + session.getAttribute("filterForm")+"submitted:"+request.getParameter("submit"));
				   	conn = DriverManager.getConnection(DB_URL,USER,PASS);
				   //STEP 4: Execute a query
		
							
								    if(request.getParameter("submit") != null){
								    	pageid=0;
										session.setAttribute("num",1);
								     	request.getSession().setAttribute("filterFormLocation",request.getParameter("location"));
								     	request.getSession().setAttribute("filterFormName",request.getParameter("name"));
								     	request.getSession().setAttribute("filterFormMinAge",request.getParameter("minAge"));
								     	request.getSession().setAttribute("filterFormMaxAge",request.getParameter("maxAge"));
								     	//out.println(session.getAttribute("filterFormMinAge")+"param"+session.getAttribute("filterFormName"));
								    } 
								    String name = "";
								    String location = "";
								    int minAge = 16;
								    int maxAge = 80;
								    if(session.getAttribute("filterFormName") != null){
								    	name = session.getAttribute("filterFormName").toString();
								    }
								    if(session.getAttribute("filterFormLocation") != null){
								    	location = session.getAttribute("filterFormLocation").toString();
								    }
								    if(session.getAttribute("filterFormMinAge").toString().length() != 0 && session.getAttribute("filterFormMinAge") != null){
								    		minAge = Integer.parseInt(session.getAttribute("filterFormMinAge").toString());
										
								    }
								    if(session.getAttribute("filterFormMaxAge").toString().length() != 0 && session.getAttribute("filterFormMaxAge") != null){
								    		maxAge = Integer.parseInt(session.getAttribute("filterFormMaxAge").toString());
								    }
								    //out.println(session.getAttribute("filterFormMaxAge").toString()+"testing");
								    String sql="SELECT userInfo.email,userInfo.gender,userInfo.userName,userInfo.age,userInfo.cityPincode,userDetails.about,userImage.path FROM userInfo,userDetails,userImage WHERE   gender = ? AND userInfo.age BETWEEN " + minAge +" AND " + maxAge +" AND LOWER(userInfo.userName) LIKE LOWER('%" + name +"%') AND LOWER(userInfo.cityPincode) LIKE LOWER('%" + location +"%') AND userInfo.email=userDetails.email AND userInfo.email=userImage.email limit "+pageid+","+entry;
								    int lookingFor = (int)pageContext.getAttribute("lookingFor");
									stmt = conn.prepareStatement(sql);
								    stmt.setInt(1,lookingFor);
								    //out.println("<br/>test pin:"+pin);
								    result = stmt.executeQuery();
				   
					boolean record  = result.next();
					//out.println("hi"+record);
					if(!record){
						out.println("No record found ");
						request.getSession().setAttribute("numRow",total);
					}
					else{
					result.last(); 
					total = result.getRow();   //total no.of rows returned
					result.beforeFirst();
					
					request.getSession().setAttribute("numRow",total);
					
					//out.println("total "+total);
					if(total/15==0){
						for(i=1; i<=total; i++){
							if(result.next()== false){
								out.println("No more records");
								break;
							}
					%>
						 <div class="col-md-4 col-sm-6 abc">
					            <div class="our-team">
					                <div class="pic">
					                    <ul class="social">
					                         <li style="position: absolute;margin-left: -35px;margin-top: -48px;"><a href="#" class="fa fa-facebook" ></a></li>
						                     <li style="position: absolute;margin-left: -82px;margin-top: -12px;"><a href="#" class="fa fa-twitter"></a></li>
						                     <li style="position: absolute;margin-left: -82px;margin-top: 33px;"><a href="#" class="fa fa-linkedin"></a></li>
						                     <li style="position: absolute;margin-left: -55px;margin-top: 70px;"><a href="#" class="fa fa-heart" ></a></li>
						                     <li style="position: absolute;margin-left: -22px;margin-top: 13px;"><a href="userProfile.jsp?p=<%=result.getString(1)%>" class="fa fa-user" ></a></li>
					                    </ul>
					                     <img src="<%
						                    if(result.getString(7).equals("") || result.getString(7)==null)
						                    	out.println("media/download.png");
						                    else	
						                    	out.println(result.getString(7)); %>" height="200" width="200">
					                </div>
					                <h3 class="title"><%out.println(result.getString(3)); %></h3>
					                <span class="post"><%out.println(result.getString(6)); %></span>
					            </div>
					    </div>
					<% 	
						}
					}
					else{
						for(i=1; i<=total+1; i++){
							if(result.next()== false){
								out.println("No more records");
								break;
							}
					%>
							 <div class="col-md-4 col-sm-6 abc">
						            <div class="our-team">
						                <div class="pic">
						                    <ul class="social">
						                        <li style="position: absolute;margin-left: -55px;margin-top: -48px;"><a href="#" class="fa fa-facebook" ></a></li>
						                        <li style="position: absolute;margin-left: -82px;margin-top: -12px;"><a href="#" class="fa fa-twitter"></a></li>
						                        <li style="position: absolute;margin-left: -82px;margin-top: 33px;"><a href="#" class="fa fa-linkedin"></a></li>
						                        <li style="position: absolute;margin-left: -55px;margin-top: 70px;"><a href="#" class="fa fa-heart" ></a></li>
						                        <li style="position: absolute;margin-left: -22px;margin-top: 13px;"><a href="userProfile.jsp?p=<%=result.getString(1)%>" class="fa fa-user" ></a></li>
						                    </ul>
						                    <img src="<%
						                    if(result.getString(7).equals("") || result.getString(7)==null)
						                    	out.println("media/download.png");
						                    else	
						                    	out.println(result.getString(7)); %>" height="200" width="200">
						                </div>
						                <h3 class="title"><%out.println(result.getString(3)); %></h3>
						                <span class="post"><%out.println(result.getString(6));%></span>
						            </div>
						    </div>
					<% 	
						}
					}
					}
	
					
				}catch(Exception e){
					 out.print(e.toString());
				}finally{
					 
				}
				
			%>	
				
			
		</c:when>	
		<c:otherwise>
			<%-- Gender --%>
			 
			<sql:query var="userLoggedInfo">
				SELECT lookingFor FROM userInfo WHERE email = ? 
				<sql:param value="${loggedUser}" />	 
			</sql:query>
			<c:forEach items="${userLoggedInfo.rows}" var="row" >
				<c:set var="lookingFor" value="${row.lookingFor}" />
			</c:forEach>	
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
				int total=0;
				int i=0;
				int pageid = 0;
				int entry = 15;
				if(request.getParameter("page") != null){
					out.println("<script>console.log('I am in')</script>");
					if(request.getParameter("page").equals("next")){
						int n = Integer.parseInt(session.getAttribute("num").toString())+1;
						session.setAttribute("num",n);
						pageid = (n-1)*15;
						out.println("next");
					}
					if(request.getParameter("page").equals("prev")){
						int n = Integer.parseInt(session.getAttribute("num").toString())-1;
						session.setAttribute("num",n);
						pageid = (n-1)*15;
						out.println("previous");
					}
				}
				try{
				   //STEP 2: Register JDBC driver
				   Class.forName("com.mysql.jdbc.Driver");
				   //STEP 3: Open a connection
				 	//out.println("test1:" + "filterFormLocation:" + session.getAttribute("filterFormLocation").toString() + "filterFormName:"+session.getAttribute("filterFormName") + "filterForm:" + session.getAttribute("filterForm")+"submitted:"+request.getParameter("submit"));
				   	conn = DriverManager.getConnection(DB_URL,USER,PASS);
				   //STEP 4: Execute a query
		
							
								    if(request.getParameter("submit") != null){
								    	pageid=0;
										session.setAttribute("num",1);
								     	request.getSession().setAttribute("filterFormLocation",request.getParameter("location"));
								     	request.getSession().setAttribute("filterFormName",request.getParameter("name"));
								     	request.getSession().setAttribute("filterFormMinAge",request.getParameter("minAge"));
								     	request.getSession().setAttribute("filterFormMaxAge",request.getParameter("maxAge"));
								     	//out.println(session.getAttribute("filterFormMinAge")+"param"+session.getAttribute("filterFormName"));
								    } 
								    String name = "";
								    String location = "";
								    int minAge = 16;
								    int maxAge = 80;
								    if(session.getAttribute("filterFormName") != null){
								    	name = session.getAttribute("filterFormName").toString();
								    }
								    if(session.getAttribute("filterFormLocation") != null){
								    	location = session.getAttribute("filterFormLocation").toString();
								    }
								    if(session.getAttribute("filterFormMinAge").toString().length() != 0 && session.getAttribute("filterFormMinAge") != null){
								    		minAge = Integer.parseInt(session.getAttribute("filterFormMinAge").toString());
										
								    }
								    if(session.getAttribute("filterFormMaxAge").toString().length() != 0 && session.getAttribute("filterFormMaxAge") != null){
								    		maxAge = Integer.parseInt(session.getAttribute("filterFormMaxAge").toString());
								    }
								    //out.println(session.getAttribute("filterFormMaxAge").toString()+"testing");
								    String sql="SELECT userInfo.email,userInfo.gender,userInfo.userName,userInfo.age,userInfo.cityPincode,userDetails.about,userImage.path FROM userInfo,userDetails,userImage WHERE   gender = ? AND userInfo.age BETWEEN " + minAge +" AND " + maxAge +" AND LOWER(userInfo.userName) LIKE LOWER('%" + name +"%') AND LOWER(userInfo.cityPincode) LIKE LOWER('%" + location +"%') AND userInfo.email=userDetails.email AND userInfo.email=userImage.email limit "+pageid+","+entry;
								    int lookingFor = (int)pageContext.getAttribute("lookingFor");
									stmt = conn.prepareStatement(sql);
								    stmt.setInt(1,lookingFor);
								    //out.println("<br/>test pin:"+pin);
								    result = stmt.executeQuery();
				   
					boolean record  = result.next();
					//out.println("hi"+record);
					if(!record){
						out.println("No record found ");
						request.getSession().setAttribute("numRow",total);
					}
					else{
					result.last(); 
					total = result.getRow();   //total no.of rows returned
					result.beforeFirst();
					
					request.getSession().setAttribute("numRow",total);
					
					//out.println("total "+total);
					if(total/15==0){
						for(i=1; i<=total; i++){
							if(result.next()== false){
								out.println("No more records");
								break;
							}
					%>
						 <div class="col-md-4 col-sm-6 abc">
					            <div class="our-team">
					                <div class="pic">
					                    <ul class="social">
					                         <li style="position: absolute;margin-left: -35px;margin-top: -48px;"><a href="#" class="fa fa-facebook" ></a></li>
						                     <li style="position: absolute;margin-left: -82px;margin-top: -12px;"><a href="#" class="fa fa-twitter"></a></li>
						                     <li style="position: absolute;margin-left: -82px;margin-top: 33px;"><a href="#" class="fa fa-linkedin"></a></li>
						                     <li style="position: absolute;margin-left: -55px;margin-top: 70px;"><a href="#" class="fa fa-heart" ></a></li>
						                     <li style="position: absolute;margin-left: -22px;margin-top: 13px;"><a href="userProfile.jsp?p=<%=result.getString(1) %>" class="fa fa-user" ></a></li>
					                    </ul>
					                     <img src="<%
						                    if(result.getString(7).equals("") || result.getString(7)==null)
						                    	out.println("media/download.png");
						                    else	
						                    	out.println(result.getString(7)); %>" height="200" width="200">
					                </div>
					                <h3 class="title"><%out.println(result.getString(3)); %></h3>
					                <span class="post"><%out.println(result.getString(6)); %></span>
					            </div>
					    </div>
					<% 	
						}
					}
					else{
						for(i=1; i<=total+1; i++){
							if(result.next()== false){
								out.println("No more records");
								break;
							}
					%>
							 <div class="col-md-4 col-sm-6 abc">
						            <div class="our-team">
						                <div class="pic">
						                    <ul class="social">
						                        <li style="position: absolute;margin-left: -55px;margin-top: -48px;"><a href="#" class="fa fa-facebook" ></a></li>
						                        <li style="position: absolute;margin-left: -82px;margin-top: -12px;"><a href="#" class="fa fa-twitter"></a></li>
						                        <li style="position: absolute;margin-left: -82px;margin-top: 33px;"><a href="#" class="fa fa-linkedin"></a></li>
						                        <li style="position: absolute;margin-left: -55px;margin-top: 70px;"><a href="#" class="fa fa-heart" ></a></li>
						                        <li style="position: absolute;margin-left: -22px;margin-top: 13px;"><a href="userProfile.jsp?p=<%=result.getString(1)%>" class="fa fa-user" ></a></li>
						                    </ul>
						                    <img src="<%
						                    if(result.getString(7).equals("") || result.getString(7)==null)
						                    	out.println("media/download.png");
						                    else	
						                    	out.println(result.getString(7)); %>" height="200" width="200">
						                </div>
						                <h3 class="title"><%out.println(result.getString(3)); %></h3>
						                <span class="post"><%out.println(result.getString(6));%></span>
						            </div>
						    </div>
					<% 	
						}
					}
					}
	
					
				}catch(Exception e){
					 out.print(e.toString());
				}finally{
					 
				}
				
			%>	
				
			
		</c:otherwise>
	</c:choose> 
	</c:otherwise>
	</c:choose>
	

</div>
<div class="alink">
<a href="userHome.jsp?page=prev" id="prevBtn"><button class="prev"  id="prev" >Previous</button></a>
<a href="userHome.jsp?page=next" id="nextBtn"><button class="next" id="next">Next</button></a>
</div>

    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <script type="text/javascript">
        $(document).scroll(function() {
        if ($(this).scrollTop() > 125) {
            $('#header').addClass('shrinked');
            $('#logoh').addClass('shrinked1');            
            $('#links1').addClass('shrinked4');
            $('#links2').addClass('shrinked4');
            $('#links3').addClass('shrinked4');
            $('#links4').addClass('shrinked4');
            $('#header_ul').css("top","0");
            
            $('#profile_pic').addClass('shrinked3');
            $('#header').addClass('shrink_header');
            $('#test').addClass('search_shrink');
            $('#more').addClass('more_hide');
            } else {
            	$('#header').removeClass('shrinked');
                $('#logoh').removeClass('shrinked1');
                $('#links1').removeClass('shrinked4');
                $('#links2').removeClass('shrinked4');
                $('#links3').removeClass('shrinked4');
                $('#links4').removeClass('shrinked4');
                $('#header_ul').css("top","21");
                $('#profile_pic').removeClass('shrinked3');
                $('#header').removeClass('shrink_header');
                $('#test').removeClass('search_shrink');
                $('#more').removeClass('more_hide');
                
            }
        });


        $(document).ready(function() {     
        	
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
          
            /*$(document).ready(function(){
                var h = $('#suggestions').outerHeight();          //getting the height of the suggestion division
                var h1 = h+43;                                    //placing button 43px below the division
                $('#suggestions').css({height: h1+100});          //increasing the suggestion div height to avoid double scroll bar
                $('#next').css({top: h1});
                $('#prev').css({top: h1});
            });*/
            
        });
        $( function() {
            $( "#slider-range" ).slider({
              range: true,
              min: 18,
              max: 40,
              values: [ 20, 30 ],
              slide: function( event, ui ) {
            	$( "#price-min" ).val( ui.values[ 0 ] );
                $( "#price-max" ).val( ui.values[ 1 ] );
              }
            });
            $( "#price-min" ).val( $( "#slider-range" ).slider( "values", 0 ));
            $( "#price-max" ).val( $( "#slider-range" ).slider( "values", 1 ));
          } );
        
        $('#reset').click(function(){
            document.getElementById('search').reset();
            $('#price-min').val('18');
            $('#price-max').val('40');                        
            
            //alert(h);
            //var btn_pos = h;
            //$('#suggestions').css({height: 1400});
            //var btn_top = h * 4;
            //alert(h1);
        });
        console.log("Page : ${num}");
        console.log("numRow : ${numRow}");
    	if("${num}" == 1){
    		console.log('previous button hidden');
    		$('#prevBtn').css('display', 'none'); 
    	}
    	if("${numRow}" < 15){
    		console.log('next button hidden');
    		$('#nextBtn').css('display', 'none');
    	}
    	
    </script>
</body>

</html>
