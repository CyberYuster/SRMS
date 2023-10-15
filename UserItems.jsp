<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"%>
     <%@ page import="java.sql.*" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard | UserItems</title>
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
.card {
  width: 500px;
  border: 1px solid #ccc;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  margin: 20px;
}

.card-header {
  background-color: #007bff;
  color: #fff;
  padding: 10px;
  position: relative;
}

.card-title {
  margin: 0;
}

.close-button {
  background: none;
  border: none;
  color: #fff;
  font-size: 24px;
  cursor: pointer;
  position: absolute;
  top: 5px;
  right: 10px;
}

.card-body {
  padding: 10px;
}
.container {
  display: flex;
  justify-content: center;
  align-items: center;
}
.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
}

.active, .accordion:hover {
  background-color: #ccc; 
}

.panel {
  padding: 0 18px;
  display: none;
  background-color: white;
  overflow: hidden;
}

.success{
    color:green;
    }
    .error{
    color:red;
    }
    </style>
</head>
<body>

<div class="">   
        <div class="header-advance-area">
            <div class="breadcome-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcome-list">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="breadcome-heading">
                                            <form role="search" class="sr-input-func" action=""method="get">
                                                <input type="text" name="search" placeholder="Search..." class="search-int form-control">
                                                <!-- <a href="#"><i class="fa fa-search submit"></i></a> -->
                                                
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <ul class="breadcome-menu">
                                            <li><a href="#">SRMS</a> <span class="bread-slash">/</span>
                                            </li>
                                            <li><span class="bread-blod">Items</span>
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
        <div class="error">
        ${error}
        </div>
        <div class="success">
        ${success}   
        </div>
        
        <%
//Connection conn=(Connection)application.getAttribute("connection");
 try{
	 
 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/srms","root","");
 int id=(int)request.getSession().getAttribute("uid");
 String sql;
 String type=request.getParameter("search");
 if(type==null){
	 sql="select i.id,pname,ptext,date_on_create,file,fullname from items i,users u where (userId='"+id+"' and userId=u.id) and i.softdelete=1 order by date_on_create desc";
 }else{
	 sql="select i.id,pname,ptext,date_on_create,file,fullname from items i,users u where (userId='"+id+"' and userId=u.id) and(i.softdelete=1 and (i.id like '%"+type+"%' or pname like '%"+type+"%' or ptext like '%"+type+"%' or date_on_create like '%"+type+"%' or file like '%"+type+"%' or fullname like '%"+type+"%'))order by date_on_create desc";
 }

 PreparedStatement pst=conn.prepareStatement(sql);
 ResultSet rs=pst.executeQuery();
 while(rs.next()){
	 request.getSession().setAttribute("data","available");
 %>
         <div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
   
   <div class="card" id="<%=rs.getInt("id") %>">
  
    <a href="ViewItems.jsp?id=<%=rs.getInt("id") %>">
    
    <input type="hidden" name="value" value="<%=rs.getInt("id") %>" id="data">
    
        <div class="card-header">
          <h5 class="card-title"><%=rs.getString("date_on_create")%> &nbsp &nbsp &nbsp <%=rs.getString("pname")%></h5>
          <button type="button" class="close-button" aria-label="Close" onclick="confirmDelete(event)">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="card-body">
            <iframe src="EditItemFile?id=<%=rs.getInt("id") %>" width="100%" height="300" frameborder="0"></iframe>

         
              <button class="accordion">more details</button>
<div class="panel">
  <p><%=rs.getString("ptext") %></p>
</div>
          <form action="MakeNotification" method="post">
           
            <div class="form-group">
            
              <label for="exampleSelect">Select a student:</label>
             
              
               <select class="form-control" name="users" id=""onclick="preventRedirect(event);">
              <%
              try{
            	  
             // Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/srms","root","");
             int ids=(int)request.getSession().getAttribute("uid");
              String data="select id,fullname from users where id <> '"+ids+"'";
              PreparedStatement p=conn.prepareStatement(data);
              ResultSet r=p.executeQuery();
              while(r.next()){
              %>
     
                <option value="<%=r.getInt("id")%>"><%=r.getString("fullname") %> </option>
                
                  <% }}
              catch(Exception e){e.printStackTrace();}
            	   %>
                
             
                </select>
           
            </div>
              <input type="hidden" name="products" value="<%=rs.getInt("id")%>">
            <button type="submit" class="btn btn-primary">SEND</button>
          </form>
        </div>
        </a>
       
      </div>
      
    </div>
    <%}
 }catch(Exception p){
		p.printStackTrace();
	 }
       %>
       <%-- <c:if test="${data ne available}">
       <img src="picha/notfound.png" style="width:100%">
        </c:if> --%>
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
<script>
function confirmDelete(event) {
	  // Ask for confirmation using the built-in "confirm" dialog
	  const isConfirmed = confirm('Are you sure you want to delete this message?');

	  if (isConfirmed) {
		  event.preventDefault();
	    // If user confirms, hide the chat message card
	    const messageCard = event.target.closest('.card');
	    messageCard.style.display = 'none';
	    // send a notifier to file on server
	    var values=document.getElementById("data");
	 
	    var cards=document.querySelectorAll(".card");
	    cards.forEach(function(card){
	    	card.addEventListener("click",function(){
	    		var cardId=this.id;
	    		console.log("clicked card id : ",cardId);
	    		var xhr=new XMLHttpRequest();
	    	    xhr.open('GET',"DeleteItem?id="+cardId+"",true);
	    	    xhr.send();
	    	});
	    });
	   
	      
	  } else {
		  event.preventDefault();
	    // If user cancels, show the chat message card
	    const messageCard = event.target.closest('.card');
	    messageCard.style.display = 'block';
	  }
	}

var acc = document.getElementsByClassName("accordion");
var i;

//for (i = 0; i < acc.length; i++) {
  acc[0].addEventListener("click", function(event) {
    event.preventDefault();
	  this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
      event.preventDefault();
    } else {
      panel.style.display = "block";
      event.preventDefault();
    }
    event.preventDefault();
  });
   // preventing page redirect
   function preventRedirect(event){
	   event.preventDefault();
   }
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
    
    <!-- plugins JS
		============================================ -->
    <script src="js/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="js/main.js"></script>
</body>
</html>