<%-- 
    Document   : customer_confirmation.jsp
    Created on : Oct 6, 2022, 10:28:49 PM
    Author     : thekh
--%>

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

        <title>E-Butler</title>
    </head>

    <body>
        <%--
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || "AD".equals((loginUser.getRoleID()))) {
                response.sendRedirect("login.jsp");
                return;
            }
        --%>
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
                        <img class="img-fluid" src="img/logo.png" alt="Icon" style="width: 100px; height: auto;">
                    </div>
                    <h1 class="text-primary">E-Butler</h1>
                </a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto">
                        <a href="#" class="nav-item nav-link active navigator">Home</a>
                        <a href="#" class="nav-item nav-link navigator">Product</a>
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
                        <a href="MainController?action=MoveToCart" class="nav-item nav-link"><i class="fa-solid fa-cart-shopping"></i></a>
                    </div>
                </div>
            </nav>
        </div>
        <!-- Navbar End -->
        <%
            String statement = (String) session.getAttribute("STATEMENT");
        %>
        <!-- Shop Cart Section Begin -->
        <div style="width:92%; margin-left: 48px; padding: 50px" class="rounded mt-5 bg-white ">
            <div style="text-align: center;">
                <h1><%= statement %></h1>
            </div>      
        </div>


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
        <script src="js/access.js"></script>
        <script src="js/customer_productPage.js"></script>


    </body>

</html>