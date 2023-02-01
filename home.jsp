<%-- 
    Document   : home
    Created on : Oct 15, 2022, 10:31:37 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <!--    Home
            Product
            Accessories
            Login
            Sign up
            Figurator
            Cart
            Contact Form 
    -->

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HOME</title>
        <link rel="stylesheet" href="font/fontawesome-free-6.1.1-web/css/all.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="css/product.css">
        <link rel="stylesheet" href="css/paging.css">

    </head>

    <body>
        <!-- Header -->
        <div class="header">
            <!-- Container -->
            <div class="container__header">
                <!-- Navbar header -->
                <div id="navbar" class=" justify-content-between">
                    <!-- Logo -->
                    <ul class="logo_possition">

                        <a class="style__" href="home"><i title="Home" class="fa-solid fa-bicycle"></i></a>
                    </ul>
                    <!-- Mid Link Banner -->
                    <ul class="head_link flex no_margin justify-content-between">
                        <c:forEach items="${requestScope.listc}" var="c">
                            <li class="text-uppercase center_text text_possition">

                                <a class="no_underline cool-link" href="./product?cid=${c.id}&index=1">${c.name}</a>

                            </li>
                        </c:forEach>
                    </ul>






                    <c:if test="${sessionScope.account.role==1}">
                        <li class="text-uppercase center_text text_possition">
                            <a class="no_underline cool-link" href="manage" style="color: greenyellow">Manage</a>
                        </li>
                    </c:if>
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

                            <li><a class="style__" href="show"><i title="Car" class="fa-solid fa-cart-shopping"></i></a></li>
                    </ul>
                </div>
                <!-- End navbar -->
                <div class="space_header">

                </div>
                <!-- Text Middle -->
                <div class="text_middle_header">
                    <p class="text-uppercase style_mid_text1">
                        PARIS 105 11S
                    </p>
                    <p class="text-uppercase style_mid_text2">
                        READY TO CONQUER THE VICTORY
                    </p>
                    <!-- Button mid header -->
                    <div style="margin-top: 20px;">
                        <a href="detail?id=55" class="button_header">Discover PARIS 105 11S</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Headline -->
        <!--<div class="headline">
            <a title="" href="detail?id=2"><img src="img/banner.png" alt="DOGMA F" ></a>
        </div>-->  
        <div class="headline">
            <div class="headline_small">COLLECTION</div>
            <h1 class="headline_big" >ALL PRODUCT</h1>
            <div>

                <form action="search" method="post">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <input  required value="${requestScope.value}" type="text" name="sv" placeholder="Search...">
                    <input type="submit"   value="Search">
                </form> 
            </div>

        </div>

        <!-- Container Products -->
        <div id="container_products">
            <!-- Container Products -->  
            <div>
                <ul class="products">
                    <!--
                    <li><h3 class="product-name cool-link"><i class="fa-solid fa-plane"></i> NEW ARRIVALS</h3>
                        <div class="products_item">
                            <div class="product-top">
                                <a href="detail?id=${last.id}" class="product-thumb">

                                    <img style="width: 439px;height: 327px" src=${last.images} />

                                </a>
                            </div>
                            <div class="product-info">
                                <h3 class="product-name cool-link">${last.pname}</h3>
                                <p style="margin: 2px auto; width: 100%;">${last.describe}</p>
                                <div class="product-price">${last.price}</div>
                            </div>
                        </div>
                    </li>-->
                    <li><h3 class="product-name cool-link"><i class="fa-solid fa-fire"></i> BEST SELLER</h3>
                        <div class="products_item">
                            <div class="product-top">
                                <c:forEach items="${requestScope.best}" var="b">
                                <a href="detail?id=${b.id}" class="product-thumb">

                                    <img style="width: 439px;height: 327px" src=${b.images} />

                                </a>
                                    
                            </div>
                            <div class="product-info">
                                <h3 class="product-name cool-link">${b.pname}</h3>
                                <p style="margin: 2px auto; width: 100%;">${b.describe}</p>
                                <div class="product-price">${b.price}</div>
                            </div>
                            </c:forEach>
                        </div>
                    </li>
                </ul>
            </div>

            <ul class="products">
                <c:forEach items="${requestScope.list}" var="l" >
                    <li>
                        <div class="products_item">
                            <div class="product-top">
                                <a href="detail?id=${l.id}" class="product-thumb">

                                    <img src="${l.images}" />

                                </a>
                            </div>
                            <div class="product-info">
                                <h3 class="product-name cool-link">${l.pname}</h3>
                                <p style="margin: 2px auto; width: 100%;">${l.describe}</p>
                                <div class="product-price">${l.price}</div>
                            </div>
                        </div>
                    </li>

                </c:forEach>
            </ul>
        </div>
                           
        <div class="pagination">
                   <a class="${index==1?"disable-link":""}" href="home?index=${index-1}">&laquo;</a>
           <c:forEach begin="1" end="${total}" var="page">
                <a class="${index==page?"active":""}" href="home?index=${page}">${page}</a>
            </c:forEach>     
                   <a class="${index==total?"disable-link":""}" href="home?index=${index+1}">&raquo;</a>     
            </div>           
        <!-- SUBSCRIBE -->
        <div class="content2">
            <div class="container__content2">
                <div class="ct2_left">
                    <div class="text1_left">RECEIVE PREVIEW UPDATES</div>
                    <div class="text2_left">Subscribe our newsletter to stay informed about new products,
                        technologies, events, contests and much more.</div>
                </div>
                <div class="ct2_right">
                    <a href="#" class="btn_content2">SUBSCRIBE</a>
                </div>
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
    </body>

</html>