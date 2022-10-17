/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebutler.swp.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

//    Error Page
    private final String ERROR = "errorPage.jsp";

//    Register
    private final String REGISTER = "Register";
    private final String REGISTER_CONTROLLER = "RegisterController";

//    Login
    private final String LOGIN = "Login";
    private final String LOGIN_CONTROLLER = "LoginController";

//    Logout
    private final String LOGOUT = "Logout";
    private final String LOGOUT_CONTROLLER = "LogoutController";

//    Product Page
    private final String GO_TO_PRODUCT_PAGE = "GoToProductPageByPlace";
    private final String PRODUCT_PAGE_CONTROLLER = "ProductPageController";

//    Service Page
    private final String GO_TO_SERVICE_PAGE = "GoToServicePageByPlace";
    private final String SERVICE_PAGE_CONTROLLER = "ServicePageController";

//    Product Detail
    private final String GO_TO_PRODUCT_DETAIL_BY_TYPE_PAGE = "GoToProductDetailByType";
    private final String PRODUCT_DETAIL_BY_TYPE_CONTROLLER = "ProductDetailByTypeController";

//    Service Detail
    private final String GO_TO_SERVICE_DETAIL_BY_TYPE_PAGE = "GoToServiceDetailByType";
    private final String SERVICE_DETAIL_BY_TYPE_CONTROLLER = "ServiceDetailByTypeController";

//    Search
    private final String SEARCH_PRODUCT = "SearchProduct";
    private final String SEARCH_PRODUCT_CONTROLLER = "SearchProductController";

//    User profile Page
    private final String GO_TO_USER_PROFILE = "GoToUserProfile";
    private final String GO_TO_USER_PROFILE_CONTROLLER = "GoToUserProfileController";

//    Update profile
    private final String UPDATE_USER_PROFILE = "UpdateCustomerInfo";
    private final String UPDATE_USER_PROFILE_CONTROLLER = "UpdateCustomerInfoController";

//    Sort
    private final String SORT_PRODUCT_DETAIL_PRICE_UP = "PriceDetailUp";
    private final String SORT_PRODUCT_DETAIL_PRICE_UP_CONTROLLER = "SortProductDetailPriceUpController";

    private final String SORT_PRODUCT_DETAIL_PRICE_DOWN = "PriceDetailDown";
    private final String SORT_PRODUCT_PRICE_DOWN_CONTROLLER = "SortProductPriceDownController";

    private final String SORT_PRODUCT_DETAIL_WORD_DOWN = "WordDetailDown";
    private final String SORT_PRODUCT_DETAIL_WORD_DOWN_CONTROLLER = "WordDetailDownController";

    private final String SORT_PRODUCT_DETAIL_WORD_UP = "WordDetailUp";
    private final String SORT_PRODUCT_DETAIL_WORD_UP_CONTROLLER = "WordDetailUpController";

    private final String SORT_PRODUCT_CATEGORY_WORD_UP = "WordProductCategoryUp";
    private final String SORT_PRODUCT_CATEGORY_WORD_UP_CONTROLLER = "WordProductCategoryUpController";

    private final String SORT_PRODUCT_CATEGORY_WORD_DOWN = "WordProductCategoryDown";
    private final String SORT_PRODUCT_CATEGORY_WORD_DOWN_CONTROLLER = "WordProductCategoryDownController";

    private final String SORT_SERVICE_CATEGORY_WORD_UP = "WordServiceCategoryUp";
    private final String SORT_SERVICE_CATEGORY_WORD_UP_CONTROLLER = "WordServiceCategoryUpController";
    private final String SORT_SERVICE_CATEGORY_WORD_DOWN = "WordServiceCategoryDown";
    private final String SORT_SERVICE_CATEGORY_WORD_DOWN_CONTROLLER = "WordServiceCategoryDownController";

    //Search    
    private final String SEARCH_PRODUCT_DETAIL_BY_TYPE = "SearchProductDetailByType";
    private final String SEARCH_PRODUCT_DETAIL_BY_TYPE_CONTROLLER = "SearchProductDetailByTypeController";

    private final String SEARCH_PRODUCT_CATEGORY = "SearchProductCategory";
    private final String SEARCH_PRODUCT_CATEGORY_CONTROLLER = "SearchProductCategoryController";

    private final String SEARCH_SERVICE_CATEGORY = "SearchServiceCategory";
    private final String SEARCH_SERVICE_CATEGORY_CONTROLLER = "SearchServiceCategoryController";

//    Change password
    private final String CHANGE_CUSTOMER_PASSWORD = "ChangeCustomerPassword";
    private final String CHANGE_CUSTOMER_PASSWORD_CONTROLLER = "ChangeCustomerPasswordController";

