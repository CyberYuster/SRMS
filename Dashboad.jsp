<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Welcome Dashboard | SRMS</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="picha/open-book.png">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="css/normalize.css">
    <!-- meanmenu icon CSS
		============================================ -->
    <link rel="stylesheet" href="css/meanmenu.min.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="css/main.css">
    <!-- educate icon CSS
		============================================ -->
    <link rel="stylesheet" href="css/educate-custon-icon.css">
    <!-- morrisjs CSS
		============================================ -->
    <link rel="stylesheet" href="css/morrisjs/morris.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- metisMenu CSS
		============================================ -->
    <link rel="stylesheet" href="css/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="css/metisMenu/metisMenu-vertical.css">
    <!-- calendar CSS
		============================================ -->
    <link rel="stylesheet" href="css/calendar/fullcalendar.min.css">
    <link rel="stylesheet" href="css/calendar/fullcalendar.print.min.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    <style type="text/css">
   /*  message notification styling */
    .time-right {
 float: right;
 color: #aaa;
        }
        .chat-message {
  display: flex;
  align-items: flex-start;
  max-width: 100%;
  margin: 10px;
  position: relative;
  padding: 10px;
  background-color: #f0f0f0;
  border-radius: 10px;
}
.message-content {
  flex: 1;
  margin-right: 10px;
}

.message-text {
  margin: 0;
}
    </style>
</head>
<body>
<!-- Start Left menu area -->
    <div class="left-sidebar-pro">
        <nav id="sidebar" class="">
            <div class="sidebar-header">
                <a href="Dashboad.jsp"><img class="main-logo" src="picha/read.png" style="width:35px;" alt="" /></a>
                <strong><a href="Dashboad.jsp"><img src="picha/open-book.png"style="width:35%;" alt="" /></a></strong>
            </div>
            <div class="left-custom-menu-adp-wrap comment-scrollbar">
                <nav class="sidebar-nav left-sidebar-menu-pro">
                    <ul class="metismenu" id="menu1">
                        <li class="active">
                            <a class="has-arrow" href="Dashboad.jsp">
								   <span class="educate-icon educate-home icon-wrap"></span>
								   <span class="mini-click-non">Education</span>
								</a>
                            <ul class="submenu-angle" aria-expanded="true">
                                <li><a title="Dashboard" href="Dashboad.jsp"><span class="mini-sub-pro">Dashboard</span></a></li>
                                
                            </ul>
                        </li>
                        <li>
                            <a title="Items" href="Register_Item.jsp" target="Dashboad" aria-expanded="false"><span class="educate-icon educate-course icon-wrap" aria-hidden="true"></span> <span class="mini-click-non">Register Items</span></a>
                        </li>
                        <li><a title="View Items" href="UserItems.jsp" target="Dashboad" aria-expanded="false"><span class="mini-sub-pro educate-icon educate-student icon-wrap" aria-hidden="true"></span><span class="mini-click-non">Transaction</span></a></li>
                         <li><a title="messages response" href="Responses.jsp" target="Dashboad" aria-expanded="false"><span class="educate-icon educate-interface icon-wrap" aria-hidden="true"></span><span class="mini-click-non">Messages</span></a></li>
                      
                    </ul>
                </nav>
            </div>
        </nav>
    </div>
    <!-- End Left menu area -->
    <!-- Start Welcome area -->
    
    <div class="all-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="logo-pro">
                        <a href="Dashboad.jsp"><img class="main-logo" src="picha/read.png" style="width:5%;" alt="" /></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-advance-area">
            <div class="header-top-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="header-top-wraper">
                                <div class="row">
                                    <div class="col-lg-1 col-md-0 col-sm-1 col-xs-12">
                                        <div class="menu-switcher-pro">
                                            <button type="button" id="sidebarCollapse" class="btn bar-button-pro header-drl-controller-btn btn-info navbar-btn">
													<i class="educate-icon educate-nav"></i>
												</button>
                                        </div>
                                    </div>
                                  
                                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                        <div class="header-right-info">
                                            <ul class="nav navbar-nav mai-top-nav header-right-menu">
                                                
                                                <li class="nav-item"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><i class="educate-icon educate-bell" aria-hidden="true"></i><span class="indicator-nt" id="notify">0</span></a>
                                                    <div role="menu" class="notification-author dropdown-menu animated zoomIn">
                                                        <div class="notification-single-top">
                                                            <h1>Notifications</h1>
                                                        </div>
                                                        <ul class="notification-menu">
                                                            <li>
                                                            <%
                                                          try{
                                                        	  Class.forName("com.mysql.cj.jdbc.Driver");
                                                        	 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/srms","root","");
                                                        	 int loggeduser=(int)request.getSession().getAttribute("uid");
                                                        	 String sql="select tid,sender_id,receiver_id,pid,notifyUser,t.date_on_create,pname,fullname,profile_img from users u,items i,transaction t where(receiver_id='"+loggeduser+"'and (notifyUser=1)) and (pid=i.id and sender_id=u.id)";
                                                         PreparedStatement ps=conn.prepareStatement(sql);
                                                         ResultSet rst=ps.executeQuery();
                                                         while(rst.next()){
                                                        	 
                                                         
                                                          %>
                                                                <a href="ViewResponse.jsp?id=<%=rst.getInt("tid") %>"target="Dashboad">
                                                                   
                                                                    <div class="chat-message">

        <img src="EditProfilePicture?id=<%=rst.getInt("sender_id") %>" style="width:15%;" onerror="this.onerror=null;this.src='picha/read.png';">
        <div class="message-content">
            
          <p class="message-text">
            &nbsp;&nbsp;&nbsp; item name : <%=rst.getString("pname") %>
          </p>
          <span class="time-right"><%=rst.getTime("date_on_create") %></span>
        </div>
        <p style="color:green"><%=rst.getString("fullname") %></p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
      </div>
                                                                </a>
                                                                <%
                                                         }
                                                          }catch(Exception e){
                                                        	  e.printStackTrace();
                                                          }
                                                                %>
                                                            </li>
                                                           
                                                            
                                                        </ul>
                                                        
                                                    </div>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle">
															 <%
                                                          try{
                                                        	  Class.forName("com.mysql.cj.jdbc.Driver");
                                                        	 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/srms","root","");
                                                        	 int loggeduser=(int)request.getSession().getAttribute("uid");
                                                        	 String sql="select * from users where id='"+loggeduser+"'";
                                                         PreparedStatement ps=conn.prepareStatement(sql);
                                                         ResultSet rs=ps.executeQuery();
                                                         while(rs.next()){
                                                        	 
                                                         
                                                          %>
															<img src="EditProfilePicture?id=<%=rs.getInt("id") %>" alt="" onerror="this.onerror=null;this.src='picha/read.png';" />
															<%
                                                         }
                                                          }catch(Exception e){
                                                        	  e.printStackTrace();
                                                          }
                                                                %>
															<span class="admin-name"> <b>welcome : </b> ${user} </span>
															<!-- <i class="fa fa-angle-down edu-icon edu-down-arrow"></i> -->
														</a>
                                                    <ul role="menu" class="dropdown-header-top author-log dropdown-menu animated zoomIn">
                                                    
                                                        <li><a href="StudentProfile.jsp" target="Dashboad"><span class="edu-icon edu-user-rounded author-log-ic"></span>My Profile</a>
                                                        </li>
                                                        
                                                        <li><a href="Login.jsp"><span class="edu-icon edu-locked author-log-ic"></span>Log Out</a>
                                                        </li>
                                                    </ul>
                                                    </li>
                                               
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Mobile Menu start -->
            <div class="mobile-menu-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="mobile-menu">
                                <nav id="dropdown">
                                    <ul class="mobile-menu-nav">
                                        <li><a data-toggle="collapse" data-target="#Charts" href="#">Home <span class="admin-project-icon edu-icon edu-down-arrow"></span></a>
                                            <ul class="collapse dropdown-header-top">
                                                <li><a href="Dashboad.jsp">Dashboard</a></li>
                                                
                                            </ul>
                                        </li>
                                        <li><a href="Register_Item.jsp"target="Dashboad">Register Items</a></li>
                                        <li><a href="UserItems.jsp"target="Dashboad">Transactions</a></li>
                                     <li><a href="Responses.jsp"target="Dashboad">Messages</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Mobile Menu end -->
            <div class="breadcome-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                           
                            <iframe height="630px" width="100%" src="dashboadpage.jsp"name="Dashboad"style="border:none;"></iframe>
                        </div>
                     
                    </div>
                   
                </div>
                
            </div>
           
        </div>
       
    </div>
