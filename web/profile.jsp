<%-- 
    Document   : profile
    Created on : Oct 23, 2022, 6:48:55 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PROFILE</title>
        <link rel="stylesheet" href="font/fontawesome-free-6.1.1-web/css/all.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="css/product.css">
        <link rel="stylesheet" href="css/log_in.css">
        <link rel="stylesheet" href="css/sign_up.css">
        <link rel="stylesheet" href="css/contact.css"> 

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    </head>

    <body>
        <!-- Header -->
        <div class="header__product">
            <!-- Container -->
            <div class="container__header__product ">
                <!-- Navbar header -->
                <div id="navbar" class=" justify-content-between">
                    <!-- Logo -->
                    <ul class="logo_possition">
                        <a class="style__" href="home"><i title="Home" class="fa-solid fa-bicycle"></i></a>
                    </ul>
                    <!-- Mid Link Banner -->
                    <ul class="head_link flex no_margin justify-content-between">

                    </ul>
                    <!-- Log in__Cart -->
                    <ul class="flex text-uppercase justify-content-between login__cart">

                        <li>
                            <c:if test="${sessionScope.account.role==null}">

                                <a class="style__" href="login"><i title="Log In" class="fa-solid fa-key"></i></a>

                            </c:if>
                        </li>
                        <c:if test="${sessionScope.account.role!=null}">
                            <li>
                                <a class="style__" href="profile"><i title="${sessionScope.account.username}" class="fa-solid fa-user"></i></a>
                            </li>
                            <li>
                                <!-- Space -->
                            </li>
                            <li>
                                <a class="style__" href="logout"><i title="Log Out" class="fa-solid fa-right-from-bracket"></i></a>
                            </li>
                        </c:if>


                        <li><a class="style__" href="show"><i title="Cart" class="fa-solid fa-cart-shopping"></i></a></li>
                    </ul>
                    <!-- End navbar -->
                </div>
            </div>
            <!-- Content -->
            <div class="content1__contact">
                <div class="container__content__contact">
                    <div class="text_contact text-uppercase">
                        <span class="text_transform">PROFILE</span>

                    </div>
                    <!-- Form -->
                    <!-- input profile-->
                    <c:if test="${requestScope.customer.name==null}">
                        <form action="profile" method="post">
                            <div class="form_contact">
                                <div class="box_contact">
                                    <p class="text_col">PLEASE FILL YOUR INFORMATION</p>
                                    <div class="contact_request">
                                        <p class="text_col">NAME</p>
                                        <input class="input_form1" type="text" placeholder="Enter your name" name="name">
                                    </div>
                                    <div class="contact_col1">
                                        <p class="text_col">PHONE</p>
                                        <input class="input_form1" type="number" name="phone" placeholder="Enter phone number">
                                    </div>

                                    <div class="contact_col1">
                                        <p class="text_col">ADDRESS</p>
                                        <input  class="input_form1" type="text" name="address">
                                    </div >
                                    <div class="contact_col2">
                                        <p class="text_col">YOUR USERNAME</p>
                                        <input readonly value="${sessionScope.account.username}" class="input_form1" type="text" name="username" >

                                    </div>

                                    <input type="submit" class="btn_contact text-uppercase" value="SAVE"  style="height: 70px;width: 100%">
                                </div>
                            </div>
                        </form>
                    </c:if>


                    <c:if test="${requestScope.customer.name!=null}">
                        <div class="products_title_name">
                            <p >ACCOUNT USERNAME: ${sessionScope.account.username} </p>
                            <p >NAME: ${requestScope.customer.name} </p>
                            <p > PHONE: ${requestScope.customer.phoneNumber} </p>
                            <p >ADDRESS: ${requestScope.customer.address} </p>

                        </div>
                        <a href="changepass" class="btn_contact text-uppercase" style="width: 150px;height: 15px">Change Password</a>
                    </c:if>


                    <!-- End input profile -->    
                    <c:if test="${sessionScope.account.role==1}">
                          <p>
                              Total product: ${requestScope.count}   
                            </p>

                        <c:forEach items="${requestScope.order}" var="o" >
                            <p>Date: ${o.date} : ${o.num} orders 
                                <a href="date?date=${o.date}"  target="_parent" class="tm-register"  >
                                    <i> click for detail </i>
                                </a>
                            </p>

                        </c:forEach>
                        <div style="width: 30%; height: 30%">
                            <canvas id="bar-chart" width="800" height="450"></canvas>
                        </div>
                            
                            <p>
                                
                            </p>
                    </c:if>
                            
                            
                </div>
            </div>

            <!-- SUBSCRIBE -->
            <div class="content2">
                <div class="container__content__signup2">
                    <div class="ct2_left">
                        <div class="text1_left">RECEIVE PREVIEW UPDATES</div>
                        <div class="text2_left">Subscribe our newsletter to stay informed about new products,
                            technologies, events, contests and much more.</div>
                    </div>
                    <div class="ct2_right">
                        <a href="signup" class="btn_content2">SUBSCRIBE</a>
                    </div>
                </div>
            </div>
            <!-- Footer -->
            <footer>
                <div class="row">
                    <div class="container__footer">
                        <div class="boxcenter1">
                            <div class="boxfooter1">                  
                                <a href="home">
                                    <h3 class="footer_heading cool-link2">HOME</h3>                            
                                </a>                        
                            </div>
                            <div class="boxfooter2">                        
                                <a href="./product.html">
                                    <h3 class="footer_heading cool-link2" style="margin-bottom: 0;">BIKES</h3>
                                </a>
                                <ul class="footer_list">
                                    <li class="footer_item">
                                        <a href="./accessories.html" class="footer_item_link cool-link2">ACCESSORIES</a>
                                    </li>
                                    <li class="footer_item">
                                        <a href="product?cid=2" class="footer_item_link cool-link2">WHEEL</a>
                                    </li>
                                    <li class="footer_item">
                                        <a href="product?cid=3" class="footer_item_link cool-link2">HANDLEBARS</a>
                                    </li>
                                    <li class="footer_item">
                                        <a href="product?cid=4" class="footer_item_link cool-link2">SADDLES</a>
                                    </li><li class="footer_item">
                                        <a href="product?cid=5" class="footer_item_link cool-link2">APPAREL</a>
                                    </li>


                                </ul>                    
                            </div>
                            <div class="boxfooter3">
                                <a href="#">
                                    <h3 class="footer_heading cool-link2" style="margin-bottom: 0;">CONTACT US</h3>
                                </a>
                                <ul class="footer_list">
                                    <li class="footer_item">
                                        <a href="#l" class="footer_item_link cool-link2">CART</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="boxfooter4">
                                <img class="logo_footer" src="./assets/img/pinarello_logo0.jpg">
                                <ul class="footer_list">
                                    <li class="footer_item_icon">
                                        <a href="https://facebook.com" target="_blank" class="footer_item_link_icon">
                                            <i class="fa-brands fa-facebook"></i>
                                        </a>
                                        <a href="https://instagram.com" target="_blank" class="footer_item_link_icon">
                                            <i class="fa-brands fa-instagram"></i>
                                        </a>
                                        <a href="https://youtube.com" target="_blank" class="footer_item_link_icon">
                                            <i class="fa-brands fa-youtube"></i>
                                        </a>
                                        <a href="https://twitter.com" target="_blank" class="footer_item_link_icon">
                                            <i class="fa-brands fa-twitter"></i>
                                        </a>
                                    </li>
                                </ul>
                                <div>
                                    <p style="color:#fff; font-size: 13px; font-weight: bold;">© 2021 - CICLI PINARELLO SRL</p>
                                </div>
                                <div>
                                    <p style="color:#9d9d9d; font-size: 12px; line-height: 1rem;">Headquarter: Viale della Repubblica,12 <br>
                                        31020 Villorba (TV) - C.F. and VAT<br>
                                        05994100963
                                    </p>
                                    <p style="color:#fff; font-size: 13px;">Privacy Policy | Cookies Policy                          
                                </div>
                            </div>
                        </div>
                    </div>
            </footer>
            <!-- End Footer -->
            <script>
                var prevScrollpos = window.pageYOffset;
                window.onscroll = function () {
                var currentScrollPos = window.pageYOffset;
                if (prevScrollpos > currentScrollPos) {
                document.getElementById("navbar").style.top = "0";
                } else {
                document.getElementById("navbar").style.top = "-50px";
                }
                prevScrollpos = currentScrollPos;
                }
            </script>
            <script type="text/javascript">
                new Chart(document.getElementById("bar-chart"), {
                type: 'bar',
                        data: {
                <c:forEach items="${requestScope.order}" var="o">
                        labels: ["${o.date}"],
                </c:forEach>
                        datasets: [
                        {
                        label: "Number of order",
                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850"],
                <c:forEach items="${requestScope.order}" var="o" >
                        data: [${o.num}]
                </c:forEach>
                        }
                        ]
                        },
                        options: {
                        legend: {display: false},
                                title: {
                                display: true,
                                        text: 'Number of order per day'
                                }
                        }
                });
            </script>

    </body>

</html>
