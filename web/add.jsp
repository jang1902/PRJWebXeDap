<%-- 
    Document   : add
    Created on : Oct 16, 2022, 1:41:33 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            Contact Form  -->

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ADD</title>
        <link rel="stylesheet" href="font/fontawesome-free-6.1.1-web/css/all.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="css/product.css">
        <link rel="stylesheet" href="css/log_in.css">
        <link rel="stylesheet" href="css/sign_up.css">
        <link rel="stylesheet" href="css/contact.css"> 

        <style>
            .custom-select {
                position: relative;
                font-family: Arial;
            }

            .custom-select select {
                display: none; /*hide original SELECT element: */
            }

            .select-selected {
                background-color: gainsboro;
            }



            /* style the items (options), including the selected item: */
            .select-items div,.select-selected {
                color: black;
                padding: 8px 16px;
                border: 1px solid transparent;
                border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
                cursor: pointer;
            }

            /* Style items (options): */
            .select-items {
                position: absolute;
                background-color: white;
                top: 100%;
                left: 0;
                right: 0;
                z-index: 99;
            }

            /* Hide the items when the select box is closed: */
            .select-hide {
                display: none;
            }

            .select-items div:hover, .same-as-selected {
                background-color: rgba(0, 0, 0, 0.1);
            }
        </style>
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
                        <li class="text-uppercase center_text text_possition">
                            <a class="no_underline cool-link" href="manage" style="color: black"><i class="fa-solid fa-caret-left"></i> Back to Manage </a>
                        </li>
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
                        <span class="text_transform">ADD NEW PRODUCT</span>
                    </div>
                    <!-- Form -->
                    <form action="add" method="post">
                        <div class="form_contact">
                            <div class="box_contact">
                                <h3 style="color: red">${requestScope.ms}</h3> 
                                <div class="contact_request">
                                    <p class="text_col">NAME </p>
                                    <input class="input_form1" type="text" placeholder="Enter name" name="name">
                                </div>
                                <div class="contact_col1">
                                    <p class="text_col">PRICE</p>
                                    <input class="input_form1" type="number" name="price">
                                </div>
                                <div class="contact_col2">
                                    <p class="text_col">QUANTITY</p>
                                    <input class="input_form1" type="number" name="quantity">
                                </div>
                                <div class="contact_col1">
                                    <p class="text_col">DESCRIBE</p>
                                    <input class="input_form1" type="text" name="describe">
                                </div >
                                <div class="contact_col2">
                                    <p class="text_col">IMAGE</p>
                                    <input class="input_form1" type="text" name="image" value="img/">
                                </div >
                                <div class="custom-select contact_col1 " style="width:200px;">
                                    <select name="category">
                                        <option value="0">Select Category:</option>
                                        <c:forEach items="${requestScope.listc}" var="c">
                                            <option value="${c.id}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="contact_request">
                                    <p class="text_col">DETAIL</p>
                                    <input class="input_form1" type="text" name="detail">
                                </div>

                                <input type="submit" class="btn_contact text-uppercase" value="ADD"  style="height: 70px;width: 100%">
                            </div>
                        </div>
                    </form>
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
            <script>
                var x, i, j, l, ll, selElmnt, a, b, c;
                /* Look for any elements with the class "custom-select": */
                x = document.getElementsByClassName("custom-select");
                l = x.length;
                for (i = 0; i < l; i++) {
                    selElmnt = x[i].getElementsByTagName("select")[0];
                    ll = selElmnt.length;
                    /* For each element, create a new DIV that will act as the selected item: */
                    a = document.createElement("DIV");
                    a.setAttribute("class", "select-selected");
                    a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
                    x[i].appendChild(a);
                    /* For each element, create a new DIV that will contain the option list: */
                    b = document.createElement("DIV");
                    b.setAttribute("class", "select-items select-hide");
                    for (j = 1; j < ll; j++) {
                        /* For each option in the original select element,
                         create a new DIV that will act as an option item: */
                        c = document.createElement("DIV");
                        c.innerHTML = selElmnt.options[j].innerHTML;
                        c.addEventListener("click", function (e) {
                            /* When an item is clicked, update the original select box,
                             and the selected item: */
                            var y, i, k, s, h, sl, yl;
                            s = this.parentNode.parentNode.getElementsByTagName("select")[0];
                            sl = s.length;
                            h = this.parentNode.previousSibling;
                            for (i = 0; i < sl; i++) {
                                if (s.options[i].innerHTML == this.innerHTML) {
                                    s.selectedIndex = i;
                                    h.innerHTML = this.innerHTML;
                                    y = this.parentNode.getElementsByClassName("same-as-selected");
                                    yl = y.length;
                                    for (k = 0; k < yl; k++) {
                                        y[k].removeAttribute("class");
                                    }
                                    this.setAttribute("class", "same-as-selected");
                                    break;
                                }
                            }
                            h.click();
                        });
                        b.appendChild(c);
                    }
                    x[i].appendChild(b);
                    a.addEventListener("click", function (e) {
                        /* When the select box is clicked, close any other select boxes,
                         and open/close the current select box: */
                        e.stopPropagation();
                        closeAllSelect(this);
                        this.nextSibling.classList.toggle("select-hide");
                        this.classList.toggle("select-arrow-active");
                    });
                }

                function closeAllSelect(elmnt) {
                    /* A function that will close all select boxes in the document,
                     except the current select box: */
                    var x, y, i, xl, yl, arrNo = [];
                    x = document.getElementsByClassName("select-items");
                    y = document.getElementsByClassName("select-selected");
                    xl = x.length;
                    yl = y.length;
                    for (i = 0; i < yl; i++) {
                        if (elmnt == y[i]) {
                            arrNo.push(i)
                        } else {
                            y[i].classList.remove("select-arrow-active");
                        }
                    }
                    for (i = 0; i < xl; i++) {
                        if (arrNo.indexOf(i)) {
                            x[i].classList.add("select-hide");
                        }
                    }
                }

                /* If the user clicks anywhere outside the select box,
                 then close all select boxes: */
                document.addEventListener("click", closeAllSelect);
            </script>
    </body>

</html>