<!-- notification badge codes -->
<script type="text/javascript">
function loadNotification(){
	setInterval(function(){
const xhttp=new XMLHttpRequest();
xhttp.onload=function(){
	document.getElementById("notify").innerHTML=this.responseText;	
}
xhttp.open("GET","notifier.jsp",true);
xhttp.send();
},1000);
}
loadNotification();
</script>

    <!-- jquery
		============================================ -->
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="js/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="js/jquery-price-slider.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="js/jquery.meanmenu.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- sticky JS
		============================================ -->
    <script src="js/jquery.sticky.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="js/jquery.scrollUp.min.js"></script>
    <!-- counterup JS
		============================================ -->
    <script src="js/counterup/jquery.counterup.min.js"></script>
    <script src="js/counterup/waypoints.min.js"></script>
    <script src="js/counterup/counterup-active.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/scrollbar/mCustomScrollbar-active.js"></script>
    <!-- metisMenu JS
		============================================ -->
    <script src="js/metisMenu/metisMenu.min.js"></script>
    <script src="js/metisMenu/metisMenu-active.js"></script>
    <!-- morrisjs JS
		============================================ -->
    <script src="js/morrisjs/raphael-min.js"></script>
    <script src="js/morrisjs/morris.js"></script>
    <script src="js/morrisjs/morris-active.js"></script>
    <!-- morrisjs JS
		============================================ -->
    <script src="js/sparkline/jquery.sparkline.min.js"></script>
    <script src="js/sparkline/jquery.charts-sparkline.js"></script>
    <script src="js/sparkline/sparkline-active.js"></script>
    <!-- calendar JS
		============================================ -->
    <script src="js/calendar/moment.min.js"></script>
    <script src="js/calendar/fullcalendar.min.js"></script>
    <script src="js/calendar/fullcalendar-active.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="js/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="js/main.js"></script>
</body>
</html>