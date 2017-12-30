<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<html>
    <head>
            <title>Sahi Sahi Laga lo</title>
            <!-- Compiled and minified CSS -->
           <link rel="shortcut icon" href="logo1.png">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
          <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <!-- Compiled and minified JavaScript -->
             <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
             <meta charset="utf-8">
            
            <meta name="viewport" content="width=device-width, initial-scale=1">
            
           <link rel="stylesheet" href="main.css">
           <link rel="stylesheet" href="style.css">
           <script src="https://apis.google.com/js/api.js"></script> 
          
         
         <script>
  $(window).ready(function() {
 
  // Fakes the loading setting a timeout
    setTimeout(function() {
        $('body').addClass('loaded');
    }, 2500);
 
});
</script>
         
       
       <script>
  // This is called with the results from from FB.getLoginStatus().
           function statusChangeCallback(response) {
               var hfd_access;
    
    
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
   if (response.status === 'connected') {
       //Logged into your app and Facebook.
       hfd_access = document.getElementById('<%= AccessHfd.ClientID%>');
       hfd_access.value = response.status;
       testAPI();
      
     
       
        
    } else {
       // The person is not logged into your app or we are unable to tell.
       console.log("login Inn again");
        hfd_access = document.getElementById('<%= AccessHfd.ClientID%>');
       hfd_access.value = response.status;
       
      
       
     
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

           window.fbAsyncInit = function () {
               FB.init({
                   appId: '1958663314414523',
                   cookie: true,  // enable cookies to allow the server to access 
                   // the session
                   xfbml: true,  // parse social plugins on this page
                   version: 'v2.8' // use graph api version 2.8
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

               function loginmain() {
                   FB.login(function (response) {


                      
                   }, {scope: 'email,user_likes'});
               }
               // Load the SDK asynchronously
               (function (d, s, id) {
                   var js, fjs = d.getElementsByTagName(s)[0];
                   if (d.getElementById(id)) return;
                   js = d.createElement(s); js.id = id;
                   js.src = "//connect.facebook.net/en_US/sdk.js";
                   fjs.parentNode.insertBefore(js, fjs);
               }(document, 'script', 'facebook-jssdk'));
           
               var hfd;
               var hfd_id;
               // Here we run a very simple test of the Graph API after login is
               // successful.  See statusChangeCallback() for when this call is made.
               function testAPI() {
                
                     
                   FB.api('/me?fields=id,name,email', function (response) {
                 
                        hfd_name = document.getElementById('<%= HiddenField2.ClientID%>');
                       hfd_id = document.getElementById('<%= HiddenField1.ClientID%>');
                       var email = document.getElementById('<%= Email_hfd.ClientID%>');
                       //console.log(response.id);
                    
                       email.value = response.email;
                       console.log(response.email);
                       console.log(response.name);
                       hfd_id.value = response.id;
                       hfd_name.value = response.name;
                       image();
                      
                      

                });
               }

           function image(){
               FB.api(
        "/"+hfd_id.value+"/picture",
        function (response) {
            hfd = document.getElementById('<%= HiddenField3.ClientID%>');
            hfd.value = response.data.url;
            //hfd.value=response.
            
            if (response && !response.error) {
                /* handle the result */
            }
        }
    );
          }
               function logoutmain() {
                   FB.logout(function (response) {
                       console.log("log out success");

                   });
               }
           
               
</script>
  
<script>
    // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
            $(document).ready(function(){
            
            $('.modal').modal();
            });
</script>

 <style>
            h4{
                 color: red;
                text-align: center;
             }

             .modalcenteralign{
                 margin-left: 30% !important;
             }
             .modalmargin{
                margin: -1% !important;
             }
             .modalwidth{
                 width:635px !important;
             }
             .bg {
         background-image: url("card.jpg");
         opacity:0.6;
     }
     .bg1 {
         background-image: url("2.jpg");
         background-size: 1400px 700px;
         opacity:0.6;
     }
     .bg2 {
         background-image: url("3.jpg");
          background-size: 1400px 700px;
         opacity:0.6;
     }
     .bg3 {
         background-image: url("4.jpg");
          background-size: 1400px 700px;
         opacity:0.6;
     }
 h2 {
   -webkit-text-stroke: 2px black;
}

     @media(max-width:1330px) and (min-width:1024px) {

         .nav {
             margin-left: 49% !important;
         }

         @media(max-width:1330px) and (min-width:1024px) {
         }
     }
        </style>
    </head>
<body>
<form runat="server">
<div id="content">
        <div class="navbar-fixed ">
                <nav>
                  <div class="nav-wrapper pol color_navbar">
                  <img src="logo1.png" style="width:50px; height:50px; margin-top:5px; margin-left:5px" />
                                        <div style="margin-top:-40px; margin-top:-55px">
                      <a id="xyzx" style="font-size:25px; margin-top:0.6%;margin-left:52px" class="navbar-brand" href="#">SAHI SAHI LAGALO!!</a> 
                    <a class="waves-effect waves-light btn color_button_signup nav modal-trigger"  href="#modal1">Login</a>
                      OR
                      <a class=" waves-effect waves-light color_button_login btn modal-trigger "  href="#modal2">Signup</a>
                  </div>
                </nav>
              </div> 
             <!-- Modal Structure -->
  <div class="container">
            <div id="modal2" class="modal modalwidth ">
               <div class="modal-content">
                    <div id="login-box">
                            <div class="left">
                              <h1>Sign up</h1>
                              
                              <input type="text" name="username" id="Name" runat="server" placeholder="Username" />
                              <input type="text" name="email" runat="server" id="email_form" placeholder="E-mail" />
                              <input type="password" name="password" runat="server" id="password_form" placeholder="Password" />
                              <input type="password" name="password2" runat="server" placeholder="Retype password" />
                              
                                <asp:Button ID="submit_btn" runat="server" OnClick="submit_Click" Text="Sign me up" />
                            </div>
                            
                            <div class="right_modal">
                              <span class="loginwith">Sign in with<br />social network</span>
                              
                              <button class="social-signin facebook" onclick="loginmain();" onserverclick="Unnamed_ServerClick" runat="server">Log in with facebook</button>
                              
                         
                            </div>
                            <div class="or">OR</div>
                          </div>
            </div>
        </div>
  </div>
  

              <!-- Modal 2 Structure -->
  <div class="container">
            <div id="modal1" class="modal modalwidth ">
               <div class="modal-content" style="height: 410px;">
                    <div id="register-box">
                            <div class="left" style="margin-left:-10px">
                              <h1>Login</h1>
                              
                              
                              <input type="text" name="email" runat="server" id="Text2" placeholder="E-mail" />
                              <input type="password" name="password" runat="server" id="password1" placeholder="Password" />
                            
                              
                                <asp:Button ID="Button2" style="margin-left: 42px;margin-top: 32px;" runat="server" OnClick="Button2_Click" Text="Login" />
                            </div>
                            <div class="right_modal" style="width: 363px; height: 410px;">
                            <button class="social-signin facebook" onclick="loginmain();" onserverclick="Unnamed_ServerClick" runat="server">Log in with facebook</button>
                            </div>
                          </div>
            </div>
        </div>
  </div>
  
<div class="css-slider-wrapper">
    
    <input type="radio" name="slider" class="slide-radio1" checked id="slider_1">
    <input type="radio" name="slider" class="slide-radio2" id="slider_2">
    <input type="radio" name="slider" class="slide-radio3" id="slider_3">
    <input type="radio" name="slider" class="slide-radio4" id="slider_4">
    
    
    <div class="slider-pagination">
        <label for="slider_1" class="page1"></label> 
        <label for="slider_2" class="page2"></label>
        <label for="slider_3" class="page3"></label>
        <label for="slider_4" class="page4"></label>
    </div>
    
    <div class="next control">
        <label for="slider_1" class="numb1"><i class="fa fa-arrow-circle-right"></i></label>
        <label for="slider_2" class="numb2"><i class="fa fa-arrow-circle-right"></i></label>
        <label for="slider_3" class="numb3"><i class="fa fa-arrow-circle-right"></i></label>
        <label for="slider_4" class="numb4"><i class="fa fa-arrow-circle-right"></i></label>
    </div>
    <div class="previous control">
        <label for="slider_1" class="numb1"><i class="fa fa-arrow-circle-left"></i></label>
        <label for="slider_2" class="numb2"><i class="fa fa-arrow-circle-left"></i></label>
        <label for="slider_3" class="numb3"><i class="fa fa-arrow-circle-left"></i></label>
        <label for="slider_4" class="numb4"><i class="fa fa-arrow-circle-left"></i></label>
    </div>
    
    
    <div class="slider slide1 bg " >
        <div>
            <h2 style="color:white; text-">Split the bill easily and nicely!</h2>
            <a href="#" class="button"></a> 
        </div>
    </div>
    <div class="slider slide2 bg1">
        <div>
            <h2>No more forgetting dues!</h2>
            <a href="#" class="button"></a> 
        </div>
    </div>
    <div class="slider slide3 bg2">
        <div>
            <h2>With the best functionality</h2>
            <a href="#" class="button"></a>
        </div>
    </div>
    <div class="slider slide4 bg3">
        <div>
            <h2>Next time when your friend says "Sahi Sahi Laga Lo!", You know where to come! :P</h2>
            <a href="#" class="button"></a>
        </div>
    </div>
<div id="loader-wrapper">
  <div id="loader"></div>
  
  <div class="loader-section section-left"></div>
  <div class="loader-section section-right"></div>
  
</div>

    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    <asp:HiddenField ID="HiddenField2" runat="server" />
    <asp:HiddenField ID="HiddenField1" runat="server" />
     <asp:HiddenField ID="HiddenField3" runat="server" />
     <asp:HiddenField ID="Email_hfd" runat="server" />
     <asp:HiddenField ID="AccessHfd" runat="server" />
    <asp:Label ID="Label1" Style="width:200px; margin-top:30px" runat="server"></asp:Label>
    </form>


  

</body>
</html>