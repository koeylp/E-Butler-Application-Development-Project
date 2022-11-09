
<%@page import="com.ebutler.swp.dto.ShipperDTO"%>
<%@page import="com.ebutler.swp.dto.DeliveryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

        <link rel="stylesheet" href="./vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="./vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="./css/demo.css" />
        <link rel="icon" type="image/x-icon" href="./assets/img/favicon/favicon.ico" />
        <link rel="stylesheet" href="./vendor/fonts/boxicons.css" />
        
        <link rel="stylesheet" href="./css/delivery.css" />
        <link rel="stylesheet" href="./css/deliveryPage.css" />
        <link rel="stylesheet" href="./css/grid.css" />

    </head>
    <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.getRole_id() != 'SHIP'}">
        <c:redirect url="guest_loginPage.jsp"></c:redirect>
    </c:if>

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
        <%
            ShipperDTO shipper = (ShipperDTO) session.getAttribute("CURRENT_SHIPPER");

        %>
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
                                <a class="quick-view flex">
                                    <span><%= shipper.getWallet()%></span>
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
                                                    <a ><i class="icon-user"></i> <span><%= shipper.getName()%></span></a>
                                                </li>
                                                <li>
                                                    <a ><i class="icon-envelope-open"></i> <span>Inbox</span></a>
                                                </li>

                                                <hr class="my-2">
                                                <li>
                                                    <a href="page-lock.html"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                                </li>
                                               
                                                <li><a href="MainController?action=LogoutProvider"><i class="icon-key"></i> <span>Logout</span></a></li>
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
            <div id="wallet" class="overlay hide">
                <div class="popup">
                    <div class="popup-close">
                        <i class="fa-solid fa-xmark"></i>
                    </div>

                    <div class="row">
                        <div style="padding: 0 2px;" class="col l-3 payment-method-container">
                            <input value="Paypal" type="radio" name="payment-method" id="payment-method-1" checked />
                            <label for="payment-method-1" class="payment-method">
                                <img src="https://cdn.pixabay.com/photo/2015/05/26/09/37/paypal-784404__480.png" />
                            </label>
                        </div>

                        <div style="padding: 0 2px;" class="col l-3 payment-method-container">
                            <input value="Shopee Pay" type="radio" name="payment-method" id="payment-method-2" />
                            <label for="payment-method-2" class="payment-method">
                                <img src="https://seeklogo.com/images/S/shopee-pay-logo-2217CDC100-seeklogo.com.png" />
                            </label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="m-y-0">
                            <i class="fa-solid fa-wallet"></i>

                            <span class="payment-wallet">Paypal</span>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col l-4 m-y-1">
                            <div style="text-align: center;" class="full-w border-b txt-md">
                                <div class="bold">
                                    <span>Gi�</span>
                                </div>
                            </div>

                            <form id="payment-form" class="payment-table">
                                <input type="hidden" name="payment" value="PayPal" />
                                <input type="hidden" name="card" value="true" />
                                <input name="action" value="Checkout"/>
                                <div class="full-w payment-option border-b">
                                    <input type="radio" name="price" id="payment-price-1" value="10" checked />
                                    <label class="payment-item" for="payment-price-1">
                                        <div class="payment-item-option">
                                            <span class="bold">Wallet: </span>
                                            <span>10$</span>
                                        </div>
                                    </label>
                                </div>

                                <div class="full-w payment-option border-b">
                                    <input type="radio" name="price" id="payment-price-3" value="50" />
                                    <label class="payment-item" for="payment-price-3">
                                        <div style="padding: -.25rem;" class="payment-item-option">
                                            <span class="bold">Wallet: </span>
                                            <span>50$</span>
                                        </div>
                                    </label>
                                </div>

                                <div class="full-w payment-option border-b">
                                    <input type="radio" name="price" id="payment-price-4" value="100" />
                                    <label class="payment-item" for="payment-price-4">
                                        <div style="padding: -.25rem;" class="payment-item-option">
                                            <span class="bold">Wallet: </span>
                                            <span>100$</span>
                                        </div>
                                    </label>
                                </div>

                                <div class="full-w payment-option border-b">
                                    <input type="radio" name="price" id="payment-price-6" value="500" />
                                    <label class="payment-item" for="payment-price-6">
                                        <div style="padding: -.25rem;" class="payment-item-option">
                                            <span class="bold">Wallet: </span>
                                            <span>500$</span>
                                        </div>
                                    </label>
                                </div>

                                <div class="full-w payment-option border-b">
                                    <input type="radio" name="price" id="payment-price-7" value="1000" />
                                    <label class="payment-item" for="payment-price-7">
                                        <div style="padding: -.25rem;" class="payment-item-option">
                                            <span class="bold">Wallet: </span>
                                            <span>1000$</span>
                                        </div>
                                    </label>
                                </div>

                                <div class="full-w payment-option border-b">
                                    <input type="radio" name="price" id="payment-price-8" value="2000" />
                                    <label class="payment-item" for="payment-price-8">
                                        <div style="padding: -.25rem;" class="payment-item-option">
                                            <span class="bold">Wallet: </span>
                                            <span>2000$</span>
                                        </div>
                                    </label>
                                </div>
                            </form>
                        </div>

                        <div style="display: flex; justify-content: center; align-items: center;" class="col l-1">
                            <div class="separate">
                            </div>
                        </div>

                        <div class="col l-7 m-y-1 payment-detail-container">
                            <div class="full-w border-b txt-md">
                                <div class="bold">
                                    <span>Transaction detail</span>
                                </div>
                            </div>

                            <div class="payment-table">
                                <div class="full-w payment-detail border-b">
                                    <div class="payment-item-detail">
                                        <span>Price: </span>
                                        <span>
                                            <span class="payment-item-detail-price">10</span><span>$</span>
                                        </span>
                                    </div>
                                </div>
                                <div class="full-w payment-detail border-b">
                                    <div class="payment-item-detail">
                                        <span>Payment method: </span>
                                        <span class="payment-item-method">Paypal</span>
                                    </div>
                                </div>
                                <div class="full-w payment-detail border-b">
                                    <div class="payment-item-detail">
                                        <span>Username: </span>
                                        <span>shopee1</span>
                                    </div>
                                </div>
                            </div>

                            <div class="m-y-1">
                                <button onClick="document.querySelector('#payment-form').submit();" class="payment-btn">Process payment</button>
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

        <script src="./plugins/tables/js/jquery.dataTables.min.js"></script>
        <script src="./plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
        <script src="./plugins/tables/js/datatable-init/datatable-basic.min.js"></script>

        </<script src="./js/delivery.js"></script>

    </body>

</html>