<%@page import="com.ebutler.swp.dto.ServiceDTO"%>
<%@page import="com.ebutler.swp.dto.UserDTO"%>
<%@page import="java.util.List"%>
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
        <link rel="stylesheet" href="css/guestPage.css">
        <link rel="stylesheet" href="css/customerPage.css">
    </head>

    <body>
        <%
            List<ServiceDTO> productList = (List<ServiceDTO>) session.getAttribute("CUSTOMER_SERVICE_LIST");

            String category_id = (String) session.getAttribute("CATEGORYID");

            category_id = (category_id == null) ? "" : category_id;
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
                    <a href="LoadingProductAndServiceCategory" class="navbar-brand d-flex align-items-center text-center">
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
                            <a href="LoadingProductAndServiceCategory" class="nav-item nav-link navigator">Home</a>
                            <a href="#product" class="nav-item nav-link navigator active">Product</a>
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
                            <a class="nav-item nav-link search-open"><i class="fa-solid fa-magnifying-glass"></i></a>
                            <a href="MainController?action=MoveToCart" class="nav-item nav-link"><i class="fa-solid fa-cart-shopping"></i></a>
                        </div>
                    </div>
                </nav>
            </div>
            <!-- Navbar End -->

            <!-- Slider Start -->
            <div class="grid relative">
                <div class="col l-9 s-12 m-12 absolute abs-center left">
                    <h1 class="m-y-2">Service Category</h1>
                    <span class="txt-lg">We not only help you design exceptional services, but also make it easy for you
                        to share your designs with more like-minded people.</span>
                </div>
                <div style="background-color: var(--blue-bg);" class="row">
                    <img src="https://chisnghiax.com/ciseco/static/media/Moon.bf27dc577d1acccaba48430d353dbbe0.svg">
                </div>
            </div>
            <!-- Slider End -->

            <!-- Product List Start -->
            <div style="max-height: var(--list-h);" class="grid wide border-bot border-top">
                <div class="grid">
                    <div class="row m-y-2">
                        <form style="padding: 0;" class="col l-10 s-8" action="MainController?action=SearchServiceCategory" method="POST">

                            <div style="min-width: 100%;" class="flex-center sort-btn">
                                <a><i class="fa-solid fa-magnifying-glass"></i></a>
                                <input
                                    style="flex: 1; background-color: transparent;"
                                    type="text" placeholder="Type and press enter..." class="border-no m-x-1" name="searchServiceCategory">
                                <a class="opacity"><i class="fa-solid fa-xmark"></i></a>
                            </div>

                        </form>

                        <form style="padding: 0;" class="col l-2 s-4 flex-end" action="MainController" method="POST">
                            <div class="sort-btn">
                                <i class="fa-solid fa-sort"></i>
                                <select name="action" style="text-align: center;" class="border-no select" name="" id="" onChange="this.form.submit()">
                                    <option value="">Sort order</option>
                                    <option value="WordServiceCategoryUp">Name's increase</option>
                                    <option value="WordServiceCategoryDown">Name's decrease</option>
                                </select>
                            </div>
                        </form>
                    </div>

                    <div class="row m-y-2">
                        <!-- product item -->
                        <%
                            for (ServiceDTO service : productList) {
                        %>
                        <div class="col l-3 s-6 m-y-1">
                            <div class="block__item">
                                <div class="block__img flex-center relative">
                                    <img src="<%=service.getImage()%>"
                                         alt="">
                                    <a href="MainController?action=GoToServiceDetailByType&service_ID=<%=service.getService_ID()%>&category_ID=<%=service.getCategory_ID()%>" style="background-color: black; color: white;"
                                       class="txt-border link absolute card-extend bot quick-view">
                                        <i class="fa-solid fa-expand"></i>
                                        View Detail
                                    </a>
                                    <span class="block__title absolute flex-center">
                                        <%=service.getName()%>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <div class="row m-y-2">
                            <div class="row">
                                <div class="col l-6">
                                    <ul class="row pad-1">
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
            </div>

            <!-- Footer Start -->

            <div class="container-fluid bg-dark text-white-50 footer pt-5  wow fadeIn m-y-2" data-wow-delay="0.1s">
                <div class="container py-5">
                    <div class="row g-5">
                        <div class="col-lg-3 col-md-6">
                            <h5 class="text-white mb-4">Get In Touch</h5>
                            <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>E2a-7, D1 Street, Long Thanh
                                My, Thu Duc District, Ho Chi Minh City</p>
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