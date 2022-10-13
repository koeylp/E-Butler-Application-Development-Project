<%-- 
    Document   : customer_profilePage
    Created on : Oct 10, 2022, 9:04:35 AM
    Author     : Dang Viet
--%>

<%@page import="com.ebutler.swp.dto.UserDTO"%>
<%@page import="com.ebutler.swp.dto.CustomerDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="css/guestPage.css">
        <link rel="stylesheet" href="css/customer_profilePage.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>

    <body>
        <%
            CustomerDTO customer = (CustomerDTO) session.getAttribute("CURRENT_CUSTOMER");
            String emptyInfo = (String) request.getAttribute("EMPTY_INFO_ERROR");
            String emailWrongFormat = (String) request.getAttribute("EMAIL_WRONG_FORMAT");
            String updateSuccess = (String) request.getAttribute("UPDATE_SUCESSFULLY");
            String phoneWrongFormat = (String) request.getAttribute("PHONE_WRONG_LENGTH");
            String wrongDob = (String) request.getAttribute("WRONG_DOB");

            if (emptyInfo == null) {
                emptyInfo = "";
            }
            if (emailWrongFormat == null) {
                emailWrongFormat = "";
            }
            if (updateSuccess == null) {
                updateSuccess = "";
            }
            if (phoneWrongFormat == null) {
                phoneWrongFormat = "";
            }
            if (wrongDob == null) {
                wrongDob = "";
            }
            
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
                            <a href="#" class="nav-item nav-link navigator">Home</a>
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
                                <a class="nav-link active"><i class="fa-solid fa-user"></i></a>
                                <div class="dropdown-menu rounded-0 m-12">
                                    <a style="color: var(--primary-color); font-weight: bold;" href="MainController?action=GoToUserProfile" class="dropdown-item login--link"><%=login_user.getUsername()%></a>
                                    <a href="MainController?action=Logout" class="dropdown-item register--link">logout</a>
                                </div>
                            </div>
                            <a class="nav-item nav-link search-open"><i class="fa-solid fa-magnifying-glass"></i></a>
                            <a class="nav-item nav-link"><i class="fa-solid fa-cart-shopping"></i></a>
                        </div>
                    </div>
                </nav>
            </div>
            <!-- Navbar End -->

            <!-- Header Start -->
            <div class="grid">
                <div class="grid wide">
                    <div style="margin-top: 64px;" class="flex-horizon-center flex-col m-y-32">
                        <h1 class="txt-xl">Account</h1>
                        <div>
                            <span class="txt-lg bold"><%=customer.getName()%>, </span>
                            <span class="txt-lg"><%=customer.getEmail()%>, </span>
                            <span class="txt-lg"><%=customer.getPhone()%></span>
                        </div>
                    </div>
                    <div style="border-top: 2px solid #E2E8F0; border-bottom: 2px solid #E2E8F0"
                         class="flex-vertical-center m-y-32">
                        <a class="relative txt-lg pad-y-32 navi--link account">Account info</a>
                        <a class="relative txt-lg pad-y-32 navi--link order-his bold">My order</a>
                        <a class="relative txt-lg pad-y-32 navi--link address">My address</a>
                        <a class="relative txt-lg pad-y-32 navi--link password">Change password</a>
                    </div>
                </div>
            </div>
            <!-- Header End -->

            <!-- Account information start-->
            <div class="grid wide form account-form">
                <div class="flex-vertical-center m-y-32">
                    <h1 class="txt-xl">Account information</h1>
                </div>

                <div class="row m-y-32">
                    <div class="col l-3">
                        <form action="MainController">
                            <div class="image m-y-12">

                                <!--                        <div id="selectedBanner"></div>-->
                                <img id="output" src="<%= customer.getAvatar()%>"
                                     alt="">

                            </div>
                            <!--<input id="img" name="img" namstyle="width: 100%;" type="file">-->
                            <input name="avatar" value="<%= customer.getAvatar()%>" type="file" accept="image/*" onchange="document.getElementById('output').src = window.URL.createObjectURL(this.files[0])">

                            </div>

                            <div class="col l-9">

                                <!--<form action="MainController">-->
                                <div class="flex-horizon-center flex-col m-y-12">
                                    <%= updateSuccess%>
                                    <%=emptyInfo%>
                                    <span class="txt-lg bold m-y-12">Full name</span>
                                    <input name="name" value="<%= customer.getName()%>"style="border-bottom-left-radius: 1rem; border-top-left-radius: 1rem;"
                                           class="input txt-sm" type="text" placeholder="<%= customer.getName()%>">
                                </div>
                                <div class="flex-horizon-center flex-col relative m-y-12">
                                    <%= emailWrongFormat%>
                                    <span class="txt-lg bold m-y-12">Email</span>
                                    <div class="flex-horizon-center">
                                        <span class="txt-lg input-icon flex-center">
                                            <i class="fa-solid fa-envelope"></i>
                                        </span>
                                        <input class="input txt-sm" type="email" name="email" value="<%= customer.getEmail()%>"placeholder="<%= customer.getEmail()%>">
                                    </div>
                                </div>
                                <div class="flex-horizon-center flex-col relative m-y-12">

                                    <span class="txt-lg bold m-y-12">Date of birth</span>
                                    <%= wrongDob%>
                                    <div class="flex-horizon-center">

                                        <span class="txt-lg input-icon flex-center">
                                            <i class="fa-solid fa-calendar"></i>
                                        </span>

                                        <input class="input txt-sm" type="date" name="dob" value="<%= customer.getDob()%>">
                                    </div>
                                </div>
                                <div class="flex-horizon-center flex-col relative m-y-12">
                                    <span class="txt-lg bold m-y-12">Address</span>
                                    <div class="flex-horizon-center">
                                        <span class="txt-lg input-icon flex-center">
                                            <i class="fa-solid fa-location-dot"></i>
                                        </span>
                                        <input class="input txt-sm" type="text">
                                    </div>
                                </div>
                                <div class="flex-horizon-center flex-col relative m-y-12">
                                    <span class="txt-lg bold m-y-12">Gender</span>
                                    <div class="flex-vertical-center">
                                        <select style="border-bottom-left-radius: 1rem; border-top-left-radius: 1rem; flex: 0.5;"
                                                class="input txt-sm" name="gender" id="" value="<%= customer.getGender()%>">
                                            <option value="1" <%if (customer.getGender() == 1) {%>selected<%}%>>Male</option>
                                            <option value="2" <%if (customer.getGender() == 2) {%>selected<%}%>>Female</option>
                                            <option value="3" <%if (customer.getGender() == 3) {%>selected<%}%>>Other</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="flex-horizon-center flex-col relative m-y-12">
                                    <%= phoneWrongFormat%>
                                    <span class="txt-lg bold m-y-12">Phone number</span>
                                    <div class="flex-horizon-center">
                                        <span class="txt-lg input-icon flex-center">
                                            <i class="fa-solid fa-phone-volume"></i>
                                        </span>
                                        <input class="input txt-sm" name="phone" value="<%= customer.getPhone()%>"type="text" placeholder="<%= customer.getPhone()%>">
                                    </div>
                                </div>

                                <button name="action" value="UpdateCustomerInfo"class="btn-lg txt-lg bold m-y-32">Update Account</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Account information end -->

            <!-- Order history start -->
            <div class="grid hide form order-his-form">
                <div class="grid wide">
                    <div class="flex-vertical-center m-y-32">
                        <h1 class="txt-xl">Order History</h1>
                    </div>

                    <div class="row m-y-32">
                        <!-- Order item -->
                        <div class="block-border flex-col grid m-y-32">
                            <!-- Order head -->
                            <div style="background-color: #F9FAFB;" class="flex-between pad-2">
                                <div class="flex-col flex-horizon-center">
                                    <span class="txt-lg bold">#orderid</span>
                                    <div class="flex-center">
                                        <span class="txt-md">order-date</span>
                                        <span class="m-x-12">-</span>
                                        <span class="delivered">delivered</span>
                                    </div>
                                </div>
                            </div>
                            <!-- Order detail -->
                            <div class="pad-2">
                                <div class="order-card m-y-12">
                                    <div class="flex">
                                        <div class="flex-center order-img">
                                            <img src="https://chisnghiax.com/ciseco/static/media/17.7701cf9446a6b588de67.png"
                                                 alt="">
                                        </div>
                                        <div style="flex: 1; margin-left: 1rem;" class="flex-col">
                                            <div class="flex-between">
                                                <div class="flex-col flex-horizon-center">
                                                    <span class="txt-lg bold">Product name</span>
                                                    <div class="flex-horizon-center">
                                                        <span class="txt-md">Product</span>
                                                        <span class="m-x-12">|</span>
                                                        <span class="txt-md">Product Category</span>
                                                    </div>
                                                </div>
                                                <div class="order-price bold">
                                                    <span>
                                                        $369.000
                                                    </span>
                                                </div>
                                            </div>
                                            <div style="height: 50%;" class="flex-end flex-col">
                                                <span class="txt-md bold">Quantity: 1</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="order-card m-y-12">
                                    <div class="flex">
                                        <div class="flex-center order-img">
                                            <img src="https://chisnghiax.com/ciseco/static/media/17.7701cf9446a6b588de67.png"
                                                 alt="">
                                        </div>
                                        <div style="flex: 1; margin-left: 1rem;" class="flex-col">
                                            <div class="flex-between">
                                                <div class="flex-col flex-horizon-center">
                                                    <span class="txt-lg bold">Product name</span>
                                                    <div class="flex-horizon-center">
                                                        <span class="txt-md">Product</span>
                                                        <span class="m-x-12">|</span>
                                                        <span class="txt-md">Product Category</span>
                                                    </div>
                                                </div>
                                                <div class="order-price bold">
                                                    <span>
                                                        $369.000
                                                    </span>
                                                </div>
                                            </div>
                                            <div style="height: 50%;" class="flex-end flex-col">
                                                <span class="txt-md bold">Quantity: 1</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="block-border flex-col grid m-y-32">
                            <!-- Order head -->
                            <div style="background-color: #F9FAFB;" class="flex-between pad-2">
                                <div class="flex-col flex-horizon-center">
                                    <span class="txt-lg bold">#orderid</span>
                                    <div class="flex-center">
                                        <span class="txt-md">order-date</span>
                                        <span class="m-x-12">-</span>
                                        <span class="pending">pending</span>
                                    </div>
                                </div>
                            </div>
                            <!-- Order detail -->
                            <div class="pad-2">
                                <div class="order-card m-y-12">
                                    <div class="flex">
                                        <div class="flex-center order-img">
                                            <img src="https://chisnghiax.com/ciseco/static/media/17.7701cf9446a6b588de67.png"
                                                 alt="">
                                        </div>
                                        <div style="flex: 1; margin-left: 1rem;" class="flex-col">
                                            <div class="flex-between">
                                                <div class="flex-col flex-horizon-center">
                                                    <span class="txt-lg bold">Product name</span>
                                                    <div class="flex-horizon-center">
                                                        <span class="txt-md">Product</span>
                                                        <span class="m-x-12">|</span>
                                                        <span class="txt-md">Product Category</span>
                                                    </div>
                                                </div>
                                                <div class="order-price bold">
                                                    <span>
                                                        $369.000
                                                    </span>
                                                </div>
                                            </div>
                                            <div style="height: 50%;" class="flex-end flex-col">
                                                <span class="txt-md bold">Quantity: 1</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="order-card m-y-12">
                                    <div class="flex">
                                        <div class="flex-center order-img">
                                            <img src="https://chisnghiax.com/ciseco/static/media/17.7701cf9446a6b588de67.png"
                                                 alt="">
                                        </div>
                                        <div style="flex: 1; margin-left: 1rem;" class="flex-col">
                                            <div class="flex-between">
                                                <div class="flex-col flex-horizon-center">
                                                    <span class="txt-lg bold">Product name</span>
                                                    <div class="flex-horizon-center">
                                                        <span class="txt-md">Product</span>
                                                        <span class="m-x-12">|</span>
                                                        <span class="txt-md">Product Category</span>
                                                    </div>
                                                </div>
                                                <div class="order-price bold">
                                                    <span>
                                                        $369.000
                                                    </span>
                                                </div>
                                            </div>
                                            <div style="height: 50%;" class="flex-end flex-col">
                                                <span class="txt-md bold">Quantity: 1</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="order-card m-y-12">
                                    <div class="flex">
                                        <div class="flex-center order-img">
                                            <img src="https://chisnghiax.com/ciseco/static/media/17.7701cf9446a6b588de67.png"
                                                 alt="">
                                        </div>
                                        <div style="flex: 1; margin-left: 1rem;" class="flex-col">
                                            <div class="flex-between">
                                                <div class="flex-col flex-horizon-center">
                                                    <span class="txt-lg bold">Product name</span>
                                                    <div class="flex-horizon-center">
                                                        <span class="txt-md">Product</span>
                                                        <span class="m-x-12">|</span>
                                                        <span class="txt-md">Product Category</span>
                                                    </div>
                                                </div>
                                                <div class="order-price bold">
                                                    <span>
                                                        $369.000
                                                    </span>
                                                </div>
                                            </div>
                                            <div style="height: 50%;" class="flex-end flex-col">
                                                <span class="txt-md bold">Quantity: 1</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="order-card m-y-12">
                                    <div class="flex">
                                        <div class="flex-center order-img">
                                            <img src="https://chisnghiax.com/ciseco/static/media/17.7701cf9446a6b588de67.png"
                                                 alt="">
                                        </div>
                                        <div style="flex: 1; margin-left: 1rem;" class="flex-col">
                                            <div class="flex-between">
                                                <div class="flex-col flex-horizon-center">
                                                    <span class="txt-lg bold">Product name</span>
                                                    <div class="flex-horizon-center">
                                                        <span class="txt-md">Product</span>
                                                        <span class="m-x-12">|</span>
                                                        <span class="txt-md">Product Category</span>
                                                    </div>
                                                </div>
                                                <div class="order-price bold">
                                                    <span>
                                                        $369.000
                                                    </span>
                                                </div>
                                            </div>
                                            <div style="height: 50%;" class="flex-end flex-col">
                                                <span class="txt-md bold">Quantity: 1</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Order history end -->

            <!-- Change password start -->
            <div class="grid wide hide form password-form">
                <div class="flex-vertical-center m-y-32">
                    <h1 class="txt-xl">Update Your Password</h1>
                </div>
                <%
                    String duplicatePassword = (String) request.getAttribute("DUPLICATE_NEW_PASSWORD");
                    String confirmPasswordError = (String) request.getAttribute("CONFIRM_PASSWORD_WRONG");
                    String emptyField = (String) request.getAttribute("EMPTY");
                    if (duplicatePassword == null) {
                        duplicatePassword = "";
                    }
                    if (confirmPasswordError == null) {
                        confirmPasswordError = "";
                    }
                    if (emptyField == null) {
                        emptyField = "";
                    }
                %>
                <div class="row m-y-32">
                    <div style="padding: 0;" class="col l-6">

                        <form action="MainController" method="POST">
                            <div class="flex-horizon-center flex-col m-y-12">
                                <span class="txt-lg bold m-y-12"><%= emptyField%></span>
                                <span class="txt-lg bold m-y-12">Current password</span>
                                <input name="current-password" style="border-bottom-left-radius: 1rem; border-top-left-radius: 1rem;"
                                       class="input txt-sm" type="password">
                                <span class="txt-lg bold m-y-12"><%= duplicatePassword%></span>
                            </div>
                            <div class="flex-horizon-center flex-col m-y-12">
                                <span class="txt-lg bold m-y-12">New password</span>
                                <input name="new-password" style="border-bottom-left-radius: 1rem; border-top-left-radius: 1rem;"
                                       class="input txt-sm" type="password">
                            </div>
                            <div class="flex-horizon-center flex-col m-y-12">
                                <span class="txt-lg bold m-y-12">Confirm password</span>
                                <input name="confirm-new-password" style="border-bottom-left-radius: 1rem; border-top-left-radius: 1rem;"
                                       class="input txt-sm" type="password">
                                <span class="txt-lg bold m-y-12"><%= confirmPasswordError%></span>

                            </div>

                            <button name="action" value="ChangeCustomerPassword" class="btn-lg txt-lg bold m-y-32">Update Password</button>
                        </form>

                    </div>
                </div>
            </div>
            <!-- Change password end -->

            <!-- Update address start -->
            <div class="grid hide form address-form">
                <div class="grid wide">
                    <div class="flex-vertical-center m-y-32">
                        <h1 class="txt-xl">Update Your Address</h1>
                    </div>

                    <div class="row m-y-32">
                        <!-- Order item -->
                        <div class="block-border flex-col grid m-y-32">
                            <!-- Order head -->
                            <div style="background-color: #F9FAFB;" class="flex-between pad-2">
                                <div class="flex-col flex-horizon-center">
                                    <span class="txt-lg bold">#orderid</span>
                                    <div class="flex-center">
                                        <span class="txt-md">order-date</span>
                                        <span class="m-x-12">-</span>
                                        <span class="delivered">delivered</span>
                                    </div>
                                </div>
                            </div>
                            <!-- Order detail -->
                            <div class="pad-2">
                                <div class="order-card m-y-12">
                                    <div class="flex">
                                        <div class="flex-center order-img">
                                            <img src="https://chisnghiax.com/ciseco/static/media/17.7701cf9446a6b588de67.png"
                                                 alt="">
                                        </div>
                                        <div style="flex: 1; margin-left: 1rem;" class="flex-col">
                                            <div class="flex-between">
                                                <div class="flex-col flex-horizon-center">
                                                    <span class="txt-lg bold">Product name</span>
                                                    <div class="flex-horizon-center">
                                                        <span class="txt-md">Product</span>
                                                        <span class="m-x-12">|</span>
                                                        <span class="txt-md">Product Category</span>
                                                    </div>
                                                </div>
                                                <div class="order-price bold">
                                                    <span>
                                                        $369.000
                                                    </span>
                                                </div>
                                            </div>
                                            <div style="height: 50%;" class="flex-end flex-col">
                                                <span class="txt-md bold">Quantity: 1</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="order-card m-y-12">
                                    <div class="flex">
                                        <div class="flex-center order-img">
                                            <img src="https://chisnghiax.com/ciseco/static/media/17.7701cf9446a6b588de67.png"
                                                 alt="">
                                        </div>
                                        <div style="flex: 1; margin-left: 1rem;" class="flex-col">
                                            <div class="flex-between">
                                                <div class="flex-col flex-horizon-center">
                                                    <span class="txt-lg bold">Product name</span>
                                                    <div class="flex-horizon-center">
                                                        <span class="txt-md">Product</span>
                                                        <span class="m-x-12">|</span>
                                                        <span class="txt-md">Product Category</span>
                                                    </div>
                                                </div>
                                                <div class="order-price bold">
                                                    <span>
                                                        $369.000
                                                    </span>
                                                </div>
                                            </div>
                                            <div style="height: 50%;" class="flex-end flex-col">
                                                <span class="txt-md bold">Quantity: 1</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="block-border flex-col grid m-y-32">
                            <!-- Order head -->
                            <div style="background-color: #F9FAFB;" class="flex-between pad-2">
                                <div class="flex-col flex-horizon-center">
                                    <span class="txt-lg bold">#orderid</span>
                                    <div class="flex-center">
                                        <span class="txt-md">order-date</span>
                                        <span class="m-x-12">-</span>
                                        <span class="pending">pending</span>
                                    </div>
                                </div>
                            </div>
                            <!-- Order detail -->
                            <div class="pad-2">
                                <div class="order-card m-y-12">
                                    <div class="flex">
                                        <div class="flex-center order-img">
                                            <img src="https://chisnghiax.com/ciseco/static/media/17.7701cf9446a6b588de67.png"
                                                 alt="">
                                        </div>
                                        <div style="flex: 1; margin-left: 1rem;" class="flex-col">
                                            <div class="flex-between">
                                                <div class="flex-col flex-horizon-center">
                                                    <span class="txt-lg bold">Product name</span>
                                                    <div class="flex-horizon-center">
                                                        <span class="txt-md">Product</span>
                                                        <span class="m-x-12">|</span>
                                                        <span class="txt-md">Product Category</span>
                                                    </div>
                                                </div>
                                                <div class="order-price bold">
                                                    <span>
                                                        $369.000
                                                    </span>
                                                </div>
                                            </div>
                                            <div style="height: 50%;" class="flex-end flex-col">
                                                <span class="txt-md bold">Quantity: 1</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="order-card m-y-12">
                                    <div class="flex">
                                        <div class="flex-center order-img">
                                            <img src="https://chisnghiax.com/ciseco/static/media/17.7701cf9446a6b588de67.png"
                                                 alt="">
                                        </div>
                                        <div style="flex: 1; margin-left: 1rem;" class="flex-col">
                                            <div class="flex-between">
                                                <div class="flex-col flex-horizon-center">
                                                    <span class="txt-lg bold">Product name</span>
                                                    <div class="flex-horizon-center">
                                                        <span class="txt-md">Product</span>
                                                        <span class="m-x-12">|</span>
                                                        <span class="txt-md">Product Category</span>
                                                    </div>
                                                </div>
                                                <div class="order-price bold">
                                                    <span>
                                                        $369.000
                                                    </span>
                                                </div>
                                            </div>
                                            <div style="height: 50%;" class="flex-end flex-col">
                                                <span class="txt-md bold">Quantity: 1</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="order-card m-y-12">
                                    <div class="flex">
                                        <div class="flex-center order-img">
                                            <img src="https://chisnghiax.com/ciseco/static/media/17.7701cf9446a6b588de67.png"
                                                 alt="">
                                        </div>
                                        <div style="flex: 1; margin-left: 1rem;" class="flex-col">
                                            <div class="flex-between">
                                                <div class="flex-col flex-horizon-center">
                                                    <span class="txt-lg bold">Product name</span>
                                                    <div class="flex-horizon-center">
                                                        <span class="txt-md">Product</span>
                                                        <span class="m-x-12">|</span>
                                                        <span class="txt-md">Product Category</span>
                                                    </div>
                                                </div>
                                                <div class="order-price bold">
                                                    <span>
                                                        $369.000
                                                    </span>
                                                </div>
                                            </div>
                                            <div style="height: 50%;" class="flex-end flex-col">
                                                <span class="txt-md bold">Quantity: 1</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="order-card m-y-12">
                                    <div class="flex">
                                        <div class="flex-center order-img">
                                            <img src="https://chisnghiax.com/ciseco/static/media/17.7701cf9446a6b588de67.png"
                                                 alt="">
                                        </div>
                                        <div style="flex: 1; margin-left: 1rem;" class="flex-col">
                                            <div class="flex-between">
                                                <div class="flex-col flex-horizon-center">
                                                    <span class="txt-lg bold">Product name</span>
                                                    <div class="flex-horizon-center">
                                                        <span class="txt-md">Product</span>
                                                        <span class="m-x-12">|</span>
                                                        <span class="txt-md">Product Category</span>
                                                    </div>
                                                </div>
                                                <div class="order-price bold">
                                                    <span>
                                                        $369.000
                                                    </span>
                                                </div>
                                            </div>
                                            <div style="height: 50%;" class="flex-end flex-col">
                                                <span class="txt-md bold">Quantity: 1</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Update adddress end -->


            <!-- Footer Start -->
            <div class="container-fluid bg-dark text-white-50 footer pt-5  wow fadeIn" data-wow-delay="0.1s">
                <div class="container py-5">
                    <div class="row g-5">
                        <div class="col-lg-3 col-md-6">
                            <h5 class="text-white mb-4">Get In Touch</h5>
                            <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>Lô E2a-7, Đường D1, Đ. D1, Long Thạnh
                                Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh</p>
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
    <script src="js/customer_profilePage.js"></script>
    <script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"
    ></script>
    <script>
                                var selDiv = "";
                                var storedFiles = [];
                                $(document).ready(function () {
                                    $("#img").on("change", handleFileSelect);
                                    selDiv = $("#selectedBanner");
                                });

                                function handleFileSelect(e) {
                                    var files = e.target.files;
                                    var filesArr = Array.prototype.slice.call(files);
                                    filesArr.forEach(function (f) {
                                        if (!f.type.match("image.*")) {
                                            return;
                                        }
                                        storedFiles.push(f);

                                        var reader = new FileReader();
                                        reader.onload = function (e) {
                                            var html =
                                                    '<img src="' +
                                                    e.target.result +
                                                    "\" data-file='" +
                                                    f.name +
                                                    "alt='Category Image' height='200px' width='200px'>";
                                            selDiv.html(html);
                                        };
                                        reader.readAsDataURL(f);
                                    });
                                }
    </script>
</body>

</html>
