<%-- 
    Document   : customer_productPage
    Created on : Sep 29, 2022, 10:47:34 AM
    Author     : Dang Viet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>E-Butler</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Icon FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/grid.css">
    <link rel="stylesheet" href="css/base.css">

    <!-- My Stylesheet -->
    <link rel="stylesheet" href="css/myStyle.css">
    <link rel="stylesheet" href="css/customerPage.css">
</head>

<body>
    <div class="container-xxl bg-white p-0">
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
                            <input style="flex: 1; background-color: transparent; border: none; outline: none; margin: 0 20px;" type="text" placeholder="Type and press enter">
                            <a class="search-close opacity"><i class="fa-solid fa-xmark"></i></a>
                        </div>
                        <div class="nav-item dropdown">
                            <a class="nav-link"><i class="fa-solid fa-user"></i></a>
                            <div class="dropdown-menu rounded-0 m-12">
                                <a href="#" class="dropdown-item login--link">username</a>
                                <a href="#" class="dropdown-item register--link">logout</a>
                            </div>
                        </div>
                        <a class="nav-item nav-link search-open"><i class="fa-solid fa-magnifying-glass"></i></a>
                        <a href="customer_cart.jsp" class="nav-item nav-link"><i class="fa-solid fa-cart-shopping"></i></a>
                    </div>
                </div>
            </nav>
        </div>
        <!-- Navbar End -->

        <!-- Slider Start -->
        <div class="grid wide">
            <div class="row my-32 title pad-y-60">
                <div class="col l-9 s-12 m-12">
                    <h1 class="my-24">Product</h1>
                    <span class="text-s">We not only help you design exceptional products, but also make it easy for you
                        to share your designs with more like-minded people.</span>
                </div>
            </div>
        </div>
        <!-- Slider End -->

        <!-- Product List Start -->
        <div style="max-height: var(--list-h);" class="grid wide border-bot border-top">
            <div class="grid">
                <div class="row my-32">
                    <div class="col l-9">

                    </div>

                    <div class="col l-3 flex-center">
                        <div class="sort-btn">
                            <i class="fa-solid fa-sort mx-12"></i>
                            <select class="no-border select" name="" id="">
                                <option value="">Sort order</option>
                                <option value="">Sort 1</option>
                                <option value="">Sort 2</option>
                                <option value="">Sort 3</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row my-32">
                    <!-- product item -->
                    
                    <c:forEach items="${sessionScope.PRODUCT_DETAIL_BY_TYPE}" var="o">
                    <div style="margin-bottom: 20px" class="col l-4">
                        <div class="block__item">
                            <div class="block__img flex-center relative">
                                <img src="${o.image}"
                                    alt="">
                                <a href="MainController?action=AddToCart&product_ID=${o.id}"
                                    style="background-color: black; color: white; right: 52%;"
                                    class="txt-border link absolute card-extend bot">
                                    <i class="fa-solid fa-bag-shopping"></i>
                                    Add to bag
                                </a>
                                <a style="background-color: white; color: black; left: 52%;"
                                    class="txt-border link absolute card-extend bot quick-view">
                                    <i class="fa-solid fa-expand"></i>
                                    Quick view
                                </a>
                            </div>
                            <div class="block__text pad-y-20">
                                <h6 style="text-align: start;" class="my-12">${o.name}</h6>
                                <p style="text-align: start;" class="text my-12">
                                    DescriptionDescriptionDescriptionDescriptionDescription</p>
                                <div class="row">
                                    <div class="col l-5">
                                        <p style="color: #4ADE80; border: 3px solid #4ADE80" class="txt-border-5">
                                            $ ${o.price}
                                        </p>
                                    </div>
                                    <div class="col l-2"></div>
                                    <div class="col l-5 flex-center">
                                        <div style="color: #F2B737;">
                                            <i class="fa-solid fa-star"></i>
                                            <span
                                                style="color: var(--text-color); line-height: 100%; margin: auto;">4.1</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                

<!--                    <div class="overlay fixed top bot left right flex-center hide">
                        <div class="popup relative">
                            <i style="margin: 12px 24px;"
                                class="fa-solid fa-xmark absolute right p-2 text-md opacity popup-close"></i>
                            <div style="padding: 40px;">
                                <div class="row scrollable-y">
                                    <div class="col l-6 m-6">
                                        <div class="img">
                                            <img src="https://chisnghiax.com/ciseco/static/media/detail1.f45e3a4d9bfeafd2f70b.jpg"
                                                alt="">
                                        </div>
                                    </div>
                                    <div class="col l-6 m-6">
                                        <div class="content">
                                            <h1>Product name</h1>
                                            <div class="flex">
                                                <p style="color: #4ADE80; border: 3px solid #4ADE80;"
                                                    class="txt-border-md my-32">
                                                    $ 369.00
                                                </p>
                                                <span class="separate"></span>
                                                <div style="justify-content: flex-start;" class="flex-center">
                                                    <div style="color: #F2B737;">
                                                        <i class="fa-solid fa-star"></i>
                                                        <span
                                                            style="color: var(--text-color); line-height: 100%; margin: auto;">4.1</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <h5>Provider: </h5>
                                                <h6 style="margin: 20px 0 20px 20px;">Description</h6>
                                            </div>
                                            <div class="row">
                                                <h5>Description: </h5>
                                                <h6 style="margin: 20px 0 20px 20px;">Content</h6>
                                            </div>
                                            <div class="row">
                                                <div style="background-color: #F5F8FB; padding: 3%; border-radius: 9999px;" class="d-flex col l-4" style="max-width: 300px">
                                                    <button class=" btn-circle me-2"
                                                            onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                        <i class="fas fa-minus"></i>
                                                    </button>
    
                                                    <div class="form-outline">
                                                        <input style="background-color: #F5F8FB; text-align: center; outline: none; font-weight: bold; font-size: 1.25rem; border: none;" min="1" value="1" name="quantity" type="number"
                                                               class="form-control" />
                                                    </div>
    
                                                    <button class=" btn-circle ms-2"
                                                            onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                        <i class="fas fa-plus"></i>
                                                        <input type="hidden" name="plus" value="Plus">
                                                    </button>
                                                </div>
                                                <div class="col l-8">
                                                    <button style="background-color: #0F172A; color: white;" class="my-btn-lg">
                                                        <i class="fa-solid fa-bag-shopping"></i>
                                                        <span style="margin-left: .75rem">Add to cart</span>
                                                    </button>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>-->
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row my-32">
                    <div class="row">
                        <div class="col l-6">
                            <ul style="padding: 12px" class="row">
                                <li class="bold text-circle mx-1">1</li>
                                <li class="bold text-circle mx-1">2</li>
                                <li class="bold text-circle mx-1">3</li>
                                <li class="bold text-circle mx-1">4</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product List End -->

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Get In Touch</h5>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+84 0123456789</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>mail@gmail.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>

    <!-- javascript -->
    <script src="js/access.js"></script>
    <script src="js/customer_productPage.js"></script>

</body>

</html>
