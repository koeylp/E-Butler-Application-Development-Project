<%@page import="com.ebutler.swp.dto.OrderDetailInfoDTO"%>
<%@page import="com.ebutler.swp.dto.OrderDetailDTO"%>
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
        <link href="css/deliveryPage.css" rel="stylesheet"> 
        <link href="css/delivery.css" rel="stylesheet"> 




        <link rel="stylesheet" href="./vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="./vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="./css/demo.css" />
        <link rel="icon" type="image/x-icon" href="./assets/img/favicon/favicon.ico" />
        <link rel="stylesheet" href="./vendor/fonts/boxicons.css" />
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
                            <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                    <i class="mdi mdi-email-outline"></i>
                                    <span class="badge gradient-1 badge-pill badge-primary">3</span>
                                </a>
                                <div class="drop-down animated fadeIn dropdown-menu">
                                    <div class="dropdown-content-heading d-flex justify-content-between">
                                        <span class="">3 New Messages</span>  

                                    </div>
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li class="notification-unread">
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="images/avatar/1.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Saiful Islam</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="notification-unread">
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="images/avatar/2.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Adam Smith</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Can you do me a favour?</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="images/avatar/3.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Barak Obama</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="images/avatar/4.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Hilari Clinton</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Hello</div>
                                                    </div>
                                                </a>
                                            </li>
                                        </ul>

                                    </div>
                                </div>
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
                                <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                    <span class="activity active"></span>
                                    <img src="images/user/1.png" height="40" width="40" alt="">
                                </div>
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
                                            <li><a href="page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
                                        </ul>
                                    </div>
                                </div>
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
            <div class="container-xxl">
                <div class="container-fluid nav-bar bg-white px-0">
                    <!-- Breadcrumb -->
                    <div class="mx-5 mt-3">
                        <nav aria-label="breadcrumb m-5">
                            <ol class="breadcrumb breadcrumb-style1">
                                <li class="breadcrumb-item">
                                    <a href="DeliveryHomeController">Home</a>
                                </li>
                                <li class="breadcrumb-item">
                                    <a href="DeliveryHomeController">Delivery Home</a>
                                </li>
                                <li class="breadcrumb-item active">Delivery Details</li>
                            </ol>
                        </nav>
                    </div>
                    <!-- End Breadcrumb -->
                    <div class="mt-3 ms-5 d-flex justify-content-start ">
                        <div>
                            <h2 style="font-weight:600 ;" class="">Delivery Details</h2>
                            <h6 style="color: red">${requestScope.ErrorUpdateStatus}</h6> 
                        </div>
                    </div>
                    <!-- End Modal Edit -->


                    <div class="container-fluid d-flex flex-column pb-5">

                        <%
                            List<OrderDetailDTO> listDetail = new ArrayList();
                            listDetail = (List<OrderDetailDTO>) session.getAttribute("Delivery_Detail");
                            List<OrderDetailInfoDTO> listDetailInfo = new ArrayList();
                            listDetailInfo = (List<OrderDetailInfoDTO>) session.getAttribute("Info_Detail_Delivery");

                        %>
                        <div class="layout-container-fluid   " style="border-radius:5px ;">
                            <div class="d-flex justify-content-around mb-3">
                                <div class="card my-3" style="width:300px ; height: 194px;">
                                    
                                    <div class="card-body">
                                        <div class="border-bottom">
                                            <h6>Order Number<span
                                                    class="badge bg-label-info mx-2 pb-1"><%= listDetailInfo.get(0).getOrderID()%></span> </h6>
                                        </div>

                                        <div class="pt-3">


                                            <li style="list-style:none ; "><i class="bx bx-calendar-event mx-2"></i>Date: <%= listDetailInfo.get(0).getOrder_date()%></li>

                                            <div class="flexStatus">
                                                <li style="list-style:none ; padding-top: 6px ; padding-right: 8px "><i class="bx bx-calendar-event mx-2"></i>Status: </li>
                                                    <%
                                                    int status = listDetailInfo.get(0).getStatus(); 
                                                    if (status == 0) {
                                                %>
                                            <span class="badge bg-label-warning me-1 changeStatus">Pending</span>
                                            <%
                                            } else if (status == 1) {

                                            %>
                                            <span class="badge bg-label-info me-1 changeStatus">InProgress</span>
                                            <%                                                        
                                                } else if (status == 2) {
                                            %>
                                            <span class="badge bg-label-success me-1 changeStatus">Done</span>
                                            <%
                                            } else if (status == 3) {
                                            %>
                                            <span class="badge bg-label-danger me-1 changeStatus">Cancel</span> 
                                            <%
                                                }
                                            %>


                                            </div>


                                        </div>

                                    </div>

                                </div>
                                <div class="card my-3" style="width:300px ;height: fit-content;">
                                    <div class="card-body">
                                        <div class="border-bottom">
                                            <h5>Customer</h5>
                                        </div>
                                        <div class="py-2">
                                            <li style="list-style:none ;"><i class="bx bx-user mx-2"></i><%= listDetailInfo.get(0).getName()%></li>
                                            <li style="list-style:none ;"><i class="bx bx-phone mx-2"></i><%= listDetailInfo.get(0).getPhone()%></li>
                                            <li style="list-style:none ;"> <i class="bx bx-envelope mx-2"></i><%= listDetailInfo.get(0).getEmail()%></li> 
                                            <li style="list-style:none ;"><i class="bx bx-map-pin mx-2"></i>Khu Cong Nghe Cao</li>
                                        </div>


                                    </div>

                                </div>
                            </div>



                            <div class="border-bottom">
                                <h6 class="mx-2">Items</h6>
                            </div>
                            <div class="layout-container-fluid">
                                <div class=" table-responsive">
                                    <table class="table " style="table-layout: fixed">
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Total</th>
                                        <th>Status</th>
                                        <th></th>
                                        <tbody>

                                            <%
                                                Double total = 0.0;
                                                for (OrderDetailDTO orderDetail : listDetail) {
                                                    total += orderDetail.getPrice() * orderDetail.getQuantity();
                                            %>
                                        <form action="MainController" >
                                            <tr>
                                                <td class="txt-sm"><%= orderDetail.getId()%></td>
                                                <td class="txt-sm"><%= orderDetail.getName()%></td>
                                                <td class="txt-sm"><%= orderDetail.getQuantity()%></td>
                                                <td class="txt-sm"><%= orderDetail.getPrice()%></td>
                                                <td class="txt-sm"><%= orderDetail.getPrice() * orderDetail.getQuantity()%></td> 
                                                <td class="txt-md ">
                                                    <div class="flexStatus">
                                                        <div>
                                                            <%
                                                                int statusBelow = orderDetail.getStatus();
                                                                if (statusBelow == 1) {
                                                            %>
                                                            <span class="badge bg-label-info me-1 changeStatus">Goods Taken</span>
                                                            <%
                                                            } else if (statusBelow == 2) {

                                                            %>
                                                            <span class="badge bg-label-info me-1 changeStatus">Shipping</span>
                                                            <%                                                                
                                                                } else if (statusBelow == 0) { 
                                                            %>
                                                            <span class="badge bg-label-warning me-1 changeStatus">Pending</span>
                                                            <%
                                                            } else if (statusBelow == 3) {
                                                            %>
                                                            <span class="badge bg-label-success me-1 changeStatus">Done</span> 
                                                            <%
                                                            } else if (statusBelow == 4) {
                                                            %>

                                                            <span class="badge bg-label-danger me-1 changeStatus">Cancel Order</span> 
                                                            <%
                                                                }
                                                            %>
                                                        </div>
                                                        <div>
                                                            <select onchange="this.form.submit()" class="form-select " name="DeliveryStatus" aria-label="Default select example">
                                                                <option selected value="0" >Change status</option>
                                                                <option value="0">Pending</option>
                                                                <option value="1">Goods Taken</option>
                                                                <option value="2">Shipping</option>              
                                                                <option value="3">Done</option>              
                                                                <option value="4">Cancel Order</option>              
                                                            </select>
                                                            <input type="hidden" name="oldStatus" value="<%= orderDetail.getStatus()%>" /> 
                                                        </div>  
                                                    </div>
                                                </td>
                                                <td class="txt-md ">
                                                    <!--<button type="submit" name="action" value="Update_Delivery">Update Status</button>-->
                                                    <input type="hidden" name="action" value="Update_Delivery" /> 
                                                    <input type="hidden" name="Product_id" value="<%= orderDetail.getId()%>" /> 
                                                    <input type="hidden" name="orderID" value="<%= orderDetail.getOrder_ID()%>" /> 
                                                    <input type="hidden" name="Product_Order_ID" value="<%= orderDetail.getProduct_detail_ID() %>" /> 
                                                </td>
                                        </form>
                                        </tr>
                                        <%
                                            }
                                        %>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td class="txt-sm" style="font-weight: bold;">Total</td>
                                            <td class="txt-sm" style="font-weight: bold;"><%= total%></td>
                                        </tr>        



                                        </tbody>
                                    </table>
                                </div>

                            </div>

                        </div>
                        <%

                        %>
                    </div>
                </div>
                <!--**********************************
                    Content body end
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

    </body>

</html>
