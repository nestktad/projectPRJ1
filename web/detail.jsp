
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
        <link href="css/detail.css" rel="stylesheet" />
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
                            BookShop
                        </span></a>

                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="cart">Order</a></li>
                        <li><a href="login.jsp">Login</a></li>

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">24x7 Support <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#"><strong>Call: </strong>+09-456-567-890</a></li>
                                <li><a href="#"><strong>Mail: </strong>namlhe161914@fpt.edu.com</a></li>
                                <li class="divider"></li>
                                <li><a href="#"><strong>Address: </strong>
                                        <div>
                                            234, KCN LANG HOA LAC,<br />
                                            THACH THAT - HA NOI, VIETNAM
                                        </div>
                                    </a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-right" role="search">
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
                <div class="col-xs-4 item-photo">
                    <img style="width: 340px; height: 460px" src="${detail.image}" />
                </div>
                <div class="col-xs-5" style="border:0px solid gray">


                    <h3>${detail.bname}</h3>    


                    <h5 class="title-price">Kho:  ${detail.quantity}  </h5>
                    <h5>Tác giả: ${detail.author}</h5>
                    <br>

                    <h5> Thể Loại Sách: <a href="category?cid=${detail.category.cid}">${detail.category.cname}</a></h5>
                    <h5> Nhà Xuất Bản: ${detail.publisher.pname}</h5>

                    <h3 style="margin-top:0px;">${detail.price} VNĐ</h3>

                    <form name="f" action="" method="post">
                        <div class="section" style="padding-bottom:20px;">
                            <h6 class="title-attr"><small>Số lượng</small></h6>                    
                            <div>
                                <div class="btn-minus"><span class="glyphicon glyphicon-minus"></span></div>
                                <input name="num" value="1" />
                                <div class="btn-plus"><span class="glyphicon glyphicon-plus"></span></div>
                            </div>
                        </div>                

                        <!-- Botones de compra -->
                        <c:if test = "${sessionScope.acc.role != 0}">
                            <div class="section" style="padding-bottom:20px;">
                                <button class="btn btn-success" onclick="buy('${detail.bid}')"><span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Add to Cart</button>
                            </div>          
                        </c:if>
                </div>                              
                </form>
                <div class="col-xs-9">
                    <ul class="menu-items">
                        <h3><li >Giới thiệu sách </li></h3>
                    </ul>
                    <div style="width:100%;border-top:1px solid silver">
                        <p style="padding:15px;">
                            ${detail.describe}
                        </p>

                    </div>
                </div>	

            </div>
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
        <script src="js/detail.js"></script>
    </body>
</html>
