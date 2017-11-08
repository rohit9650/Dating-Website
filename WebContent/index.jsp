<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="css/index.css">
  <link rel="stylesheet" href="css/footer.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
</head>

<body >
      
 

<!--					 Main Begin				-->

<main>
  <img class="video_back" src="http://cdn.cdtoimge.com/static/generated/lp/lp21817/ver9/video_screen.jpg?v=7798">

  <video class="video-background" preload="true" autoplay="autoplay" loop="loop" muted="muted">
    <source src="media/index_background.mp4" type="video/mp4">
  </video>

  <div class ="main-content" id="main-content">
      <header class="clear">
        <button class="log-in-btn" id="log-in-btn">SIGN IN</button>         
      </header>
      <img style="margin-left: 42.7%;" src="media/logo2.png">
      <div class="main-slogan">REAL PEOPLE. REAL FEELINGS. REAL DATING.</div>

      <div class="reg-btns-holder clear">
        <button class="button-e" id="button-e" style="vertical-align:middle">
          <span>Sign up with email </span>
        </button>
        <p class="or">or</p>
       	<div id="fbBtn">
	       <div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false">
	       </div>
      	</div>
      </div>
  </div>
</main>

<!-- 					Main End				-->


<div class="signin" id="signin">
  
  <a class="back-to-main-content" id="sign">X</a>
  
    
    
  <div class="signin-form" id="signin-form">
    <img src="media/logo(resized).jpg" alt="logo" class="logo"><br>
      <label id="sign-in-heading">Sign in</label>
    <button class="login-to-reg-btn" id="login-to-reg-btn">REGISTER</button>
    <div class="signin-form1" id="signin-form">
    
    <form action="validateLogin.jsp" method=POST>
      <label class="signin-label" style="margin-left: 65px">Email Address</label><input type="text" name="email" class="login-input"><br><br>
      <label class="signin-label" style="margin-left: 95px">Password</label><input type="password" name="password" class="login-input"><br><br>
      <input type="submit" name="Signin" value="Sign in" class="login-btn">
    </form>
    <br><br>
  </div>
  </div>
</div>


<div class="register" id="register">
  
  <a class="back-to-main-content" id="reg">X</a>
  
  
  <div class="register-form" id="register-form">
    <img src="media/logo(resized).jpg" alt="logo" class="logo"><br>
      <label id="register-heading">Register now and start the best dating</label>
    <button class="log-in-btn1" id="log-in-btn1">SIGN IN</button>
    <div class="register-form1" id="register-form">
    
    	
    	<jsp:useBean id="userInfo" class="bean.userInfoBean" scope="request">
    		<jsp:setProperty name="userInfo" property="*" />
    	</jsp:useBean>
        <form method=GET action="validateRegister.jsp">
        	<input type="hidden" name="submitted" value="true"/>
        	
        	<c:if test="${param.submitted && userInfo.userNameValid == false }" >
        	
        	
        	</c:if>
        	
      		<label class="signin-label" style="margin-left: 115px">Name :</label>
      		<input type="text" name="userName" class="login-input" id="userName"><br><br>
      		
      		<label class="signin-label" style="margin-left: 110px">Birthday :</label>
      		<c:if test="${param.submitted && userInfo.DOBMonthValid == false }" >
        	
        	
        	</c:if>
			<select name="DOBMonth" class="drop-down month" id="DOBMonth">
				<option> - Month - </option>
				<option value="1">January</option>
				<option value="2">Febuary</option>
				<option value="3">March</option>
				<option value="4">April</option>
				<option value="5">May</option>
				<option value="6">June</option>
				<option value="7">July</option>
				<option value="8">August</option>
				<option value="9">September</option>
				<option value="10">October</option>
				<option value="11">November</option>
				<option value="12">December</option>
			</select>
			
			<c:if test="${param.submitted && userInfo.DOBDayValid == false }" >
        	
        	
        	</c:if>
			<select name="DOBDay" class="drop-down day" id="DOBDay">
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
			
			<c:if test="${param.submitted && userInfo.DOBYearValid == false }" >
        	
        	
        	</c:if>
			<select name="DOBYear" class="drop-down year" id="DOBYear">
				<option> - Year - </option>
				<option value="2000">2000</option>
				<option value="1999">1999</option>
				<option value="1998">1998</option>
				<option value="1997">1997</option>
				<option value="1996">1996</option>
				<option value="1995">1995</option>
				<option value="1994">1994</option>
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
			
			<c:if test="${param.submitted && userInfo.emailValid == false }" >
        	
        	
        	</c:if>
      		<label class="signin-label" style="margin-left: 55px">Email Address :</label>
      		<input type="text" name="email" class="login-input" id="email"><br><br>
      		
      		<c:if test="${param.submitted && userInfo.passwordValid == false }" >
        	
        	
        	</c:if>
      		<label class="signin-label" style="margin-left: 88px">Password :</label>
      		<input type="password" name="password" class="login-input" id="password"><br><br>
      		
      		<c:if test="${param.submitted && userInfo.confirmPasswordValid == false }" >
        	
        	
        	</c:if>
      		<label class="signin-label" style="margin-left: 28px">Confirm Password :</label>
      		<input type="password" name="ConfirmPassword" class="login-input" id="confirmPassword"><br><br>
      		
      		
      		<label class="signin-label" style="margin-left: -84px">Gender :</label>
                <select name="gender" class="drop-down gender" id="gender">
                    <option value="0">Male</option>
                    <option value="1">Female</option>
                    <option value="2">Others</option>
                </select>
            <br><br>
      		<label class="signin-label" style="margin-left: -118px">Looking For :</label>
                <select name="lookingFor" class="drop-down looking-for" id="lookingFor">
                    <option value="0">Male</option>
                    <option value="1">Female</option>
                    <option value="2">Others</option>
                </select>
            <br><br>
            
            <c:if test="${param.submitted && userInfo.cityPincodeValid == false }" >
        	
        	
        	</c:if>
      		<label class="signin-label" style="margin-left: 40px">City Pincode :</label>
      		<input type="number" name="cityPincode" id="cityPinCode" class="login-input"><br><br>


      		<input type="submit" name="Signin" value="Start Now!" class="login-btn"/>
    	</form>
    </div>
  </div>
