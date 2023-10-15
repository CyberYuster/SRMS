<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard | Responses</title>
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
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
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.css">
    <link rel="stylesheet" href="css/owl.transitions.css">
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
    
    <style> 
        /* chat message gpt */
        .chat-message {
  display: flex;
  align-items: flex-start;
  max-width: 80%;
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

.delete-button {
  background: none;
  border: none;
  color: #999;
  font-size: 18px;
  cursor: pointer;
  position: absolute;
  top: 5px;
  right: 5px;
  display: none;
}

.chat-message:hover .delete-button {
  display: block;
}
.time-right {
 float: right;
 color: #aaa;
        }
</style>
</head>
<body>
<div class="">   
        <div class="header-advance-area">
            <div class="breadcome-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="breadcome-list">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="breadcome-heading">
                                            <form role="search" class="sr-input-func" action="" method="get">
                                                <input type="text" name="search" placeholder="Search..." class="search-int form-control">
                                                <!-- <a href="#"><i class="fa fa-search"></i></a> -->
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <ul class="breadcome-menu">
                                            <li><a href="#">SRMS</a> <span class="bread-slash">/</span>
                                            </li>
                                            <li><span class="bread-blod">Messages</span>
                                            </li>
                                        </ul>
                                    </div>
                                    
                                </div>
                              
                            </div>
                            <!-- body here... -->
                        </div>
                     
                    </div>
                   
                </div>
                
            </div>
           
        </div>
        
        <!-- chat message -->
        <%
        try{
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/srms","root","");
        	//int id=Integer.parseInt(request.getParameter("id"));
        	int ids=(int)request.getSession().getAttribute("uid");
        	String type=request.getParameter("search");
        	String sql;
        	if(type==null){
        	sql="select tid,sender_id,receiver_id,pid,notifyUser,t.date_on_create,pname,fullname,ptext,profile_img from users u,items i,transaction t where(notifyUser=-1 and receiver_id=?) and (pid=i.id and sender_id=u.id)";
        	}else{
        		sql="select tid,sender_id,receiver_id,pid,notifyUser,t.date_on_create,pname,fullname,ptext,profile_img from users u,items i,transaction t where((notifyUser=-1 and receiver_id=?) and (pid=i.id and sender_id=u.id)) and (tid like '%"+type+"%' or sender_id like '%"+type+"%' or receiver_id like '%"+type+"%' or pid like '%"+type+"%' or notifyUser like '%"+type+"%' or t.date_on_create like '%"+type+"%' or pname like '%"+type+"%' or fullname like '%"+type+"%' or ptext like '%"+type+"%' or profile_img like '%"+type+"%') order by t.date_on_create desc";
        	}
        	
        	PreparedStatement pmt=conn.prepareStatement(sql);
        	pmt.setInt(1,ids);
        	ResultSet rt=pmt.executeQuery();
        	while(rt.next()){
        		 %>
  <a href="ViewResponse.jsp?id=<%=rt.getInt("tid")%>"target="Dashboad">      
<div class="chat-message" id="<%=rt.getInt("tid")%>">

    <img src="EditProfilePicture?id=<%=rt.getInt("sender_id")%>" alt="Avatar" style="width:5%;" onerror="this.onerror=null;this.src='picha/read.png';">
    <div class="message-content">
        
      <p class="message-text">
        &nbsp;&nbsp;&nbsp; <%=rt.getString("ptext") %>
      </p>
      <span class="time-right"><%=rt.getTimestamp("date_on_create") %></span>
    </div>
    <p><%=rt.getString("fullname") %></p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    <button class="delete-button" aria-label="Delete" onclick="confirmDelete(event)">
      <span aria-hidden="true">&times;</span>
    </button>
    
  </div>
  </a>
  <%
        	}
        }catch(Exception e){
        	e.printStackTrace();
        }
  %>
  <script>
  function confirmDelete(event) {
	 // event.preventDefault();
	  // Ask for confirmation using the built-in "confirm" dialog
	  const isConfirmed = confirm('Are you sure you want to delete this message?');

	  if (isConfirmed) {
		  event.preventDefault();
	    // If user confirms, hide the chat message card
	    const messageCard = event.target.closest('.chat-message');
	    messageCard.style.display = 'none';
	    
	    var mcards=document.querySelectorAll(".chat-message");
	    mcards.forEach(function(chat-message){
	    	chat-message.addEventListener("click",function(){
	    		var cardId=this.id;
	    		console.log("clicked message card id : ",cardId);
	    		var xhr=new XMLHttpRequest();
	    	    xhr.open('GET',"DeleteResponseMessage?id="+cardId+"",true);
	    	    xhr.send();
	    	});
	    });
	    
	  } else {
	    // If user cancels, show the chat message card
	    const messageCard = event.target.closest('.chat-message');
	    messageCard.style.display = 'flex';
	  }
	}
  </script>
        <div class="footer-copyright-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer-copy-right">
                            <p>Copyright © 2023. All rights reserved. Template by <a href="#">cyberyuster</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     
    </div>

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
    
    <!-- plugins JS
		============================================ -->
    <script src="js/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="js/main.js"></script>
</body>
</html>