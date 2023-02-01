<%-- 
    Document   : detail
    Created on : Oct 16, 2022, 9:55:23 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Infor</title>
    <link rel="stylesheet" href="font/fontawesome-free-6.1.1-web/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="css/product.css">
    <link rel="stylesheet" href="css/log_in.css">
    <link rel="stylesheet" href="css/sign_up.css">
    <link rel="stylesheet" href="css/configurator.css">
    <link rel="stylesheet" href="css/cart.css">
    <link rel="stylesheet" href="css/prd_infor.css">
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
                        <c:forEach items="${requestScope.listc}" var="c">
                            <li class="text-uppercase center_text text_possition">

                                <a class="no_underline cool-link" href="./product?cid=${c.id}">${c.name}</a>
                                  
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


                        <li><a class="style__" href="show"><i title="Cart" class="fa-solid fa-cart-shopping"></i></a></li>
                    </ul>
            </div>
            <!-- End navbar -->
        </div>
    </div>
    <!-- content -->
    
    <div class="content_prdif" style="height: auto">
        <div class="container_prdif1" style="height: auto">
            <h1 class="headline_big text-uppercase txt_big">${detail.pname}</h1>
            <div class="img_prd_">
                <img class="img___" src=${detail.images} alt="">
            </div> 
        </div>

        <!-- 1 -->
        <div class="container_prdif2" style="height: auto;width: 100%">
           
            <div style="margin: auto;width: 80%">
                <div class="products_title_name">
                ${detail.describe}
            </div>
            <table class="tb">
                <tr>
                    <td class="td1">DETAIL</td>
                    <td>${detail.detail}</td>
                </tr>
                <tr>
                    <td class="td1">PRICE</td>
                    <td>${detail.price}$</td>
                </tr>
            </table>
            <div class="fff">
                
                    <form action="action" name="b" method="post" >
                        <input type="submit" class="btn_add" value="ADD TO CART" onclick="buy('${detail.id}')" style="height: 50px">
                    </form>
                    
               
            </div>
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
            <!-- End footer -->
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
        function buy(id){
            document.b.action="buy?id="+id;
            document.b.submit();
        }
    </script>
</body>

</html>