</div>

  <script type="text/javascript">
    $(document).ready(function(){
      $('#log-in-btn').click(function(){                          /* Sign In button Click */
        $('#main-content').css("display","none");
        $('#signin').addClass('active');
      });   

      $('#login-to-reg-btn').click(function(){
        $('#signin').removeClass('active');
        $('#register').addClass('active');
      });
		
      $('#button-e').click(function(){
    	  $('#main-content').css("display","none");
    	  $('#register').addClass('active');
      });
      
      $('#button-en').click(function(){
    	//  $("body").scrollTop(0);
    	  $('html,body').animate({scrollTop: $(".video_back").offset().top},'slow');    	
    	  $('#main-content').css("display","none");
    	  $('#register').addClass('active');
      });
          
      $('#log-in-btn1').click(function(){
        $('#register').removeClass('active');
        $('#signin').addClass('active');
      });

      $('#sign').click(function(){
        $('#signin').removeClass('active');
        $('#main-content').css("display","block");
      });

      $('#reg').click(function(){
        $('#register').removeClass('active');
        $('#main-content').css("display","block");
      });
    });
  </script>

<!--				 	Team Begin				-->

<div class="container">

            <div class="heading-title text-center">
                    <h3 class="text-uppercase">Our Lovely Team</h3>
                    <p class="p-top-30 half-txt">We're here for you, don't hesitate to contact any of us. We are more than happy to you be a part of our family.</p>
            </div>
            <div class="column_space">
            <div class="column">
                
                            <div class="team-member">
                                <div class="team-img">
                                    <img src="media/r2.jpg" alt="team member" class="img-responsive">
                                </div>
                                <div class="team-hover">
                                    <div class="desk">
                                        <h4>Hello World</h4>
                                        <p>I love to introduce myself as an enthusiast who brings ideas to application.</p>
                                    </div>
                                    <div class="s-link">
                                        <a href="https://www.facebook.com/profile.php?id=100008077091982"><i class="fa fa-facebook"></i></a>
                                        <a href="https://github.com/rohit9650" ><i class="fa fa-github"></i></a>
                                        <a href="https://www.linkedin.com/in/rohit-singh-8a68b9a6"><i class="fa fa-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="team-title">
                                <h5>Rohit Singh</h5>
                                <span>HR Manager</span>
                            </div>
                            <div class="team-member">
                            <div class="team-img">
                                 <img src="media/g2.jpg" alt="team member" class="img-responsive">
                            </div>
                            
                            <div class="team-hover">
                         	 <div class="test">
                                 <div class="desk">
                                      <h4>Hi There !</h4>
                                      <p>It is an Honour to be the person that helps people to come close to their love.</p>
                                  </div>
                                    <div class="s-link">
                                        <a href="https://www.instagram.com/gopika_pika/" ><i class="fa fa-instagram"></i></a>
                                        <a href="https://www.facebook.com/profile.php?id=100009807400614"><i class="fa fa-facebook"></i></a>
                                        <a href="https://plus.google.com/111759324072368546083" ><i class="fa fa-google"></i></a>
                                    </div>
                                </div>
                                </div>
                            </div>
                    <div class="team-title">
                            <h5>Gopika Arora</h5>
                                <span>founder &amp; ceo</span>
                    </div>
                            <div class="team-member">
                                <div class="team-img">
                                    <img src="media/r3.jpg" alt="team member" class="img-responsive">
                                </div>
                                <div class="team-hover">
                                    <div class="desk">
                                        <h4>I love to design</h4>
                                        <p>I love to introduce myself as a hardcore Web Designer.</p>
                                    </div>
                                    <div class="s-link">
                                        <a href="https://www.facebook.com/profile.php?id=100007398468921"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="https://www.facebook.com/profile.php?id=100008077091982"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="team-title">
                                <h5>Yashdeep Bachhas</h5>
                                <span>Designing Head</span>
                            </div>
                        </div>

                    </div>

    </div>

