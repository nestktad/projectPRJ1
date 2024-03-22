

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>BookShop</title>
        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!-- Fontawesome core CSS -->
        <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
        <!--GOOGLE FONT -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
        <!--Slide Show Css -->
        <link href="assets/ItemSlider/css/main-style.css" rel="stylesheet" />
        <!-- custom CSS here -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <link rel="icon" href="images/logo.png" type="image/gif" />
    </head>
    <body>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="home">                             
                        <img src="images/logo.png" alt="">
                        <span>
                            MyBookShop
                        </span></a>

                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            
                    
                    <ul class="nav navbar-nav navbar-right">
                        <c:if test = "${sessionScope.acc.role != 0}">
                            <li><a href="cart"><img src="images/addtocartlogo.png" width="18" height="17"alt=""> Order</a></li>
                        </c:if>
                        <c:if test = "${sessionScope.acc.role == 0}"><li><a href="manager">Edit Book</a></li><li><a href="usermanager">Manage Account</a></li> </c:if>

                        <c:if test = "${sessionScope.acc == null}">
                        <li><a href="login.jsp">Login/Sign Up</a></li>
                        </c:if>
                        <c:if test = "${sessionScope.acc != null}">
                        <li><a href="profile?id=${sessionScope.acc.id}"> <img src="images/user.png" alt=""> ${sessionScope.acc.username}</a></li>
                        <li><a href="logout">Logout</a></li>
                                    
                        </c:if>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">24x7 Support <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#"><strong>Call: </strong>+84-961-421-909</a></li>
                                <li><a href="#"><strong>Mail: </strong>datnbhe176137@fpt.edu.com</a></li>
                                <li class="divider"></li>
                                <li><a href="#"><strong>Address: </strong>
                                        <div>
                                            FPTU HOA LAC,<br />
                                            THACH THAT - HA NOI, VIETNAM
                                        </div>
                                    </a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-right" action="search">
                        <div class="form-group">
                            <input name="txt" type="text" placeholder="Enter Keyword Here ..." class="form-control">
                        </div>
                        &nbsp; 
                        <button type="submit" class="btn btn-primary">Search</button>
                    </form>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <div class="well well-lg offer-box text-center">


                        Weekly Offer : 20% off  on purchase of $ 200,000 VND and above !                


                    </div>
                    <div class="main box-border">


                        <div class="w3-content w3-display-container">
                            <img class="mySlides" height="420" src="images/slide1.jpg" style="width:100%">
                            <img class="mySlides" height="420"src="images/slide2.jpg" style="width:100%">
                            <img class="mySlides" height="420"src="images/slide3.jpg" style="width:100%">
                            <img class="mySlides" height="420"src="images/slide4.jpg" style="width:100%">

                        </div>

                    </div>
                    <br />
                </div>
                <!-- /.col -->

                <div class="col-md-3 text-center">
                    <div class=" col-md-12 col-sm-6 col-xs-6 " >
                        <div class="offer-text2">
                            Hot Sale
                        </div>
                        <div class="thumbnail product-box1 book1">
                            <img width="165" height="160"src="images/onggiavabienca.jpg" alt="" />
                            <div class="caption">
                                <h3><a href="#">Ông Già Và Biển Cả</a></h3>
                                    <p>Price : <strong>45000 VND</strong>  </p>    
                            </div>
                        </div>
                    </div>
 
                    <div class=" col-md-12 col-sm-6 col-xs-6 book1">
                        <div class="offer-text2">
                            Hot Sale
                        </div>
                        <div class="thumbnail product-box1 book1">
                            <img width="165" height="160"src="images/cuocdoicuapi.jpg" alt="" />
                            <div class="caption">
                                <h3><a href="#">Cuộc Đời Của Pi</a></h3>
                                <p>Price : <strong>95000 VND</strong>  </p>   

                        </div>
                    </div>
                    </div>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-3">
                    <div>
                        <a href="#" class="list-group-item active">Categories
                        </a>
                        <ul class="list-group ">
                            <c:forEach items="${listC}" var = "o">
                                       
                                <li class="list-group-item"><a href="category?cid=${o.cid}">${o.cname}</a></li>
                            </c:forEach>  
                            
                        </ul>
                    </div>
 
                    <!-- /.div -->
                    
                    <!-- /.div -->
                    
                    <!-- /.div -->
                </div>
                <!-- /.col -->
                <div class="col-md-9">
                    <div>
                        <ol class="breadcrumb">
                            <li><a href="home">Home</a></li>
                            <li class="active">Categories</li>
                            
                            
                                <li class="active"><a href="category?cid=${listCCid}">${listCCid.cname}</a></li>
                        
                        </ol>
                    </div>
                    <!-- /.div -->
                    <div class="row">
                        <div class="btn-group alg-right-pad">
                            <button type="button" class="btn btn-default"><strong>1235  </strong>items</button>
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
                                    Sort Products &nbsp;
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="sortasc">By Price Low</a></li>
                                    <li class="divider"></li>
                                    <li><a href="sortdesc">By Price High</a></li>
                                    <li class="divider"></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <c:forEach items="${requestScope.listB}" var = "o">
                        <div class="col-md-4 text-center col-sm-6 col-xs-6">

                            <div class="thumbnail product-box">
                                <img src="${o.image}" alt="" />
                                <div class="caption">
                                    <h3><a href="detail?bid=${o.bid}">${o.bname}</a></h3>
                                    <p>Price : <strong>${o.price} VND</strong>  </p>    
                                    
                                    <p> <c:if test = "${sessionScope.acc.role != 0}">
                                        <a href="detail?bid=${o.bid}" class="btn btn-success" role="button" >Add To Cart</a> </c:if>
                                        <a href="detail?bid=${o.bid}" class="btn btn-primary" role="button">See Details</a></p>
                                    
                                </div>
                            </div>
                        </div>

                        </c:forEach>  
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <ul class="pagination alg-right-pad">
                            <li><a href="#">&laquo;</a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">&raquo;</a></li>
                        </ul>
                    </div>


                    <!-- /.row -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>

        <!--Footer -->
        <div class="col-md-12 footer-box">


            <div class="row">
                <div class="col-md-4">
                    <strong>Send your feedback </strong>
                    <hr>
                    <form>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" required="required" placeholder="Name">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" required="required" placeholder="Email address">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group">
                                    <textarea name="message" id="message" required="required" class="form-control" rows="3" placeholder="Message"></textarea>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Submit Request</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-md-4">
                    <strong>Our Location</strong>
                    <hr>
                    <p>
                        234, KCN LANG HOA LAC,<br />
                        THACH THAT - HA NOI, VIETNAM
                        Call: +09-456-567-890<br>
                        Email: datnbhe176137@fpt.edu.com<br>
                    </p>

                    2014 www.yourdomain.com | All Right Reserved
                </div>
                <div class="col-md-4 social-box">
                    <strong>We are Social </strong>
                    <hr>
                    <a href="#"><i class="fa fa-facebook-square fa-3x "></i></a>
                    <a href="#"><i class="fa fa-twitter-square fa-3x "></i></a>
                    <a href="#"><i class="fa fa-google-plus-square fa-3x c"></i></a>
                    <a href="#"><i class="fa fa-linkedin-square fa-3x "></i></a>
                    <a href="#"><i class="fa fa-pinterest-square fa-3x "></i></a>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nec nisl odio. Mauris vehicula at nunc id posuere. Curabitur nec nisl odio. Mauris vehicula at nunc id posuere. 
                    </p>
                </div>
            </div>
            <hr>
        </div>
        <!-- /.col -->
        <!--Footer end -->
        <script src="js/carousel.js"></script>
        <!--Core JavaScript file  -->
        <script src="assets/js/jquery-1.10.2.js"></script>
        <!--bootstrap JavaScript file  -->
        <script src="assets/js/bootstrap.js"></script>
        <!--Slider JavaScript file  -->
        <script src="assets/ItemSlider/js/modernizr.custom.63321.js"></script>
        <script src="assets/ItemSlider/js/jquery.catslider.js"></script>
        <script>
                            $(function () {

                                $('#mi-slider').catslider();

                            });
        </script>
    </body>
</html>