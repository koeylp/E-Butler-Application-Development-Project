<%-- 
    Document   : OrderDetailProvider.jsp
    Created on : Oct 20, 2022, 9:31:05 PM
    Author     : DELL
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.ebutler.swp.dto.OrderDetailInfoDTO"%>
<%@page import="com.ebutler.swp.dto.OrderDetailDTO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>E-Butler | Orders Details</title>
        <link rel="icon" type="image/x-icon"
              href="https://scontent.fsgn2-4.fna.fbcdn.net/v/t1.15752-9/307058616_802160467603859_5558839303148788245_n.png?stp=dst-png_p1080x2048&_nc_cat=109&ccb=1-7&_nc_sid=ae9488&_nc_ohc=vGhbAQumiiwAX8TbYC2&tn=nHI45FEgylR7fWDG&_nc_ht=scontent.fsgn2-4.fna&oh=03_AVJuwn5Dqs20uZj9NKDP_eqwggpHhYGN5cC90Kw1btakKQ&oe=6363B3B1">
        <!-- <link href="../css/provider.css" rel="stylesheet"> -->
        <link href="./css/bootstrap1.min.css" rel="stylesheet">
        <link href="./css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Core CSS -->
        <link rel="stylesheet" href="./vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="./vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="./css/demo.css" />
        <link rel="icon" type="image/x-icon" href="./assets/img/favicon/favicon.ico" />
        <link rel="stylesheet" href="./vendor/fonts/boxicons.css" />
        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet" />
    </head>

    <body>
        <div class="container-xxl">
            <div class="container-fluid nav-bar bg-white px-0">

                <nav class="navbar navbar-expand-lg  navbar-light py-0 px-5">
                    <a class="navbar-brand d-flex align-items-center text-center">
                        <div class="icon p-2 me-2">
                            <img class="img-fluid"
                                 src="https://scontent.fsgn2-4.fna.fbcdn.net/v/t1.15752-9/307058616_802160467603859_5558839303148788245_n.png?stp=dst-png_p1080x2048&_nc_cat=109&ccb=1-7&_nc_sid=ae9488&_nc_ohc=vGhbAQumiiwAX8TbYC2&tn=nHI45FEgylR7fWDG&_nc_ht=scontent.fsgn2-4.fna&oh=03_AVJuwn5Dqs20uZj9NKDP_eqwggpHhYGN5cC90Kw1btakKQ&oe=6363B3B1"
                                 alt="Icon" style="width: 30px; height: 30px;">
                        </div>
                        <h1 class="m-0 " style="color:#273A89 ;">E-Butler</h1>
                    </a>
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <div class="navbar-nav ms-auto">

                            <a style="font-weight: bold;" href="product.html" class="nav-item nav-link ">Product</a>
                            <a style="font-weight: bold;" href="service.html" class="nav-item nav-link">Service</a>
                            <a style="font-weight: bold;" href="orders.html" class="nav-item nav-link active">Orders</a>
                            <a style="font-weight: bold;" href="staff.html" class="nav-item nav-link">Staff</a>



                        </div>

                        <!-- On hover dropdown button -->

                        <!-- <a href="" class="btn btn-primary px-3 d-none d-lg-flex">Add Property</a> -->
                    </div>
                    <div class="btn-group me-3">

                        <img class="avatar avatar-md rounded-circle "
                             src="https://i.bloganchoi.com/bloganchoi.com/wp-content/uploads/2021/07/avatar-doi-ban-than-2021-21-696x696.jpeg?fit=700%2C20000&quality=95&ssl=1"
                             id="dropdownMenuButton" data-bs-toggle="dropdown" data-bs-display="static">

                        </img>
                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-start">
                            <li><a data-bs-target="#basicModal1" data-bs-toggle="modal" class="dropdown-item"
                                   href="javascript:void(0);"><i class="bx bx-user m-2"></i>My Profile</a></li>
                            <li><a class="dropdown-item" href="changepassword.html"><i class="bx bx-lock m-2"></i>Change Password</a>
                            </li>
                            <!-- <li><a class="dropdown-item" href="javascript:void(0);">Something else here</a></li> -->
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-log-out m-2"></i>Logout</a></li>
                        </ul>
                    </div>
                </nav>
                <!-- Breadcrumb -->
                <div class="mx-5 mt-3">
                    <nav aria-label="breadcrumb m-5">
                        <ol class="breadcrumb breadcrumb-style1">
                            <li class="breadcrumb-item">
                                <a href="#">Home</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="#">Orders</a>
                            </li>
                            <li class="breadcrumb-item active">Orders Details</li>
                        </ol>
                    </nav>
                </div>
                <!-- End Breadcrumb -->
                <div class="mt-3 ms-5 d-flex justify-content-start ">
                    <div>
                        <h2 style="font-weight:600 ;" class="">Orders Details</h2>
                    </div>
                </div>
                <!-- End Modal Edit -->
                

                <div class="container-fluid d-flex flex-column pb-5">
                    
                    <%
                        List<OrderDetailDTO> listDetail = new ArrayList();
                        listDetail = (List<OrderDetailDTO>) session.getAttribute("Order_Detail");
                        List<OrderDetailInfoDTO> listDetailInfo = new ArrayList();
                        listDetailInfo = (List<OrderDetailInfoDTO>) session.getAttribute("Info_Detail"); 

                    %>
                    <div class="layout-container-fluid   " style="border-radius:5px ;">
                        <div class="d-flex justify-content-around mb-3">
                            <div class="card my-3" style="width:300px ; height: 194px;">
                                <div class="card-body">
                                    <div class="border-bottom">
                                        <h6>Order Number<span
                                                class="badge bg-label-info mx-2 pb-1"><%= listDetailInfo.get(0).getOrderID() %></span> </h6>
                                    </div>
                                    
                                    <div class="pt-3">


                                        <li style="list-style:none ; "><i class="bx bx-calendar-event mx-2"></i>Date: <%= listDetailInfo.get(0).getOrder_date()%></li>

                                        <div class="flexStatus">
                                            <li style="list-style:none ; padding-top: 6px ; padding-right: 8px "><i class="bx bx-calendar-event mx-2"></i>Status: </li>
                                            <%
                                                            int status = listDetailInfo.get(0).getStatus();
                                                            if (status == 1) {
                                                        %>
                                                        <span class="badge bg-label-info me-1 changeStatus">InProgress</span>
                                                        <%
                                                        } else if (status == 2) {

                                                        %>
                                                        <span class="badge bg-label-success me-1 changeStatus">Done</span>
                                                        <% 
                                                            } else if (status == 0) {
                                                        %>
                                                        <span class="badge bg-label-warning me-1 changeStatus">Pending</span>
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
                                        <li style="list-style:none ;"><i class="bx bx-user mx-2"></i><%= listDetailInfo.get(0).getName() %></li>
                                        <li style="list-style:none ;"><i class="bx bx-phone mx-2"></i><%= listDetailInfo.get(0).getPhone() %></li>
                                        <li style="list-style:none ;"> <i class="bx bx-envelope mx-2"></i><%= listDetailInfo.get(0).getEmail() %></li> 
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
                                    <tbody>
                                    <form action="MainController" method="Post">
                                        <%
                                            Double total = 0.0 ;  
                                            for (OrderDetailDTO orderDetail : listDetail) {
                                                total += orderDetail.getPrice() * orderDetail.getQuantity() ;
                                        %>
                                        <tr>
                                            <td><%= orderDetail.getOrder_ID()  %></td>
                                            <td><%= orderDetail.getName()  %></td>
                                            <td><%= orderDetail.getQuantity()  %></td>
                                            <td><%= orderDetail.getPrice()  %></td>
                                            <td><%= orderDetail.getPrice() * orderDetail.getQuantity()  %></td> 
                                        </tr>
                                         <% 
                                            }
                                        %>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td style="font-weight: bold;">Total</td>
                                            <td style="font-weight: bold;"><%= total %></td>
                                        </tr>        
                                        
                                       
                                    </form>
                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </div>
                    <%

                    %>
                </div>
            </div>
            <!-- Footer Start -->
            <div class="container-fluid bg-dark text-white-50 footer pt-5  wow fadeIn" data-wow-delay="0.1s">
                <div class="container py-5">
                    <div class="row g-5">
                        <div class="col-lg-3 col-md-6">
                            <h5 class="text-white mb-4">Get In Touch</h5>
                            <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố
                                Thủ Đức, Thành phố Hồ Chí Minh</p>
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
                                <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                                <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </body>

</html>
