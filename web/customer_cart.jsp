<%-- 
    Document : cart 
    Created on : Sep 22, 2022, 7:36:37 PM 
    Author : thekh
--%>

<%@page import="com.ebutler.swp.dto.UserDTO"%>
<%@page import="com.ebutler.swp.dto.ServiceDetailDTO"%>
<%@page import="com.ebutler.swp.dto.CartServiceDTO"%>
<%@page import="com.ebutler.swp.dto.QuantityStockDTO"%>
<%@page import="com.ebutler.swp.dto.ProductDetailDTO"%>
<%@page import="com.ebutler.swp.dto.CartDTO"%>
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

        <!-- My Stylesheet -->
        <link rel="stylesheet" href="css/myStyle.css">
        <link rel="stylesheet" href="css/customer_profilePage.css">
    </head>

    <body>
        <%
            UserDTO login_user = (UserDTO) session.getAttribute("LOGIN_USER");
        %>
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
                            <a href="MainController?action=MoveToCart" class="nav-item nav-link"><i class="fa-solid fa-cart-shopping"></i></a>
                        </div>
                    </div>
                </nav>
            </div>
            <!-- Navbar End -->

            <!-- Header Start -->
            <div class="grid">
                <div class="grid wide">
                    <div style="margin-top: 64px;" class="flex-horizon-center flex-col m-y-32">
                        <h1 class="txt-xl">Shopping Cart</h1>
                    </div>
                </div>
            </div>
            <!-- Header End -->
            <%
                CartDTO cart = (CartDTO) session.getAttribute("CART");
                CartServiceDTO cartService = (CartServiceDTO) session.getAttribute(("CART_SERVICE"));
                QuantityStockDTO quantityStock = (QuantityStockDTO) session.getAttribute("STOCK");
                double total = 0;
            %>
            <!-- Cart start -->
            <div class="grid m-y-32">
                <div class="grid wide">
                    <div style="padding: 20px 0; border-top: 1px solid #E5E7EB; border-bottom: 1px solid #E5E7EB;"
                         class="row">
                        <div class="col l-7">
                            <!-- Product cart start -->
                            <div class="flex-col grid m-y-32 block-border">
                                <!-- Order head -->
                                <div style="background-color: #F9FAFB;" class="flex-between pad-2">
                                    <div class="flex-col flex-horizon-center">
                                        <span class="txt-lg bold">Product</span>
                                        <div class="flex-center">
                                            <span class="txt-md">order-date</span>
                                            <span class="m-x-12">-</span>
                                            <span class="delivered">delivered</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- Order detail -->
                                <form action="MainController" method="POST">
                                    <div class="pad-2">
                                        <%
                                            if (cart != null) {
                                                for (ProductDetailDTO product : cart.getCart().values()) {
                                                    double sub_total = 0;
                                                    sub_total += product.getPrice() * product.getQuantity();
                                        %>
                                        <div class="order-card m-y-12">
                                            <div class="flex">
                                                <div class="flex-center order-img">
                                                    <img src="<%= product.getImage()%>"
                                                         alt="">
                                                </div>
                                                <div style="flex: 1; margin-left: 1rem;" class="flex-col">
                                                    <div class="flex-between">
                                                        <div class="flex-col flex-horizon-center">
                                                            <span class="txt-lg bold"><%= product.getName()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                            <div class="flex-horizon-center flex-center">
                                                                <span class="txt-sm">Category</span>
                                                                <span class="m-x-12">:</span>
                                                                <span class="txt-sm">Product</span>
                                                            </div>
                                                        </div>

                                                        <div style="height: 50%;" class="flex-center col-3">
                                                           
                                                            <div class="">
                                                                <input
                                                                    style="text-align: center; outline: none; font-weight: bold; border: none;"
                                                                    min="1" name="quantity" value="<%= product.getQuantity()%>" type="number"
                                                                    class="form-control" />
                                                                <input type="hidden" name="id" value="<%= product.getId()%>"/>
                                                            </div>

                                                           
                                                        </div>
                                                        <div class="order-price txt-sm bold">
                                                            <span>
                                                                <%= product.getQuantity() * product.getPrice()%>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <div style="height: 50%;" class="flex-end flex-col">

                                                        <div class="flex-between">
                                                            <%
                                                                if (quantityStock.getQuantityStock().get(product.getId()) <= 0) {
                                                            %>
                                                            <span class="label txt-xs danger">
                                                                <i class="fa-solid fa-ban"></i>
                                                                Sold out
                                                            </span>
                                                            <%
                                                            } else {
                                                            %>
                                                            <span class="label txt-xs safe">
                                                                <i class="fa-solid fa-check"></i>
                                                                In Stock
                                                            </span>
                                                            <%
                                                                }
                                                            %>
                                                            <button class="btn" type="submit" name="action" value="EditQuantity"><i class="fa-solid fa-pen"></i></button>
                                                            <button style="color: var(--primary-color); border: none; outline: none; background-color: transparent;" class="bold txt-md">
                                                                <a href="MainController?action=DeleteCart&product_ID=<%= product.getId()%>"><span><i class="fa-solid fa-trash"></i></span></a>
                                                            </button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <%
                                                    total += sub_total;
                                                }
                                            }
                                        %>

                                    </div>
                                </form>
                            </div>
                            <!-- Product cart end -->

                            <!-- Service cart start-->

                            <div class="flex-col grid m-y-32 block-border">
                                <!-- Order head -->
                                <div style="background-color: #F9FAFB;" class="flex-between pad-2">
                                    <div class="flex-col flex-horizon-center">
                                        <span class="txt-lg bold">Service</span>
                                        <div class="flex-center">
                                            <span class="txt-md">order-date</span>
                                            <span class="m-x-12">-</span>
                                            <span class="delivered">delivered</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- Order detail -->
                                <form action="MainController" method="POST">
                                    <div class="pad-2">
                                        <%                                            double sub_total_service = 0;
                                            if (cartService != null) {
                                                for (ServiceDetailDTO service : cartService.getCart().values()) {
                                        %>
                                        <div class="order-card m-y-12">
                                            <div class="flex">
                                                <div class="flex-center order-img">
                                                    <img src="https://chisnghiax.com/ciseco/static/media/17.7701cf9446a6b588de67.png"
                                                         alt="">
                                                </div>
                                                <div style="flex: 1; margin-left: 1rem;" class="flex-col">
                                                    <div class="flex-between">
                                                        <div class="flex-col flex-horizon-center">
                                                            <span class="txt-lg bold">Staff: name</span>
                                                            <div class="flex-horizon-center flex-center">
                                                                <span class="txt-sm"><%= service.getName()%></span>
                                                                <span class="m-x-12">|</span>
                                                                <span class="txt-sm">Service</span>
                                                            </div>
                                                        </div>
                                                        <div class="order-price bold txt-sm">
                                                            <span>
                                                                <%= service.getPrice()%>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div style="height: 50%;" class="flex-end flex-col">
                                                        <div class="flex-between">
                                                            <%
                                                                if (service.getStatus() == 0) {
                                                            %>
                                                            <span class="label txt-xs danger">
                                                                <i class="fa-solid fa-ban"></i>
                                                                Suspension
                                                            </span>
                                                            <%
                                                            } else {
                                                            %>
                                                            <span class="label txt-xs safe">
                                                                <i class="fa-solid fa-check"></i>
                                                                Available
                                                            </span>
                                                            <%
                                                                }
                                                            %>

                                                            <button style="color: var(--primary-color); border: none; outline: none; background-color: transparent;" class="bold txt-md">
                                                                <a href="MainController?action=DeleteCart&service_ID=<%= service.getId()%>"><span><i class="fa-solid fa-trash"></i></span></a>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                                    total += sub_total_service;
                                                }
                                            }
                                        %>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- Service cart end-->

                        <div class="col l-1 m-y-32">
                            <div style="height: 100%;" class="flex-center">
                                <div style="width: 1px; background-color: #E5E7EB; height: 100%;">
                                </div>
                            </div>
                        </div>

                        <div class="col l-4 m-y-32">
                            <div class="flex-col sticky">
                                <div class="flex-between txt-lg bold">
                                    <span>Order Summary</span>
                                </div>
                                <div style="padding: 1rem 0; border-bottom: 1px solid #E5E7EB" class="flex-between txt-sm">
                                    <span>Order product total</span>
                                    <span class="bold">$400.000</span>
                                </div>
                                <div style="padding: 1rem 0; border-bottom: 1px solid #E5E7EB" class="flex-between txt-sm">
                                    <span>Order service total</span>
                                    <span class="bold">$400.000</span>
                                </div>
                                <div style="padding: 1rem 0; border-bottom: 1px solid #E5E7EB" class="flex-between txt-sm">
                                    <span>Tax estimate</span>
                                    <span class="bold">$400.000</span>
                                </div>
                                <div style="padding: 1rem 0;" class="flex-between txt-lg bold">
                                    <span>Order total</span>
                                    <span class="bold"><%= total%></span>
                                </div>
                                <button  style="width: 100%;" class="btn-lg m-y-12 txt-md"><a style="color:white" href="MainController?action=LoadCartData">Checkout</a></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Cart end -->




            <!-- Footer Start -->
            <div class="container-fluid bg-dark text-white-50 footer pt-5  wow fadeIn" data-wow-delay="0.1s">
                <div class="container py-5">
                    <div class="row g-5">
                        <div class="col-lg-3 col-md-6">
                            <h5 class="text-white mb-4">Get In Touch</h5>
                            <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i></p>
                            <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                            <p class="mb-2"><i class="fa fa-envelope me-3"></i>SE1111@e-butler.com</p>
                            <div class="d-flex pt-2">
                                <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                                <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h5 class="text-white mb-4">Quick Links</h5>
                            <a class="btn btn-link text-white-50" href="">About Us</a>
                            <a class="btn btn-link text-white-50" href="">Contact Us</a>
                            <a class="btn btn-link text-white-50" href="">Our Services</a>
                            <a class="btn btn-link text-white-50" href="">Privacy Policy</a>
                            <a class="btn btn-link text-white-50" href="">Terms & Condition</a>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h5 class="text-white mb-4">Photo Gallery</h5>
                            <div class="row g-2 pt-2">
                                <div class="col-4">
                                    <img class="img-fluid rounded bg-light p-1"
                                         src="https://cf.shopee.vn/file/d4bbea4570b93bfd5fc652ca82a262a8" alt="">
                                </div>
                                <div class="col-4">
                                    <img class="img-fluid rounded bg-light p-1"
                                         src="https://cf.shopee.vn/file/a0a9062ebe19b45c1ae0506f16af5c16" alt="">
                                </div>
                                <div class="col-4">
                                    <img class="img-fluid rounded bg-light p-1"
                                         src="https://cf.shopee.vn/file/38fd98e55806c3b2e4535c4e4a6c4c08" alt="">
                                </div>
                                <div class="col-4">
                                    <img class="img-fluid rounded bg-light p-1"
                                         src="https://cf.shopee.vn/file/2c46b83d84111ddc32cfd3b5995d9281" alt="">
                                </div>
                                <div class="col-4">
                                    <img class="img-fluid rounded bg-light p-1"
                                         src="https://cf.shopee.vn/file/77bf96a871418fbc21cc63dd39fb5f15" alt="">
                                </div>
                                <div class="col-4">
                                    <img class="img-fluid rounded bg-light p-1"
                                         src="https://cf.shopee.vn/file/3900aefbf52b1c180ba66e5ec91190e5" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h5 class="text-white mb-4">Newsletter</h5>
                            <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                            <div class="position-relative mx-auto" style="max-width: 400px;">
                                <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text"
                                       placeholder="Your email">
                                <button type="button"
                                        class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->
        </div>

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
</body>

</html>