<%-- 
    Document   : introduct
    Created on : Oct 15, 2022, 2:50:28 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- 
    Home 
    Product
    Accessories
    Log in
    Sign up
    Cart
    Contact Form
    Figurator
 -->

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="font/fontawesome-free-6.1.1-web/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
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
                    <a title="Home" href="./index.html"><img src="img/logo.png" alt=""></a>
                </ul>
                <!-- Mid Link Banner -->
                <ul class="head_link flex no_margin justify-content-between">
                    <!-- Link 1 -->
                    <li class="text-uppercase center_text text_possition">
                        <a class="no_underline cool-link" href="home">Enter our website</a>
                    </li>
                    
                </ul>
                <!-- Log in__Cart -->
                <ul class="flex text-uppercase justify-content-between login__cart">
                    <a class="style__" href="login"><i title="Log In" class="fa-solid fa-key"></i></a>
                 
                </ul>
            </div>
            <!-- End navbar -->
            <div class="space_header">

            </div>
            <!-- Text Middle -->
            <div class="text_middle_header">
                <p class="text-uppercase style_mid_text1">
                    MAKE IT YOURS
                </p>
                <p class="text-uppercase style_mid_text2">
                    MAKE IT YOUR WAY
                </p>
                <!-- Button mid header -->
                <div style="margin-top: 20px;">
                    <a href="home" class="button_header">Enter</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Content!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
    <div class="content">
        <!-- Container_content  -->
        <div class="container__content">
            <div class="content__1__top">
                <!-- <div class="container_content"> -->
                <div class="box__content img1 bg-img"></div>
                <a href="./product.html" class="btn_content">DISCOVER PRINCE</a>
                <!-- </div> -->
            </div>
            <div class="content__2__top">
                <div class="box__content img2 bg-img"></div>
                <a href="./product.html" class="btn_content">DISCOVER PARIS</a>
            </div>
            <div class="content__3__top">
                <div class="box__content img3 bg-img"></div>
                <a href="./product.html" class="btn_content">DISCOVER DOGMA F12</a>
            </div>
            <div class="content__4__top">
                <div class="box__content img4 bg-img"></div>
                <a href="./product.html" class="btn_content">DISCOVER THE NEW GREVIL</a>
            </div>
        </div>
    </div>
    <!-- End Container 1 -->
    <!-- SUBSCRIBE -->
    <div class="content2">
        <div class="container__content2">
            <div class="ct2_left">
                <div class="text1_left">RECEIVE PREVIEW UPDATES</div>
                <div class="text2_left">Subscribe our newsletter to stay informed about new products,
                    technologies, events, contests and much more.</div>
            </div>
            <div class="ct2_right">
                <a href="./sign_up.html" class="btn_content2">SUBSCRIBE</a>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="row">
            <div class="container__footer">
                <div class="boxcenter1">
                    <div class="boxfooter1">                  
                            <a href="./index.html">
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
                                <a href="./configurator.html" class="footer_item_link cool-link2">CONFIGURATOR</a>
                            </li>
                        </ul>                    
                    </div>
                    <div class="boxfooter3">
                        <a href="./contact.html">
                            <h3 class="footer_heading cool-link2" style="margin-bottom: 0;">CONTACT US</h3>
                        </a>
                        <ul class="footer_list">
                            <li class="footer_item">
                                <a href="./cart.html" class="footer_item_link cool-link2">CART</a>
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
