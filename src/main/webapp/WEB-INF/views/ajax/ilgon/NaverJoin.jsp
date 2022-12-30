<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Space</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    
    

    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/ce9db0be33.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
	<style>
	* {
	  margin: 0px;
	  padding: 0px;
	  text-decoration: none;
	  font-family:sans-serif;
	}
	
	body {
	  background-image:#34495e;
	}
	
	.joinForm {
	  position:absolute;
	  width:400px;
	  height:400px;
	  padding: 30px, 20px;
	  background-color:#FFFFFF;
	  text-align:center;
	  top:40%;
	  left:50%;
	  transform: translate(-50%,-50%);
	  border-radius: 15px;
	}
	
	.joinForm h2 {
	  text-align: center;
	  margin: 30px;
	}
	.tf_wrap{
		width:50%;
	}
	.textForm {
	  border-bottom: 2px solid #adadad;
	  margin: 30px;
	  padding: 10px 10px;
	}
	.tf-input {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	</style>
	<script>
		
	</script>
<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->
        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
                <a href="" class="navbar-brand p-0">
                    <h1 class="text-primary m-0"><i class="fa-solid fa-meteor"></i> Space</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0 pe-4">
                        <!-- Home Reservation Services Contact Pages MyPage MyReservation -->
                        <li class="nav-item nav-link" id="HomeTab" onclick = "sel_menu('Home')">Home</li>
                        
                        <li class="nav-item nav-link" id="ReservationTab" onclick = "sel_menu('Reservation')">Reservation</li>

                        <li class="nav-item nav-link" id="ServicesTab" onclick = "sel_menu('Services')">Services</li>

                        <li class="nav-item nav-link" id="ContactTab" onclick = "sel_menu('Contact')">Contact</li>

                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu m-0">
                                <a href="javascript:sel_menu('MyPage')" class="dropdown-item">MyPage</a>
                                <a href="javascript:sel_menu('MyReservation')" class="dropdown-item">MyReservation</a>
                                <a href="javascript:sel_menu('MyZimm')" class="dropdown-item">MyZimm</a>
                                <a href="javascript:sel_menu('MyReviewList')" class="dropdown-item">MyReviewList</a>
                                <a href="javascript:sel_menu('MyReservationCheck')" class="dropdown-item">MyReservationCheck</a>
                                <a href="javascript:sel_menu('MySpaceEdit')" class="dropdown-item">MySpaceEdit</a>
                                <a href="javascript:sel_menu('MySpaceInsert')" class="dropdown-item">MySpaceInsert</a>
                                <a href="javascript:sel_menu('MySpaceList')" class="dropdown-item">MySpaceList</a>
                            </div>
                        </div>
                    </div>
                    <a href="javascript:sel_menu('NaverLogin')" class="btn btn-primary py-2 px-4">로그인</a>
                 </div>
            </nav>

            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown" id="selmenu">Home</h1>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
            <h5 class="section-title ff-secondary text-center text-primary fw-normal">Join Us!</h5>
            <h1 class="mb-5">NAVER JOIN</h1>
        </div>
        <div class="row g-4">
          <form id="jfm" name="jfm" action="Join" method="post">
            <div class="text-center">
                <div class="row tf_wrap" id="">
                
               	  <div class="textForm">
			        <input id="mname" name="mname" type="text" class="name tf-input" value="${MemInfo.mname }" placeholder="NAME">
			      </div>
			      <div class="textForm">
			        <input id="nickname" name="nickname" type="text" class="nickname tf-input" placeholder="NICKNAME">
			      </div>
                  	  <div class="textForm">
			        <input id="userid" name="userid" type="text" class="id tf-input" value="${MemInfo.userid }" placeholder="ID">
			      </div>
			      <div class="textForm">
			        <input id="mpwd" name="mpwd" type="password" class="pw tf-input" placeholder="PASSWORD">
			      </div>
			       <div class="textForm">
			        <input id="mpwd2" name="mpwd2" type="password" class="pw tf-input" placeholder="PASSWORD CHECK">
			      </div>
			      <div class="textForm">
			        <input id="hp" name="hp" type="text" class="cellphoneNo tf-input" value="${MemInfo.hp }" placeholder="TEL">
			      </div>
			      <div class="textForm">
			        <input id="birth" name="birth" type="text" class="birth tf-input" value="${MemInfo.birth }" placeholder="BIRTH DATE">
			      </div>
			       <div class="textForm">
			        <select id="status" name="status" class="status tf-input">
			        	<option value="">회원선택</option>
			        	<option value="0">일반유저</option>
			        	<option value="-1">등록유저</option>
			        </select>
			      </div>
			      <div class="textForm">
			        <input id="account" name="account" type="number" class="account tf-input" value="" placeholder="Account Info">
			      </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="wow fadeInUp" data-wow-delay="0.2s">
                   <div class="row g-3">
                       <div class="col-12">
                       	   <button class="btn btn-primary w-40 py-2">Join</button>
                           <button class="btn btn-primary w-40 py-2" type="reset">Reset</button>
                           <a href="javascript:sel_menu('Login')" class="btn btn-primary w-40 py-2">Cancel</a>
                       </div>
                   </div>
                </div>
            </div>
          </form>
        </div>
    </div>
</div>
<!-- Contact End -->
<!-- Footer Start -->
        <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Company</h4>
                        <a class="btn btn-link" href="">About Us</a>
                        <a class="btn btn-link" href="">Contact Us</a>
                        <a class="btn btn-link" href="">Reservation</a>
                        <a class="btn btn-link" href="">Privacy Policy</a>
                        <a class="btn btn-link" href="">Terms & Condition</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contact</h4>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Opening</h4>
                        <h5 class="text-light fw-normal">Monday - Saturday</h5>
                        <p>09AM - 09PM</p>
                        <h5 class="text-light fw-normal">Sunday</h5>
                        <p>10AM - 08PM</p>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Newsletter</h4>
                        <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                        <div class="position-relative mx-auto" style="max-width: 400px;">
                            <input class="form-control border-primary w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                            <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved. 
							
							<!--/*** This template is free as long as you keep the footer authorâs credit link/attribution link/backlink. If you'd like to use the template without the footer authorâs credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a><br><br>
                            Distributed By <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>