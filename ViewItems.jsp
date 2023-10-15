<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Items Profile | SRMS</title>
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
    <!-- forms CSS
		============================================ -->
    <link rel="stylesheet" href="css/form/all-type-forms.css">
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
    /* accordion */
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
        <!-- Single pro tab review Start-->
        <div class="single-pro-review-area mt-t-30 mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="profile-info-inner">
                        <%
                        try{
                        	/* Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/srms","root","");
                        	String sql="select fullname,username,course,email,phone,gender,description from users where id"; */
                        	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/srms","root","");
                        	//String ids=(String)request.getAttribute("id");
                        	int id=Integer.parseInt(request.getParameter("id"));
                        	String sql="select * from items where id='"+id+"'";
                        	PreparedStatement ps=conn.prepareStatement(sql);
                        	ResultSet rst=ps.executeQuery();
                        	while(rst.next()){
                        		
                        %>
                        <form action="EditItemFile" method="post" enctype="multipart/form-data">
                            <div class="profile-img">
                            <iframe src="EditItemFile?id=<%=rst.getInt("id") %>" width="100%" height="300" frameborder="0"></iframe>
                                
                            </div>
                            <!-- <input type="file"name="files" > -->
                            <div class="file-upload-inner ts-forms">
                                                            <div class="input prepend-big-btn">
                                                                <label class="icon-right" for="prepend-big-btn">
																		<i class="fa fa-download"></i>
																	</label>
                                                                <div class="file-button">
                                                                    Browse
                                                                    <input type="file" onchange="document.getElementById('prepend-big-btn').value = this.value;"name="files"required>
                                                                </div>
                                                                <input type="text" id="prepend-big-btn" placeholder="no file selected">
                                                            </div>
                                                        </div>
                                                        <br/>
                                                        <input type="hidden" name="itemids" value="<%=rst.getInt("id") %>">
                                                        <div class="form-group">
                                                        <button class="form-control btn btn-default" type="submit">update</button>
                                                        </div>
                                                        </form>
                                                        
                            <div class="profile-details-hr">
                              
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="address-hr">
                                            <p><b>File Name</b><br /> <%=rst.getString("pname") %></p>
                                        </div>
                                    </div>
                                   <div class="col-lg-12">
                                        <div class="address-hr">
                                            <p><b>Description </b><br /><%=rst.getString("ptext") %></p>
                                        </div>
                                    </div>
                                </div>
     
                            </div>
                            
                            <%
                        	}
                        }catch(Exception e){
                        	e.printStackTrace();
                        }
                            %>
                        </div>
                    </div>
                    
                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                        <div class="product-payment-inner-st res-mg-t-30 analysis-progrebar-ctn">
                        <div class="error">
				${error}
				</div>
				<div class="success">
				${success} 
				</div>
                            <ul id="myTabedu1" class="tab-review-design">
                                <li class="active"><a href="#description">Update Details</a></li>
                                
                            </ul>
                            <div id="myTabContent" class="tab-content custom-product-edit st-prf-pro">
                                <div class="product-tab-list tab-pane fade active in" id="description">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="review-content-section">
                                            <%
                                           
                                            try{
                                            	/* Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/srms","root","");
                                            	String sql="select fullname,username,course,email,phone,gender,description from users where id"; */
                                            	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/srms","root","");
                                            	int id=Integer.parseInt(request.getParameter("id"));
                                            	String sql="select * from items where id='"+id+"'";
                                            	PreparedStatement ps=conn.prepareStatement(sql);
                                            	ResultSet rst=ps.executeQuery();
                                            	while(rst.next()){
                                            		
                                           
                                            %>
                                            <form action="EditItems" method="post">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="form-group">
                                                            <input name="itemname" type="text" class="form-control" placeholder="Product Name" value="<%=rst.getString("pname")%>" >
                                                        </div>
                                                    
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="form-group sm-res-mg-15 tbpf-res-mg-15">
                                                            <textarea class="form-control" placeholder="write something here ...(optional)" name="descs"><%=rst.getString("ptext")%></textarea>
                                                        </div>
                                                      <input type="hidden" name="myitem" value="<%=rst.getInt("id") %>"/>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="payment-adress mg-t-15">
                                                            <button type="submit" class="btn btn-primary waves-effect waves-light mg-b-15">Update</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                </form>
                                                 <%
                        	}
                        }catch(Exception e){
                        	e.printStackTrace();
                        }
                            %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
    <script src="js/sparkline/jquery.sparkline.min.js"></script>
    <script src="js/sparkline/jquery.charts-sparkline.js"></script>
    <!-- calendar JS
		============================================ -->
    <script src="js/calendar/moment.min.js"></script>
    <script src="js/calendar/fullcalendar.min.js"></script>
    <script src="js/calendar/fullcalendar-active.js"></script>
    <!-- tab JS
		============================================ -->
    <script src="js/tab.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="js/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="js/main.js"></script>
   
</body>
</html>