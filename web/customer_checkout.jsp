<%-- 
    Document   : customer_checkout
    Created on : Sep 29, 2022, 8:26:44 AM
    Author     : thekh
--%>

<%@page import="com.ebutler.swp.dto.UserDTO"%>
<%@page import="com.ebutler.swp.dto.CartServiceDTO"%>
<%@page import="com.ebutler.swp.dto.ProductDetailDTO"%>
<%@page import="com.ebutler.swp.dto.CartDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
            rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="customer_css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">


        <!--form-->
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" />
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" />

        <link rel="stylesheet" href="customer_css/profile-css.css" />


        <link rel="stylesheet" href="customer_css/cart-css.css">

        <link rel="stylesheet" href="css/myStyle.css">

        <style>
            /*---------------------
              Checkout
            -----------------------*/

            .checkout {
                padding-top: 80px;
                padding-bottom: 70px;
            }

            .coupon__link {
                font-size: 14px;
                color: #444444;
                padding: 14px 0;
                background: #f5f5f5;
                border-top: 2px solid #273A89;
                text-align: center;
                margin-bottom: 50px;
            }

            .coupon__link a {
                font-size: 14px;
                color: #444444;
            }

            .coupon__link span {
                font-size: 14px;
                color: #273A89;
            }

            .checkout__form h5 {
                color: #111111;
                font-weight: 600;
                text-transform: uppercase;
                border-bottom: 1px solid #e1e1e1;
                padding-bottom: 20px;
                margin-bottom: 25px;
            }

            .checkout__form .checkout__form__input p {
                color: #444444;
                font-weight: 500;
                margin-bottom: 10px;
            }

            .checkout__form .checkout__form__input p span {
                color: #273A89;
            }

            .checkout__form .checkout__form__input input {
                height: 50px;
                width: 100%;
                border: 1px solid #e1e1e1;
                border-radius: 2px;
                margin-bottom: 25px;
                font-size: 14px;
                padding-left: 20px;
                color: #666666;
            }

            .checkout__form .checkout__form__input input::-webkit-input-placeholder {
                color: #666666;
            }

            .checkout__form .checkout__form__input input::-moz-placeholder {
                color: #666666;
            }

            .checkout__form .checkout__form__input input:-ms-input-placeholder {
                color: #666666;
            }

            .checkout__form .checkout__form__input input::-ms-input-placeholder {
                color: #666666;
            }

            .checkout__form .checkout__form__input input::placeholder {
                color: #666666;
            }

            .checkout__form .checkout__form__checkbox {
                margin-bottom: 20px;
            }

            .checkout__form .checkout__form__checkbox label {
                display: block;
                padding-left: 24px;
                font-size: 14px;
                color: #444444;
                font-weight: 500;
                position: relative;
                cursor: pointer;
                margin-bottom: 16px;
            }

            .checkout__form .checkout__form__checkbox label input {
                position: absolute;
                visibility: hidden;
            }

            .checkout__form .checkout__form__checkbox label input:checked~.checkmark {
                border-color: #273A89;
            }

            .checkout__form .checkout__form__checkbox label input:checked~.checkmark:after {
                border-color: #273A89;
                opacity: 1;
            }

            .checkout__form .checkout__form__checkbox label .checkmark {
                position: absolute;
                left: 0;
                top: 4px;
                height: 10px;
                width: 10px;
                border: 1px solid #444444;
                border-radius: 2px;
            }

            .checkout__form .checkout__form__checkbox label .checkmark:after {
                position: absolute;
                left: 0px;
                top: -2px;
                width: 11px;
                height: 5px;
                border: solid #ffffff;
                border-width: 1.5px 1.5px 0px 0px;
                -webkit-transform: rotate(127deg);
                -ms-transform: rotate(127deg);
                transform: rotate(127deg);
                opacity: 0;
                content: "";
            }

            .checkout__form .checkout__form__checkbox p {
                margin-bottom: 0;
            }

            .checkout__order {
                background: #f5f5f5;
                padding: 30px;
            }

            .checkout__order h5 {
                border-bottom: 1px solid #d7d7d7;
                margin-bottom: 18px;
            }

            .checkout__order .site-btn {
                width: 100%;
            }

            .checkout__order__product {
                border-bottom: 1px solid #d7d7d7;
                padding-bottom: 22px;
            }

            .checkout__order__product ul li {
                list-style: none;
                font-size: 14px;
                color: #444444;
                font-weight: 500;
                overflow: hidden;
                margin-bottom: 14px;
                line-height: 24px;
            }

            .checkout__order__product ul li:last-child {
                margin-bottom: 0;
            }

            .checkout__order__product ul li span {
                font-size: 14px;
                color: #111111;
                font-weight: 600;
                float: right;
            }

            .checkout__order__product ul li .top__text {
                font-size: 16px;
                color: #111111;
                font-weight: 600;
                float: left;
            }

            .checkout__order__product ul li .top__text__right {
                font-size: 16px;
                color: #111111;
                font-weight: 600;
                float: right;
            }

            .checkout__order__total {
                padding-top: 12px;
                border-bottom: 1px solid #d7d7d7;
                padding-bottom: 10px;
                margin-bottom: 25px;
            }

            .checkout__order__total ul li {
                list-style: none;
                font-size: 16px;
                color: #111111;
                font-weight: 600;
                overflow: hidden;
                line-height: 40px;
            }

            .checkout__order__total ul li span {
                color: #273A89;
                float: right;
            }

            .checkout__order__widget {
                padding-bottom: 10px;
            }

            .checkout__order__widget label {
                display: block;
                padding-left: 25px;
                font-size: 14px;
                font-weight: 500;
                color: #111111;
                position: relative;
                cursor: pointer;
                margin-bottom: 14px;
            }

            .checkout__order__widget label input {
                position: absolute;
                visibility: hidden;
            }

            .checkout__order__widget label input:checked~.checkmark {
                border-color: #273A89;
            }

            .checkout__order__widget label input:checked~.checkmark:after {
                border-color: #273A89;
                opacity: 1;
            }

            .checkout__order__widget label .checkmark {
                position: absolute;
                left: 0;
                top: 4px;
                height: 10px;
                width: 10px;
                border: 1px solid #444444;
                border-radius: 2px;
            }

            .checkout__order__widget label .checkmark:after {
                position: absolute;
                left: 0px;
                top: -2px;
                width: 11px;
                height: 5px;
                border: solid #ffffff;
                border-width: 1.5px 1.5px 0px 0px;
                -webkit-transform: rotate(127deg);
                -ms-transform: rotate(127deg);
                transform: rotate(127deg);
                opacity: 0;
                content: "";
            }


            /*--------------------------------- Responsive Media Quaries -----------------------------*/

            @media only screen and (min-width: 1600px) and (max-width: 1900px) {
                .header {
                    padding: 0 85px;
                }
            }

            @media only screen and (min-width: 1200px) and (max-width: 1599px) {
                .header__menu ul li {
                    margin-right: 20px;
                }

                .header {
                    padding: 0 30px;
                }
            }

            @media only screen and (min-width: 1200px) {
                .container {
                    max-width: 1170px;
                }
            }

            /* Medium Device = 1200px */

            @media only screen and (min-width: 992px) and (max-width: 1199px) {
                .header__menu ul li {
                    margin-right: 20px;
                }

                .header__right__auth {
                    margin-right: 5px;
                }

                .sidebar__filter a {
                    padding: 5px 15px 5px 15px;
                }

                .nav::before {
                    width: 240px;
                }

                .nav::after {
                    width: 240px;
                }
            }

            /* Tablet Device = 768px */

            @media only screen and (min-width: 768px) and (max-width: 991px) {
                .filter__controls li {
                    margin-right: 15px;
                }

                .discount__pic img {
                    height: auto;
                }

                .discount__text {
                    height: auto;
                }

                .sidebar__filter a {
                    position: relative;
                    bottom: 0;
                }

                .filter-range-wrap .range-slider .price-input input {
                    max-width: 27%;
                }

                .filter-range-wrap .range-slider .price-input {
                    margin-bottom: 20px;
                }

                .product__details__pic {
                    margin-bottom: 50px;
                }

                .nav::before {
                    width: 125px;
                }

                .nav::after {
                    width: 125px;
                }

                .discount__content {
                    margin-bottom: 40px;
                }

                .checkout__order {
                    margin-top: 20px;
                }

                .blog__sidebar {
                    padding-left: 0;
                }

                .canvas__open {
                    display: block;
                    font-size: 22px;
                    color: #222;
                    height: 35px;
                    width: 35px;
                    line-height: 35px;
                    text-align: center;
                    border: 1px solid #323232;
                    border-radius: 2px;
                    cursor: pointer;
                    position: absolute;
                    right: 15px;
                    top: 24px;
                }

                .offcanvas-menu-overlay {
                    position: fixed;
                    left: 0;
                    top: 0;
                    height: 100%;
                    width: 100%;
                    background: rgba(0, 0, 0, 0.7);
                    content: "";
                    z-index: 98;
                    -webkit-transition: all, 0.5s;
                    -o-transition: all, 0.5s;
                    transition: all, 0.5s;
                    visibility: hidden;
                }

                .offcanvas-menu-overlay.active {
                    visibility: visible;
                }

                .offcanvas-menu-wrapper {
                    position: fixed;
                    left: -300px;
                    width: 300px;
                    height: 100%;
                    background: #ffffff;
                    padding: 90px 20px 30px 30px;
                    display: block;
                    z-index: 99;
                    overflow-y: auto;
                    -webkit-transition: all, 0.5s;
                    -o-transition: all, 0.5s;
                    transition: all, 0.5s;
                    opacity: 0;
                }

                .offcanvas-menu-wrapper.active {
                    opacity: 1;
                    left: 0;
                }

                .offcanvas__close {
                    position: absolute;
                    width: 40px;
                    height: 40px;
                    right: 30px;
                    top: 25px;
                    border: 1px solid #ddd;
                    border-radius: 50%;
                    font-size: 26px;
                    text-align: center;
                    -webkit-transform: rotate(45deg);
                    -ms-transform: rotate(45deg);
                    transform: rotate(45deg);
                    cursor: pointer;
                }

                .offcanvas__menu {
                    display: none;
                }

                .slicknav_btn {
                    display: none;
                }

                .slicknav_menu {
                    background: transparent;
                    padding: 0;
                    margin-bottom: 20px;
                }

                .slicknav_nav ul {
                    margin: 0;
                }

                .slicknav_nav .slicknav_row,
                .slicknav_nav a {
                    padding: 7px 0;
                    margin: 0;
                    color: #111111;
                    font-weight: 600;
                }

                .slicknav_nav .slicknav_row:hover {
                    border-radius: 0;
                    background: transparent;
                    color: #111111;
                }

                .slicknav_nav a:hover {
                    border-radius: 0;
                    background: transparent;
                    color: #111111;
                }

                .slicknav_nav {
                    display: block !important;
                }

                .offcanvas__logo {
                    margin-bottom: 25px;
                }

                .offcanvas__widget {
                    text-align: center;
                    margin-bottom: 20px;
                }

                .offcanvas__widget li {
                    list-style: none;
                    display: inline-block;
                    font-size: 18px;
                    color: #111111;
                    margin-right: 20px;
                    cursor: pointer;
                }

                .offcanvas__widget li:last-child {
                    margin-right: 0;
                }

                .offcanvas__widget li a {
                    font-size: 18px;
                    color: #111111;
                    position: relative;
                }

                .offcanvas__widget li a .tip {
                    position: absolute;
                    right: -12px;
                    top: -11px;
                    height: 18px;
                    width: 18px;
                    background: #111111;
                    font-size: 10px;
                    font-weight: 500;
                    color: #ffffff;
                    line-height: 18px;
                    text-align: center;
                    border-radius: 50%;
                }

                .offcanvas__auth a {
                    font-size: 15px;
                    color: #111111;
                    position: relative;
                    margin-right: 8px;
                    font-weight: 500;
                }

                .offcanvas__auth a:last-child {
                    margin-right: 0;
                }

                .offcanvas__auth a:last-child:after {
                    display: none;
                }

                .offcanvas__auth a:after {
                    position: absolute;
                    right: -8px;
                    top: -2px;
                    content: "/";
                    font-size: 13px;
                }

                .header__menu {
                    display: none;
                }

                .header__right {
                    display: none;
                }
            }

            /* Wide Mobile = 480px */

            @media only screen and (max-width: 767px) {
                .canvas__open {
                    display: block;
                    font-size: 22px;
                    color: #222;
                    height: 35px;
                    width: 35px;
                    line-height: 35px;
                    text-align: center;
                    border: 1px solid #323232;
                    border-radius: 2px;
                    cursor: pointer;
                    position: absolute;
                    right: 15px;
                    top: 24px;
                }

                .offcanvas-menu-overlay {
                    position: fixed;
                    left: 0;
                    top: 0;
                    height: 100%;
                    width: 100%;
                    background: rgba(0, 0, 0, 0.7);
                    content: "";
                    z-index: 98;
                    -webkit-transition: all, 0.5s;
                    -o-transition: all, 0.5s;
                    transition: all, 0.5s;
                    visibility: hidden;
                }

                .offcanvas-menu-overlay.active {
                    visibility: visible;
                }

                .offcanvas-menu-wrapper {
                    position: fixed;
                    left: -270px;
                    width: 270px;
                    height: 100%;
                    background: #ffffff;
                    padding: 90px 20px 30px 30px;
                    display: block;
                    z-index: 99;
                    overflow-y: auto;
                    -webkit-transition: all, 0.5s;
                    -o-transition: all, 0.5s;
                    transition: all, 0.5s;
                    opacity: 0;
                }

                .offcanvas-menu-wrapper.active {
                    opacity: 1;
                    left: 0;
                }

                .offcanvas__close {
                    position: absolute;
                    width: 40px;
                    height: 40px;
                    right: 30px;
                    top: 25px;
                    border: 1px solid #ddd;
                    border-radius: 50%;
                    font-size: 26px;
                    text-align: center;
                    -webkit-transform: rotate(45deg);
                    -ms-transform: rotate(45deg);
                    transform: rotate(45deg);
                    cursor: pointer;
                }

                .offcanvas__menu {
                    display: none;
                }

                .slicknav_btn {
                    display: none;
                }

                .slicknav_menu {
                    background: transparent;
                    padding: 0;
                    margin-bottom: 20px;
                }

                .slicknav_nav ul {
                    margin: 0;
                }

                .slicknav_nav .slicknav_row,
                .slicknav_nav a {
                    padding: 7px 0;
                    margin: 0;
                    color: #111111;
                    font-weight: 600;
                }

                .slicknav_nav .slicknav_row:hover {
                    border-radius: 0;
                    background: transparent;
                    color: #111111;
                }

                .slicknav_nav a:hover {
                    border-radius: 0;
                    background: transparent;
                    color: #111111;
                }

                .slicknav_nav {
                    display: block !important;
                }

                .offcanvas__logo {
                    margin-bottom: 25px;
                }

                .offcanvas__widget {
                    text-align: center;
                    margin-bottom: 20px;
                }

                .offcanvas__widget li {
                    list-style: none;
                    display: inline-block;
                    font-size: 18px;
                    color: #111111;
                    margin-right: 20px;
                    cursor: pointer;
                }

                .offcanvas__widget li:last-child {
                    margin-right: 0;
                }

                .offcanvas__widget li a {
                    font-size: 18px;
                    color: #111111;
                    position: relative;
                }

                .offcanvas__widget li a .tip {
                    position: absolute;
                    right: -12px;
                    top: -11px;
                    height: 18px;
                    width: 18px;
                    background: #111111;
                    font-size: 10px;
                    font-weight: 500;
                    color: #ffffff;
                    line-height: 18px;
                    text-align: center;
                    border-radius: 50%;
                }

                .offcanvas__auth a {
                    font-size: 15px;
                    color: #111111;
                    position: relative;
                    margin-right: 8px;
                    font-weight: 500;
                }

                .offcanvas__auth a:last-child {
                    margin-right: 0;
                }

                .offcanvas__auth a:last-child:after {
                    display: none;
                }

                .offcanvas__auth a:after {
                    position: absolute;
                    right: -8px;
                    top: -2px;
                    content: "/";
                    font-size: 13px;
                }

                .header__menu {
                    display: none;
                }

                .header__right {
                    display: none;
                }

                .filter__controls {
                    text-align: left;
                    margin-bottom: 40px;
                }

                .filter__controls li {
                    margin-right: 20px;
                }

                .discount__pic img {
                    height: auto;
                }

                .discount__text {
                    padding: 75px 40px 50px;
                    height: auto;
                }

                .product__details__pic__left {
                    height: auto;
                }

                .product__details__pic {
                    margin-bottom: 30px;
                }

                .quantity {
                    float: none;
                    margin-right: 0;
                }

                .nav::before {
                    display: none;
                }

                .nav::after {
                    display: none;
                }

                .shop__cart__table {
                    overflow-x: auto;
                }

                .shop__cart__table tbody tr .cart__product__item img {
                    float: none;
                    margin-right: 0;
                }

                .cart__btn {
                    text-align: center;
                    margin-bottom: 25px;
                }

                .cart__btn.update__btn {
                    text-align: center;
                }

                .discount__content h6 {
                    display: block;
                    margin-right: 0;
                    margin-bottom: 20px;
                }

                .discount__content {
                    margin-bottom: 35px;
                }

                .blog__sidebar {
                    padding-left: 0;
                    padding-top: 40px;
                }

                .contact__content {
                    margin-bottom: 40px;
                }
            }

            /* Small Device = 320px */

            @media only screen and (max-width: 479px) {
                .categories__item.categories__large__item {
                    padding-left: 30px;
                }

                .banner__text h1 {
                    font-size: 45px;
                }

                .filter__controls li {
                    margin-right: 5px;
                    margin-bottom: 5px;
                }

                .discount__text {
                    padding: 75px 0px 50px;
                }

                .footer__newslatter form {
                    text-align: center;
                }

                .footer__newslatter form input {
                    margin-bottom: 10px;
                }

                .footer__newslatter form button {
                    position: relative;
                    right: 0;
                    top: 0;
                }

                .product__details__button .cart-btn {
                    float: none;
                    margin-right: 0;
                }

                .product__details__button ul {
                    float: none;
                }

                .nav-item {
                    margin-right: 20px;
                }

                .blog__details__item__title {
                    margin-right: 30px;
                }

                .blog__comment__item.blog__comment__item--reply {
                    padding-left: 0;
                }

                .blog__comment__item__text ul li {
                    margin-right: 5px;
                }

                .primary-btn.load-btn {
                    padding: 12px 50px 10px;
                }

                .blog__comment__item__pic {
                    float: none;
                    margin-bottom: 20px;
                }

                .discount__content form {
                    width: 100%;
                }

                .search-model-form input {
                    width: 100%;
                    font-size: 24px;
                }
            }

            .checkout {
                padding-top: 80px;
                padding-bottom: 70px;
            }

            .coupon__link {
                font-size: 14px;
                color: #444444;
                padding: 14px 0;
                background: #f5f5f5;
                border-top: 2px solid #ca1515;
                text-align: center;
                margin-bottom: 50px;
            }

            .coupon__link a {
                font-size: 14px;
                color: #444444;
            }

            .coupon__link span {
                font-size: 14px;
                color: #ca1515;
            }

            .checkout__form h5 {
                color: #111111;
                font-weight: 600;
                text-transform: uppercase;
                border-bottom: 1px solid #e1e1e1;
                padding-bottom: 20px;
                margin-bottom: 25px;
            }

            .checkout__form .checkout__form__input p {
                color: #444444;
                font-weight: 500;
                margin-bottom: 10px;
            }

            .checkout__form .checkout__form__input p span {
                color: #ca1515;
            }

            .checkout__form .checkout__form__input input {
                height: 50px;
                width: 100%;
                border: 1px solid #e1e1e1;
                border-radius: 2px;
                margin-bottom: 25px;
                font-size: 14px;
                padding-left: 20px;
                color: #666666;
            }

            .checkout__form .checkout__form__input input::-webkit-input-placeholder {
                color: #666666;
            }

            .checkout__form .checkout__form__input input::-moz-placeholder {
                color: #666666;
            }

            .checkout__form .checkout__form__input input:-ms-input-placeholder {
                color: #666666;
            }

            .checkout__form .checkout__form__input input::-ms-input-placeholder {
                color: #666666;
            }

            .checkout__form .checkout__form__input input::placeholder {
                color: #666666;
            }

            .checkout__form .checkout__form__checkbox {
                margin-bottom: 20px;
            }

            .checkout__form .checkout__form__checkbox label {
                display: block;
                padding-left: 24px;
                font-size: 14px;
                color: #444444;
                font-weight: 500;
                position: relative;
                cursor: pointer;
                margin-bottom: 16px;
            }

            .checkout__form .checkout__form__checkbox label input {
                position: absolute;
                visibility: hidden;
            }

            .checkout__form .checkout__form__checkbox label input:checked~.checkmark {
                border-color: #ca1515;
            }

            .checkout__form .checkout__form__checkbox label input:checked~.checkmark:after {
                border-color: #ca1515;
                opacity: 1;
            }

            .checkout__form .checkout__form__checkbox label .checkmark {
                position: absolute;
                left: 0;
                top: 4px;
                height: 10px;
                width: 10px;
                border: 1px solid #444444;
                border-radius: 2px;
            }

            .checkout__form .checkout__form__checkbox label .checkmark:after {
                position: absolute;
                left: 0px;
                top: -2px;
                width: 11px;
                height: 5px;
                border: solid #ffffff;
                border-width: 1.5px 1.5px 0px 0px;
                -webkit-transform: rotate(127deg);
                -ms-transform: rotate(127deg);
                transform: rotate(127deg);
                opacity: 0;
                content: "";
            }

            .checkout__form .checkout__form__checkbox p {
                margin-bottom: 0;
            }

            .checkout__order {
                background: #f5f5f5;
                padding: 30px;
            }

            .checkout__order h5 {
                border-bottom: 1px solid #d7d7d7;
                margin-bottom: 18px;
            }

            .checkout__order .site-btn {
                width: 100%;
            }

            .checkout__order__product {
                border-bottom: 1px solid #d7d7d7;
                padding-bottom: 22px;
            }

            .checkout__order__product ul li {
                list-style: none;
                font-size: 14px;
                color: #444444;
                font-weight: 500;
                overflow: hidden;
                margin-bottom: 14px;
                line-height: 24px;
            }

            .checkout__order__product ul li:last-child {
                margin-bottom: 0;
            }

            .checkout__order__product ul li span {
                font-size: 14px;
                color: #111111;
                font-weight: 600;
                float: right;
            }

            .checkout__order__product ul li .top__text {
                font-size: 16px;
                color: #111111;
                font-weight: 600;
                float: left;
            }

            .checkout__order__product ul li .top__text__right {
                font-size: 16px;
                color: #111111;
                font-weight: 600;
                float: right;
            }

            .checkout__order__total {
                padding-top: 12px;
                border-bottom: 1px solid #d7d7d7;
                padding-bottom: 10px;
                margin-bottom: 25px;
            }

            .checkout__order__total ul li {
                list-style: none;
                font-size: 16px;
                color: #111111;
                font-weight: 600;
                overflow: hidden;
                line-height: 40px;
            }

            .checkout__order__total ul li span {
                color: #ca1515;
                float: right;
            }

            .checkout__order__widget {
                padding-bottom: 10px;
            }

            .checkout__order__widget label {
                display: block;
                padding-left: 25px;
                font-size: 14px;
                font-weight: 500;
                color: #111111;
                position: relative;
                cursor: pointer;
                margin-bottom: 14px;
            }

            .checkout__order__widget label input {
                position: absolute;
                visibility: hidden;
            }

            .checkout__order__widget label input:checked~.checkmark {
                border-color: #ca1515;
            }

            .checkout__order__widget label input:checked~.checkmark:after {
                border-color: #ca1515;
                opacity: 1;
            }

            .checkout__order__widget label .checkmark {
                position: absolute;
                left: 0;
                top: 4px;
                height: 10px;
                width: 10px;
                border: 1px solid #444444;
                border-radius: 2px;
            }

            .checkout__order__widget label .checkmark:after {
                position: absolute;
                left: 0px;
                top: -2px;
                width: 11px;
                height: 5px;
                border: solid #ffffff;
                border-width: 1.5px 1.5px 0px 0px;
                -webkit-transform: rotate(127deg);
                -ms-transform: rotate(127deg);
                transform: rotate(127deg);
                opacity: 0;
                content: "";
            }
        </style>

        <title>E-Butler</title>
    </head>

    <body>
        <%
            UserDTO login_user = (UserDTO) session.getAttribute("LOGIN_USER");
        %>
        <!-- Spinner Start -->
        <div id="spinner"
             class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

        <!-- Navbar Start -->
            <div class="container-fluid nav-bar bg-transparent">
                <nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4 relative">
                    <a href="landingPage.html" class="navbar-brand d-flex align-items-center text-center">
                        <div class="p-2 me-2">
                            <img class="img-fluid" src="img/logo.png" alt="Icon" style="width: 40px; height: 40px;">
                        </div>
                        <h1 class="text-primary">E-Butler</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <div class="navbar-nav ms-auto">
                            <a href="#" class="nav-item nav-link active navigator">Home</a>
                            <a href="#product" class="nav-item nav-link navigator">Product</a>
                            <div class="nav-item dropdown">
                                <a href="#service" class="nav-link navigator">Service</a>
                            </div>
                            <a href="#help" class="nav-item nav-link navigator">Help</a>
                            <div class="search absolute hide">
                                <a><i class="fa-solid fa-magnifying-glass"></i></a>
                                <input
                                    style="flex: 1; background-color: transparent; border: none; outline: none; margin: 0 20px;"
                                    type="text" placeholder="Type and press enter">
                                <a class="search-close opacity"><i class="fa-solid fa-xmark"></i></a>
                            </div>
                            <div class="nav-item dropdown">
                                <a class="nav-link"><i class="fa-solid fa-user"></i></a>
                                <div class="dropdown-menu rounded-0 m-12">
                                    <a style="color: var(--primary-color); font-weight: bold;" href="MainController?action=GoToUserProfile" class="dropdown-item login--link"><%=login_user.getUsername()%></a>
                                    <a href="MainController?action=Logout" class="dropdown-item register--link">logout</a>
                                </div>
                            </div>
                            <a class="nav-item nav-link search-open "><i class="fa-solid fa-magnifying-glass"></i></a>
                            <a class="nav-item nav-link"><i class="fa-solid fa-cart-shopping"></i></a>
                        </div>
                    </div>
                </nav>
            </div>
            <!-- Navbar End -->

        <%
            CartServiceDTO cartService = (CartServiceDTO) session.getAttribute("CART_SERVICE");
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            if (cart != null) {
                double total = 0;
        %>
        <!-- Checkout Section Begin -->
        <section class="checkout spad">
            <div class="container bg-white">
                <div class="row">
                    <div class="col-lg-12">
                        <h6 class="coupon__link"><span class="icon_tag_alt"></span> <a href="#">Have a coupon?</a> Click
                            here to enter your code.</h6>
                    </div>
                </div>

                <form action="MainController" method="POST" class="checkout__form">
                    <div class="row">
                        <div class="col-lg-8">
                            <h5>Billing detail</h5>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="checkout__form__input">
                                        <p>First Name <span></span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="checkout__form__input">
                                        <p>Last Name <span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="checkout__form__input">
                                        <p>Address <span>*</span></p>
                                        <input type="text">
                                    </div>




                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="checkout__form__input">
                                        <p>Phone <span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="checkout__form__input">
                                        <p>Email <span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="checkout__order">
                                <h5>Your order</h5>
                                <div class="checkout__order__product">
                                    <ul>
                                        <li>
                                            <span class="top__text">Product</span>
                                            <span class="top__text__right">Total</span>
                                        </li>
                                        <%
                                            for (ProductDetailDTO product : cart.getCart().values()) {
                                                double sub_total = 0;
                                                sub_total += product.getPrice() * product.getQuantity();
                                        %>
                                        <li> <%= product.getName()%> <span> <%= sub_total%> </span></li>               
                                        <input type="hidden" name="id" value="<%=product.getId()%>">
                                        <input type="hidden" name="quantity" value="<%=product.getQuantity()%>">  
                                        <input type="hidden" name="price" value="<%=product.getPrice()%>">          
                                        <%
                                                total += sub_total;
                                            }
                                        %>
                                    </ul>
                                </div>

                                <div class="checkout__order__total">
                                    <ul>

                                        <li>Total <span>$ <%= total%></span></li>
                                    </ul>
                                </div>
                                <!--                                <div class="checkout__order__widget">
                                                                    <label for="cash">
                                                                        Cash
                                                                        <input type="checkbox" id="cash">
                                                                        <span class="checkmark"></span>
                                                                    </label>
                                                                    <label for="paypal">
                                                                        PayPal
                                                                        <input type="checkbox" id="paypal">
                                                                        <span class="checkmark"></span>
                                                                    </label>
                                                                </div>-->
                                <input type="hidden" name="total" value="<%=total%>">

                                <button style="background: blue" type="submit" name="action" value="Checkout" class="site-btn">Proceed</button>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </section>
        <%
            }
        %>
        <!-- Checkout Section End -->




        <!-- Shop Cart Section End -->



        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>

        <!--Select only one checkbox in a group-->
        <script>
            // the selector will match all input controls of type :checkbox
            // and attach a click event handler 
            $("input:checkbox").on('click', function () {
                // in the handler, 'this' refers to the box clicked on
                var $box = $(this);
                if ($box.is(":checked")) {
                    // the name of the box is retrieved using the .attr() method
                    // as it is assumed and expected to be immutable
                    var group = "input:checkbox[name='" + $box.attr("name") + "']";
                    // the checked state of the group/box on the other hand will change
                    // and the current value is retrieved using .prop() method
                    $(group).prop("checked", false);
                    $box.prop("checked", true);
                } else {
                    $box.prop("checked", false);
                }
            });
        </script>

        <!--Select Date-->

        <script>
            $(function () {
                $("#datepicker").datepicker({
                    autoclose: false,
                    todayHighlight: true
                }).datepicker('update', new Date());
            });
            $(function () {
                $("#datepicker1").datepicker({
                    autoclose: true,
                    todayHighlight: true
                }).datepicker('update', new Date());
            });

        </script>

    </body>

</html>