<!-- 				 	Team End				-->




<!-- 					Footer Begin			-->

<div class="footer">
    <br><br>
    <div id="top">
      <p>How to Get Started with Online Dating?</p>
    </div>
    <br><br>
    <div id="mid">
      <p>If you want to start to date singles today, it is time to get started with online dating tips. Setting up an online profile is easy. When you are filling out your profile information, make sure to be completely honest about yourself. Your goal is to meet a lot of people, so the people reading your profile will find out eventually that you are lying.<br>
      You should never attempt to trick someone into meeting you by using deception. The results of lying will never work out in your favor. Use a recent picture of yourself. It is natural to want to pick the most flattering picture of yourself, but make sure that it is at least an accurate representation of what you currently look like.<br>
      It is time to start sending messages to people in your area! Be original. If you just copy and paste the same message to every person you want to talk to, it will be obvious that you did not take a particular interest in them. Sending the personalized messages will make you seem more interested in each person and give you a much better chance of getting a response.<br>
      Don't be afraid to let your true personality shine through. The person wants to know the real you in order to see if you might be compatible. Ask questions to get to know the other person and find out if you are truly interested.</p>
    </div>
    <br>
    <div class="reg-btns-holder clear">
        <button class="button-e" id="button-en" style="vertical-align:middle">
          <span>Sign up with email </span>
        </button>
        <p class="or">or</p>
        <div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false">
       		
       </div>
      </div>
    <br>
    <hr>
    <table id="table">
      <tr>
        <td>About CatchUrMatch</td>
        <td>Community</td>
        <td>Find love</td>
        <td>Help</td>
      </tr>
      <tr>
        <td><a href="links.html#privacyPolicy"> Privacy Policy</a></td>
        <td><a href="links.html#chatRooms"> Chat Rooms</a></td>
        <td><a href="links.html#tandc"> Terms & Conditions</a></td>
        <td><a href="links.html#menLookingForWomen"> Men looking for women</a></td>
      </tr>
      <tr>
       
        <td><a href="links.html#aboutUs"> Contact Us</a></td>
        <td><a href="links.html#aboutUs"> About Us</a></td>
        <td><a href=""></a></td>
      </tr>
      <tr>
        <td><a href=""></a></td>
        <td><a href=""></a></td>
        
        <td><a href=""></a></td>
      </tr>
      <tr>
        
        <td><a href=""> </a></td>
        <td><a href=""></a></td>
        <td><a href=""> </a></td>
      </tr>
      <tr>
        
      </tr>
  </table>
    <div id="bottom">
      <p>Copyright © 2017 CatchUrMatch</p>
    </div>
</div>

<!-- 					Footer End				-->

</body>
<script type="text/javascript">
		
		  function autoClickSignIn(){
		    var type = window.location.hash.substr(1);
		    if(type == "includeLogin"){
		    	 $('#register').removeClass('active');
		    	$('#main-content').css("display","none");
	        	$('#signin').addClass('active');
		    	
		    }
		  }
		  window.onload = autoClickSignIn();
</script>
<script type="text/javascript">
		
		  function autoClickSignIn(){
		    var type = window.location.hash.substr(1);
		    if(type == "includeRegister"){
		    	$('#register').removeClass('active');
		    	$('#main-content').css("display","none");
	        	$('#register').addClass('active');
		    }
		  }
		  window.onload = autoClickSignIn();
</script>

<!-- HTTPS required. HTTP will give a 403 forbidden response -->
<script src="https://sdk.accountkit.com/en_US/sdk.js"></script>

<script>
//details




  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else {
      // The person is not logged into your app or we are unable to tell.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '880395132124885',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.8' // use graph api version 2.8
  });

  // Now that we've initialized the JavaScript SDK, we call 
  // FB.getLoginStatus().  This function gets the state of the
  // person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }
  
</script>

</html>
