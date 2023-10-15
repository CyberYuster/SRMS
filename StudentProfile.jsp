<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Student Profile | SRMS</title>
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
                    	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/srms","root","");
                    	int id=(int)request.getSession().getAttribute("uid");
                    	String sql="select id,fullname,username,course,email,phone,gender,description from users where id='"+id+"'";
                    	PreparedStatement pst=conn.prepareStatement(sql);
                    	ResultSet rs=pst.executeQuery();
                    	while(rs.next()){
                    		
                    %>
                            <div class="profile-img">
                             <input type="file" id="imageInput" style="display: none;">
                          
                          <img src="EditProfilePicture?id=<%=rs.getInt("id") %>" id="clickableImage" alt="Click Me" onerror="this.onerror=null;this.src='picha/read.png';" onclick="chooseImage()" accept="image/*">
                                
                            </div>
                            <div class="profile-details-hr">
                           
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-6">
                                        <div class="address-hr">
                                            <p><b>UserName</b><br /><%=rs.getString("username") %></p>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-6">
                                        <div class="address-hr tb-sm-res-d-n dps-tb-ntn">
                                            <p><b>Course</b><br /> <%=rs.getString("course") %></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-6">
                                        <div class="address-hr">
                                            <p><b>Email ID</b><br /> <%=rs.getString("email") %></p>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-6">
                                        <div class="address-hr tb-sm-res-d-n dps-tb-ntn">
                                            <p><b>Phone</b><br /> <%=rs.getString("phone") %></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="address-hr">
                                            <p><b>Description</b><br />  <%=rs.getString("description") %></p>
                                        </div>
                                    </div>
                                </div>
                                
                                      <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-6">
                                        <div class="address-hr">
                                            <p><b>Gender</b><br /><%=rs.getString("gender") %></p>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-6">
                                        <div class="address-hr tb-sm-res-d-n dps-tb-ntn">
                                            <p><b>Full Name</b><br /><%=rs.getString("fullname") %></p>
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
                                            	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/srms","root","");
                                            	int id=(int)request.getSession().getAttribute("uid");
                                            	String sql="select fullname,username,course,dob,email,phone,gender,description from users where id='"+id+"'";
                                            	PreparedStatement pst=conn.prepareStatement(sql);
                                            	ResultSet rs=pst.executeQuery();
                                            	while(rs.next()){
                                            %>
                                            <form action="EditProfile" method="post">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="form-group">
                                                            <input name="fullname" type="text" class="form-control" placeholder="Full Name" value="<%=rs.getString("fullname") %>">
                                                        </div>
                                                        <div class="form-group">
                                                            <input name="username" type="text" class="form-control" placeholder="UserName" value="<%=rs.getString("username") %>">
                                                        </div>
                                                        <div class="form-group">
                                                            <input name="email"type="text" class="form-control" placeholder="Email Address" value="<%=rs.getString("email") %>">
                                                        </div>
                                                        <div class="form-group">
                                                            <input name="dob" type="date" class="form-control" placeholder="Date of Birth" value="<%=rs.getString("dob") %>">
                                                        </div>
                                                        <div class="form-group">
                                                            <input name="course" type="text" class="form-control" placeholder="Course" value="<%=rs.getString("course") %>">
                                                        </div>
                                                       <%--  <input type="hidden" name="user_profile_id" value="<%=rs.getInt("id") %>"> --%>
                                                        <!-- <div class="file-upload-inner ts-forms">
                                                            <div class="input prepend-big-btn">
                                                                <label class="icon-right" for="prepend-big-btn">
																		<i class="fa fa-download"></i>
																	</label>
                                                                <div class="file-button">
                                                                    Browse
                                                                    <input type="file" onchange="document.getElementById('prepend-big-btn').value = this.value;"name="files">
                                                                </div>
                                                                <input type="text" id="prepend-big-btn" placeholder="no file selected">
                                                            </div>
                                                        </div> -->
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="form-group sm-res-mg-15 tbpf-res-mg-15">
                                                            <input type="text" name="description" class="form-control" placeholder="Description" value="<%=rs.getString("description") %>">
                                                        </div>
                                                        <div class="form-group">
                                                            <select class="form-control" name="gender" value="<%=rs.getString("gender") %>">
																<optgroup label="Select Gender">
																<option value="male">Male</option>
																<option value="female">Female</option>
																</optgroup>
															</select>
                                                        </div>
                                                       
                                                        <input name="phone"type="text" class="form-control" placeholder="Mobile no." value="<%=rs.getString("phone") %>">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="payment-adress mg-t-15">
                                                            <button type="submit" class="btn btn-primary waves-effect waves-light mg-b-15">Submit</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                </form>
                                                <%
                                            	}}catch(Exception e){
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
<script>
function chooseImage() {
	  const imageInput = document.getElementById('imageInput');
	  imageInput.click();
	  imageInput.addEventListener('change', uploadImage);
	}

	function uploadImage(event) {
	  const selectedImage = event.target.files[0];
	  const formData = new FormData();
	  formData.append('image', selectedImage);

	  // Make an AJAX request to your backend API to upload the image
	  // You can use XMLHttpRequest or fetch API
	  // Example using fetch API:
	  fetch('EditProfilePicture', {
	    method: 'POST',
	    body: formData
	  })
	  .then(response => response.json())
	  .then(data => {
	    // Handle the response from the server
	    console.log(data);
	  })
	  .catch(error => {
	    console.error('Error:', error);
	  });
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