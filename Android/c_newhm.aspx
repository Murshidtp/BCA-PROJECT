﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="c_newhm.aspx.cs" Inherits="c_newhm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SANGUIS-CLINIC</title>
	
    <!-- css -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="plugins/cubeportfolio/css/cubeportfolio.min.css">
	<link href="css/nivo-lightbox.css" rel="stylesheet" />
	<link href="css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
	<link href="css/owl.carousel.css" rel="stylesheet" media="screen" />
    <link href="css/owl.theme.css" rel="stylesheet" media="screen" />
	<link href="css/animate.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet">

	<!-- boxed bg -->
	<link id="bodybg" href="bodybg/bg1.css" rel="stylesheet" type="text/css" />
	<!-- template skin -->
	<link id="t-colors" href="color/default.css" rel="stylesheet">
    
    <!-- =======================================================
        Theme Name: Medicio
        Theme URL: https://bootstrapmade.com/medicio-free-bootstrap-theme/
        Author: BootstrapMade
        Author URL: https://bootstrapmade.com
    ======================================================= -->
   
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">


<div id="wrapper">
	
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="top-area">
			<div class="container">
				<div class="row">
					<%--<div class="col-sm-6 col-md-6">
					<p class="bold text-left">Monday - Saturday, 8am to 10pm </p>
					</div>--%>
                    <a class="navbar-brand" href="index.html">
                    <img src="img/logo.png" alt="" width="150" height="40" />
                </a>
					<%--<div class="col-sm-6 col-md-6">
					<p class="bold text-right">LOGIN</p>
					</div>--%>
				</div>
			</div>
		</div>
        <div class="container navigation">
		
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
			  <ul class="nav navbar-nav">
				<li class="active"><a href="c_newhm.aspx">Home</a></li>
				<%--<li><a href="c_adddoct.aspx">Doctor</a></li>--%>
                <li><a href="c_patbookng.aspx">Patient Booking</a></li>
				<li><a href="c_add_epidemic.aspx">Epidemic</a></li>
                <li class="dropdown">
				  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="badge custom-badge red pull-right">View</span>Blood Result <b class="caret"></b></a>
				  <ul class="dropdown-menu">
				   <%--<li><a href="c_view_bloodresult.aspx">Blood Result</a></li>
					<li><a href="c_view_statusfreport.aspx">Status Of Report</a></li>--%> 
                    <li><a href="c_analsdresltforwtopatn.aspx">Forward Blood Result</a></li>
                    <li><a href="c_blood_analising.aspx">Blood Analyse</a></li>
				  </ul>
				</li>
				<li class="dropdown">
				  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="badge custom-badge red pull-right">View</span>Blood Bank <b class="caret"></b></a>
				  <ul class="dropdown-menu">
				    <li><a href="c_add_bloodbank_details.aspx">Blood Bank</a></li>
					<li><a href="c_viewreqforblood.aspx">Blood Request</a></li>
				  </ul>
				</li>
                <li><a href="login.aspx">Logout</a></li>
			  </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
	
	<!-- Section: intro -->
    <section id="intro" class="intro">
		<div class="intro-content">
			<div class="container">
				<%--<div class="row">
					<div class="col-lg-6">
					<div class="wow fadeInDown" data-wow-offset="0" data-wow-delay="0.1s">
					<h2 class="h-ultra">Medicio medical group</h2>
					</div>
					<div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0.1s">
					<h4 class="h-light">Provide best quality healthcare for you</h4>
					</div>
						<div class="well well-trans">
						<div class="wow fadeInRight" data-wow-delay="0.1s">
						<ul class="lead-list">
							<li><span class="fa fa-check fa-2x icon-success"></span> <span class="list"><strong>Affordable monthly premium packages</strong><br />Lorem ipsum dolor sit amet, in verterem persecuti vix, sit te meis</span></li>
							<li><span class="fa fa-check fa-2x icon-success"></span> <span class="list"><strong>Choose your favourite doctor</strong><br />Lorem ipsum dolor sit amet, in verterem persecuti vix, sit te meis</span></li>
							<li><span class="fa fa-check fa-2x icon-success"></span> <span class="list"><strong>Only use friendly environment</strong><br />Lorem ipsum dolor sit amet, in verterem persecuti vix, sit te meis</span></li>
						</ul>
						<p class="text-right wow bounceIn" data-wow-delay="0.4s">
						<a href="#" class="btn btn-skin btn-lg">Learn more <i class="fa fa-angle-right"></i></a>
						</p>
						</div>
						</div>


					</div>
					<div class="col-lg-6">
						<div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
						<img src="img/dummy/img-1.png" class="img-responsive" alt="" />
						</div>
					</div>					
				</div>--%>	
  
     
			</div>
		</div>		
    </section>


	<!-- Section: pricing -->	
	<section id="pricing" class="home-section bg-gray paddingbot-60">	
		<div class="container marginbot-50">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow lightSpeedIn" data-wow-delay="0.1s">
					<div class="section-heading text-center">
					<h2 class="h-bold">Addition of details</h2>
					<p>Add all relevent details...</p>
					</div>
					</div>
					<div class="divider-short"></div>
				</div>
			</div>
		</div>
           
		   <div class="container">
			
			<div class="row">

				<div class="col-sm-4 pricing-box">
					<div class="wow bounceInUp" data-wow-delay="0.1s">
					<div class="pricing-content general">
						
						<h3><a href="c_add_epidemic.aspx">Epidemic Details</a></h3>
						<p>An epidemic is the rapid spread of infectious disease to a large number of people in a given population within a short period of time,usually two weeks or less.epidemics of infectious disease are generally caused by several factors including a change in the ecology of the host polpulation.A few cases of a very rare disease may be classified as an epiidemic,while many cases of a common disease would not.</p>
						
					</div>
					</div>
				</div>
                
				<div class="col-sm-4 pricing-box featured-price">
					<div class="wow bounceInUp" data-wow-delay="0.3s">
					<div class="pricing-content featured">
					
						<h3><a href="c_adddoct.aspx">Doctor Details</a></h3>
					<p>A doctor is someone who maintains or restores human health through the practise of medicine.He or she faces the challenge of diagonising and treating human dieseases,ailments injuries,pain or other conditions.This isndone by listening to the patients,understanding the problem,and then using their scientific expertise to know how best to treat the ailment or concern.There is a specific type of doctor for almost every disease. </p>

						
					</div>
					</div>
				</div>

				<div class="col-sm-4 pricing-box">
					<div class="wow bounceInUp" data-wow-delay="0.2s">
					<div class="pricing-content general last">
					
						<h3><a href="c_add_bloodbank_details.aspx">Blood Bank Details</a></h3>
						<p>A blood bank is a center where blood gathered as a result of blood donation is stored and preserved for later use in blood tranfsion.Most collection facilities as well as hospital blood banks also perform testing to determine the blood type of patients and to identify compatible blood products ,along with a battery of tests and treatments to ensure or enhance the quality </p>
							
						
					</div>
					</div>
				</div>

			</div>				
				
            </div>
	</section>	 
	
		
          
	
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-4">
					<div class="wow fadeInDown" data-wow-delay="0.1s">
					<div class="widget">
						<h5>About Sanguis</h5>
						<p>
						1 pint can save 3 lives give blood give life....
						</p>
					</div>
					</div>
					<div class="wow fadeInDown" data-wow-delay="0.1s">
					
					</div>
				</div>
				<div class="col-sm-6 col-md-4">
					<div class="wow fadeInDown" data-wow-delay="0.1s">
					<div class="widget">
						<h5>Sanguis center</h5>
						<p>
						Indicator of epidemic diseases
						</p>
						
					</div>
					</div>
				</div>
				
						</ul>
					</div>
					</div>
				</div>
			</div>	
		</div>
		<div class="sub-footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-6 col-lg-6">
					<div class="wow fadeInLeft" data-wow-delay="0.1s">
					<div class="text-left">
					<p>&copy;Copyright - SANGUIS Theme. All rights reserved.</p>
					</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-6 col-lg-6">
					<div class="wow fadeInRight" data-wow-delay="0.1s">
					<div class="text-right">
						<div class="credits">
                            <!-- 
                                All the links in the footer should remain intact. 
                                You can delete the links only if you purchased the pro version.
                                Licensing information: https://bootstrapmade.com/license/
                                Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Medicio
                            -->
                            <a href="https://bootstrapmade.com/free-business-bootstrap-themes-website-templates/">Business Bootstrap Themes</a> by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                        </div>
					</div>
					</div>
				</div>
			</div>	
		</div>
		</div>
	</footer>

</div>
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>

	<!-- Core JavaScript Files -->
    <script src="js/jquery.min.js"></script>	 
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.easing.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/jquery.scrollTo.js"></script>
	<script src="js/jquery.appear.js"></script>
	<script src="js/stellar.js"></script>
	<script src="plugins/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/nivo-lightbox.min.js"></script>
    <script src="js/custom.js"></script>
    
</body>

</html>