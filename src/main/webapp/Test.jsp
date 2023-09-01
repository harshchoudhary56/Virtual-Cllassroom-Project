<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

    <html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> Admin Login </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS here -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/progressbar_barfiller.css">
        <link rel="stylesheet" href="assets/css/gijgo.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/animated-headline.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">

    </head>

    <body>
        <!-- ? Preloader Start -->
        <div id="preloader-active">
            <div class="preloader d-flex align-items-center justify-content-center">
                <div class="preloader-inner position-relative">
                    <div class="preloader-circle"></div>
                    <div class="preloader-img pere-text">
                        <img src="assets/img/logo/loder.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        <!-- Preloader Start-->


        <main class="login-body">
            <!-- Login Admin -->
            <form class="form-default" name="myform" action="admin_login.jsp" method="POST" onsubmit="return validate();">

                <%
		// if admin is already logged in to the system, redirect to the dashboard
		if(session.getAttribute("admin") != null)
		{
			response.sendRedirect("admin_dashboard.jsp");
		}
%>
                    <div class="login-form">
                        <!-- logo-login -->
                        <div class="logo-login">
                            <a href="index.jsp"> <img src="assets/img/logo/loder.png" alt=""></a>
                        </div>
                        <h2>Login Here</h2>
                        <div class="form-input">
                            <input type="password" name="password" placeholder="Password" required>
                        </div>
                        <p style="color:red">
                            <%
		// if password entered wrong, print error message
		if(session.getAttribute("AdminErrorLogin") != null)
		{
			out.println((String)session.getAttribute("AdminErrorLogin"));
		}
%>
                        </p>
                        <div class="form-input pt-30">
                            <input type="submit" name="submit" value="login">
                        </div>
                    </div>
                    <%
		// take password for validation
		String password = request.getParameter("password");
		
		try
		{
			// register the driver
			Class.forName("com.mysql.cj.jdbc.Driver");

			// establish the connection with the database
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project" , "root" , "Admin@123");

			// create a SQL statement
			Statement stmt = con.createStatement();
		    String sql = "insert into admin values(SHA1 ('" + password + "'))";
		    out.println("SHA1 ('" + password + "')");
		    System.out.println();

			// execute the statement
			stmt.executeUpdate(sql);

			// if admin password is in DB, redirect to dashboard
			/* if (rs.next())
			{
				session.setAttribute("admin","admin");
				response.sendRedirect("admin_dashboard.jsp");
			}
			// if password is wrong, display error message
			else
			{
				session.setAttribute("AdminErrorLogin","Invalid Password");
			} */

			// close the connection
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
%>
            </form>
            <!-- /end login form -->
        </main>

        <!-- JS here -->
        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
        <!-- Jquery, Popper, Bootstrap -->
        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

        <!-- Video bg -->
        <script src="./assets/js/jquery.vide.js"></script>

        <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>
        <!-- One Page, Animated-HeadLin -->
        <script src="./assets/js/wow.min.js"></script>
        <script src="./assets/js/animated.headline.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>

        <!-- Date Picker -->
        <script src="./assets/js/gijgo.min.js"></script>
        <!-- Nice-select, sticky -->
        <script src="./assets/js/jquery.nice-select.min.js"></script>
        <script src="./assets/js/jquery.sticky.js"></script>
        <!-- Progress -->
        <script src="./assets/js/jquery.barfiller.js"></script>

        <!-- counter , waypoint,Hover Direction -->
        <script src="./assets/js/jquery.counterup.min.js"></script>
        <script src="./assets/js/waypoints.min.js"></script>
        <script src="./assets/js/jquery.countdown.min.js"></script>
        <script src="./assets/js/hover-direction-snake.min.js"></script>

        <!-- contact js -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>

        <!-- Jquery Plugins, main Jquery -->
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>

    </body>

    </html>