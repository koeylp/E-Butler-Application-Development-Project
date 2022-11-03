
<%@page import="com.ebutler.swp.dto.DeliveryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>E-butler</title>

        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
        <!-- Custom Stylesheet -->
        <link href="./plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="css/deliveryPage.css" rel="stylesheet"> 
        <link href="css/delivery.css" rel="stylesheet"> 

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />




        <link rel="stylesheet" href="./vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="./vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="./css/demo.css" />
        <link rel="icon" type="image/x-icon" href="./assets/img/favicon/favicon.ico" />
        <link rel="stylesheet" href="./vendor/fonts/boxicons.css" />


        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/base.css">


        <link rel="stylesheet" href="css/guestPage.css">
        <link rel="stylesheet" href="css/customerPage.css">
        <link rel="stylesheet" href="css/delivery.css">

        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            th {
                text-align: center;
            }

            td{
                border-top: 1px solid #dddddd;
                border-bottom: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            td label:hover {
                cursor: pointer;
            }
        </style>
    </head>

    <body>

        <!--*******************
            Preloader start
        ********************-->
        <div id="preloader">
            <div class="loader">
                <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
                </svg>
            </div>
        </div>
        <!--*******************
            Preloader end
        ********************-->


        <!--**********************************
            Main wrapper start
        ***********************************-->
        <div id="main-wrapper">
            <!--**********************************
                Header start
            ***********************************-->
            <div style="margin: 0; width: 100vw;" class="header">    
                <div class="header-content clearfix">

                    <div class="nav-control">
                        <div class="hamburger">
                            <span class="toggle-icon"><i class="icon-menu"></i></span>
                        </div>
                    </div>
                    <div class="header-left">
                        <div class="input-group icons">
                            <div class="input-group-prepend">
                                <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
                            </div>
                            <input type="search" class="form-control" placeholder="Search Dashboard" aria-label="Search Dashboard">
                            <div class="drop-down   d-md-none">
                                <form action="#">
                                    <input type="text" class="form-control" placeholder="Search">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="header-right">
                        <ul class="clearfix">
                            <li class="icons dropdown">
                                <a class="quick-view">
                                    <span>$120.000</span>
                                    <i class="fa-solid fa-wallet"></i>
                                </a>
                            </li>
                            <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                    <i class="mdi mdi-bell-outline"></i>
                                    <span class="badge badge-pill gradient-2 badge-primary">3</span>
                                </a>
                                <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                                    <div class="dropdown-content-heading d-flex justify-content-between">
                                        <span class="">2 New Notifications</span>  

                                    </div>
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Events near you</h6>
                                                        <span class="notification-text">Within next 5 days</span> 
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Event Started</h6>
                                                        <span class="notification-text">One hour ago</span> 
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Event Ended Successfully</h6>
                                                        <span class="notification-text">One hour ago</span>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Events to Join</h6>
                                                        <span class="notification-text">After two days</span> 
                                                    </div>
                                                </a>
                                            </li>
                                        </ul>

                                    </div>
                                </div>
                            </li>
                            <li class="icons dropdown d-none d-md-flex">
                                <a href="javascript:void(0)" class="log-user"  data-toggle="dropdown">
                                    <span>English</span>  <i class="fa fa-angle-down f-s-14" aria-hidden="true"></i>
                                </a>
                                <div class="drop-down dropdown-language animated fadeIn  dropdown-menu">
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li><a href="javascript:void()">English</a></li>
                                            <li><a href="javascript:void()">Dutch</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="icons dropdown">
                                <div class="user-img c-pointer position-relative" data-toggle="dropdown">
                                    <span class="activity active"></span>
                                    <img src="images/user/1.png" height="40" width="40" alt="">
                                </div>
                                <form action="MainController" method="Post">
                                    <div class="drop-down dropdown-profile   dropdown-menu">
                                        <div class="dropdown-content-body">
                                            <ul>
                                                <li>
                                                    <a href="app-profile.html"><i class="icon-user"></i> <span>Profile</span></a>
                                                </li>
                                                <li>
                                                    <a href="email-inbox.html"><i class="icon-envelope-open"></i> <span>Inbox</span> <div class="badge gradient-3 badge-pill badge-primary">3</div></a>
                                                </li>

                                                <hr class="my-2">
                                                <li>
                                                    <a href="page-lock.html"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                                </li>
                                                <li> <button class="dropdown-item"  name="action" value="LogoutProvider" ><i class="bx bx-log-out m-2"></i>Logout</button></li>
                                            </ul>
                                        </div>
                                    </div>
                                </form>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--**********************************
                Header end ti-comment-alt
            ***********************************-->



            <!--**********************************
                Content body start
            ***********************************-->
            <%
                List<DeliveryDTO> listDelivery = new ArrayList();
                listDelivery = (List<DeliveryDTO>) session.getAttribute("Delivery_List");
                if (listDelivery != null) {

            %>
            <div style="margin: 0; width: 100vw;" class="content-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Shipping Order</h4>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered zero-configuration">
                                            <thead>
                                                <tr>
                                                    <th class="txt-md bold">OrderID</th>
                                                    <th class="txt-md bold">Address</th>
                                                    <th class="txt-md bold">Date</th>
                                                    <th class="txt-md bold">Customer Name</th>
                                                    <th class="txt-md bold">Price</th>
                                                    <th class="txt-md bold">Shipper</th>
                                                    <th class="txt-md bold">Status</th>
                                                    <th class="txt-md bold">Action</th>
                                                </tr>
                                            </thead>
                                            <h4 style="color: red" >${sessionScope.ERROR_ASSIGN}</h4>
                                            <tbody>
                                                <%                                                    int count = 1;
                                                    for (DeliveryDTO delivery : listDelivery) {
                                                        count++;

                                                %>
                                            <form action="MainController" method="Get">
                                                <tr>

                                                    <td class="txt-sm"><%= delivery.getOrderID()%></td>
                                                    <td class="txt-sm"><%= delivery.getAddress()%></td>
                                                    <td class="txt-sm"><%= delivery.getOrder_Date()%></td>
                                                    <td class="txt-sm"><%= delivery.getName()%></td>
                                                    <td class="txt-sm"><%= delivery.getTotal()%></td>
                                                    <%
                                                        String usernameShipper = delivery.getUsername_Shipper();
                                                        if (usernameShipper == null) {
                                                            usernameShipper = "Assign Now";
                                                        }
                                                    %>
                                                    <td class="txt-sm">
                                                        <a href="MainController?action=AssignDelivery&orderID=<%=delivery.getOrderID()%>" ><%= usernameShipper%></a>
                                                    </td>
                                                    <td class="txt-sm bold">
                                                        <div>
                                                            <%
                                                                int status = delivery.getStatus();
                                                                if (status == 1) {
                                                            %>
                                                            <span class="badge bg-label-info me-1 changeStatus">Goods Taken</span>
                                                            <%
                                                            } else if (status == 2) {

                                                            %>
                                                            <span class="badge bg-label-info me-1 changeStatus">Shipping</span>
                                                            <%                                                            } else if (status == 0) {
                                                            %>
                                                            <span class="badge bg-label-warning me-1 changeStatus">Pending</span>
                                                            <%
                                                            } else if (status == 3) {
                                                            %>
                                                            <span class="badge bg-label-success me-1 changeStatus">Done</span> 
                                                            <%
                                                            } else if (status == 4) {
                                                            %>

                                                            <span class="badge bg-label-danger me-1 changeStatus">Cancel Order</span> 
                                                            <%
                                                                }
                                                            %>
                                                        </div>
                                                    </td>
                                                    <td class="txt-sm bold">
                                                        <div>
                                                            <input type="hidden" name="orderID" value="<%= delivery.getOrderID()%>" />
                                                            <input type="hidden" name="customerID" value="<%= delivery.getCustomer_ID()%>" /> 

                                                            <a href="MainController?action=DeliveryOrderDetail&orderID=<%=delivery.getOrderID()%>&customerID=<%=delivery.getCustomer_ID()%>" >View Detail</a>
                                                        </div>
                                                    </td>
                                                </tr>

                                            </form>
                                            <%
                                                }
                                            %>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #/ container -->
            </div>
            <%
                }
            %>
            <!--**********************************
                Content body end
            ***********************************-->


            <!--**********************************
                           Wallet start
            ***********************************-->
            <div class="overlay fixed top bot left right flex-center hide">
                <div class="popup relative pad-2 grid">
                    <div style="margin: -1.5rem 1rem; width: fit-content;"
                         class="absolute p-0 right text-md opacity popup-close">
                        <i class="fa-solid fa-xmark"></i>
                    </div>

                    <div style="margin: 0 -4px;" class="row">
                        <div style="max-height: 7rem; padding: 0 4px;" class="col l-2 payment-container">
                            <div style="background-color: #F8F8F8;" class="full-w full-h flex-center pad-0 payment-method">
                                <input type="radio" id="payment-1" name="payment" class="payment-input">
                                <label for="payment-1">
                                    <div class="img">
                                        <img style="object-fit: contain;"
                                             src="https://cdn.pixabay.com/photo/2015/05/26/09/37/paypal-784404__480.png"
                                             alt="" />
                                    </div>
                                </label>
                            </div>
                        </div>
                        <div style="max-height: 7rem; padding: 0 4px;" class="col l-2 payment-container">
                            <div style="background-color: #F8F8F8;" class="full-w full-h flex-center pad-0 payment-method">
                                <input type="radio" id="payment-2" name="payment" class="payment-input">
                                <label for="payment-2">
                                    <div class="img">
                                        <img style="object-fit: contain;"
                                             src="https://cdn.pixabay.com/photo/2015/05/26/09/37/paypal-784404__480.png"
                                             alt="" />
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="m-y-1"> 
                        <i class="fa-solid fa-wallet"></i>
                        <span>Ví PayPal</span>
                    </div>

                    <div class="row">
                        <div class="col l-4">
                            <table>
                                <tr>
                                    <th>Giá</th>
                                </tr>
                                <tr>
                                    <td for="price-1" class="pad-0 flex"><input type="radio" name="price" id="price-1"><label
                                            for="price-1" class="m-x-0" style="flex: 1">10 $</label></td>
                                </tr>
                                <tr>
                                    <td for="price-2" class="pad-0 flex"><input type="radio" name="price" id="price-2"><label
                                            for="price-2" class="m-x-0" style="flex: 1">10</label></td>
                                </tr>

                            </table>
                        </div>

                        <div class="col l-8">
                            <div class="flex-center">
                                <button>Process to payment</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--**********************************
                           Wallet end
            ***********************************-->

            <!--**********************************
                Footer start
            ***********************************-->
            <div class="footer">
                <div class="copyright">
                    <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
                </div>
            </div>
            <!--**********************************
                Footer end
            ***********************************-->
        </div>
        <!--**********************************
            Main wrapper end
        ***********************************-->

        <!--**********************************
            Scripts
        ***********************************-->
        <script src="./plugins/common/common.min.js"></script>
        <script src="./js/custom.min.js"></script>
        <script src="./js/settings.js"></script>
        <script src="./js/gleek.js"></script>
        <script src="./js/styleSwitcher.js"></script>
        <script src="./js/customer_productPage.js"></script>

        <script src="./plugins/tables/js/jquery.dataTables.min.js"></script>
        <script src="./plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
        <script src="./plugins/tables/js/datatable-init/datatable-basic.min.js"></script>

    </body>

</html>