//    Shopping cart
    private final String ADD_TO_CART = "AddToCart";
    private final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private final String DELETE_CART = "DeleteCart";
    private final String DELETE_CART_CONTROLLER = "DeleteCartController";
    private final String CHECKOUT = "Checkout";
    private final String CHECKOUT_CONTROLLER = "CheckoutController";
    private final String LOAD_CART_DATA = "LoadCartData";
    private final String LOAD_CART_DATA_CONTROLLER = "LoadCartDataController";
    private final String MOVE_TO_CART = "MoveToCart";
    private final String MOVE_TO_CART_CONTROLLER = "MoveToCartController";
    private final String EDIT_QUANTITY = "EditQuantity";
    private final String EDIT_QUANTITY_CONTROLLER = "EditQuantityController";
    private final String ADD_SERVICE_TO_CART = "AddServiceToCart";
    private final String ADD_SERVICE_TO_CART_CONTROLLER = "AddServiceToCartController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;

        try {
            String action = request.getParameter("action");

            if (action.equals(REGISTER)) {
                url = REGISTER_CONTROLLER;
            } else if (action.equals(LOGIN)) {
                url = LOGIN_CONTROLLER;
            } else if (action.equals(LOGOUT)) {
                url = LOGOUT_CONTROLLER;
            } else if (action.equals(GO_TO_PRODUCT_PAGE)) {
                url = PRODUCT_PAGE_CONTROLLER;
            } else if (action.equals(GO_TO_PRODUCT_DETAIL_BY_TYPE_PAGE)) {
                url = PRODUCT_DETAIL_BY_TYPE_CONTROLLER;
            } else if (action.equals(GO_TO_USER_PROFILE)) {
                url = GO_TO_USER_PROFILE_CONTROLLER;
            } else if (action.equals(SEARCH_PRODUCT_DETAIL_BY_TYPE)) {
                url = SEARCH_PRODUCT_DETAIL_BY_TYPE_CONTROLLER;
            } else if (action.equals(SEARCH_PRODUCT_CATEGORY)) {
                url = SEARCH_PRODUCT_CATEGORY_CONTROLLER;
            } else if (action.equals(SORT_PRODUCT_DETAIL_PRICE_UP)) {
                url = SORT_PRODUCT_DETAIL_PRICE_UP_CONTROLLER;
            } else if (action.equals(CHANGE_CUSTOMER_PASSWORD)) {
                url = CHANGE_CUSTOMER_PASSWORD_CONTROLLER;
            } else if (action.equals(GO_TO_SERVICE_PAGE)) {
                url = SERVICE_PAGE_CONTROLLER;
            } else if (action.equals(SORT_PRODUCT_CATEGORY_WORD_UP)) {
                url = SORT_PRODUCT_CATEGORY_WORD_UP_CONTROLLER;
            } else if (action.equals(SORT_PRODUCT_CATEGORY_WORD_DOWN)) {
                url = SORT_PRODUCT_CATEGORY_WORD_DOWN_CONTROLLER;
            } else if (action.equals(SORT_PRODUCT_DETAIL_PRICE_DOWN)) {
                url = SORT_PRODUCT_PRICE_DOWN_CONTROLLER;
            } else if (action.equals(SORT_PRODUCT_DETAIL_WORD_DOWN)) {
                url = SORT_PRODUCT_DETAIL_WORD_DOWN_CONTROLLER;
            } else if (action.equals(SORT_PRODUCT_DETAIL_WORD_UP)) {
                url = SORT_PRODUCT_DETAIL_WORD_UP_CONTROLLER;
            } else if (action.equals(SEARCH_SERVICE_CATEGORY)) {
                url = SEARCH_SERVICE_CATEGORY_CONTROLLER;
            } else if (action.equals(SORT_SERVICE_CATEGORY_WORD_UP)) {
                url = SORT_SERVICE_CATEGORY_WORD_UP_CONTROLLER;
            } else if (action.equals(SORT_SERVICE_CATEGORY_WORD_DOWN)) {
                url = SORT_SERVICE_CATEGORY_WORD_DOWN_CONTROLLER;
            } else if (action.equals(GO_TO_SERVICE_DETAIL_BY_TYPE_PAGE)) {
                url = SERVICE_DETAIL_BY_TYPE_CONTROLLER;
            } else if (action.equals(ADD_TO_CART)) {
                url = ADD_TO_CART_CONTROLLER;
            } else if (action.equals(DELETE_CART)) {
                url = DELETE_CART_CONTROLLER;
            } else if (action.equals(LOAD_CART_DATA)) {
                url = LOAD_CART_DATA_CONTROLLER;
            } else if (action.equals(CHECKOUT)) {
                url = CHECKOUT_CONTROLLER;
            } else if (action.equals(MOVE_TO_CART)) {
                url = MOVE_TO_CART_CONTROLLER;
            } else if (action.equals(EDIT_QUANTITY)) {
                url = EDIT_QUANTITY_CONTROLLER;
            } else if (action.equals(ADD_SERVICE_TO_CART)) {
                url = ADD_SERVICE_TO_CART_CONTROLLER;
            } else if (action.equals(UPDATE_USER_PROFILE)) {
                url = UPDATE_USER_PROFILE_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
