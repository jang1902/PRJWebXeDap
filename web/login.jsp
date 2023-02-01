<%-- 
    Document   : login
    Created on : Oct 11, 2022, 8:31:26 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <title>Log In</title>
    <link rel="stylesheet" href="./font/fontawesome-free-6.1.1-web/css/all.min.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="./css/product.css">
    <link rel="stylesheet" href="./css/log_in.css">
    <link rel="stylesheet" href="css/sign_up.css">
    <link rel="stylesheet" href="css/alert.css">
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
                <!-- Log in__Cart -->
            </div>
            <!-- End navbar -->
        </div>
    </div>
    <!-- Content -->
    <div class="content__login">
        <div class="container__content__login">
            <div class="text_signup text-uppercase">
                <span>LOGIN</span>
            </div>
            
            
            
            <!-- Form -->
            
            <div class="form_login">
                <div class="row1">
                   
                    <div style="margin-top: 20px; border-bottom: 1px solid gray ;">
                        <form action="login" method="post">
                           <h3 style="color:red">${requestScope.mess}</h3>
                        <input class="position_input input_form" type="text" name="user" placeholder="Username" value="${cookie.cuser.value}">
                        <input class="position_input input_form" type="password" name="pass" placeholder="Password" value="${cookie.cpass.value}">
                        <div style="display: flex;margin-top: 5px;">
                            <input name="remem" type="checkbox" ${(cookie.crem.value eq 'on')} id="cb" value="on" checked >
                            <label for="cb" class="text__">Remember password</label>
                        </div>
                       
                        <input class="btn_signup text-uppercase" value="Login" type="submit" style="height: 50%" >
                        </form>
                    </div>
                        <a href="signup.jsp" class="btn_signup text-uppercase" style="height: 16px;width: 95%" >create a new account</a>
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
