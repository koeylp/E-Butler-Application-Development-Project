/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebutler.swp.controllers;

import java.io.IOException;
import java.io.PrintWriter;
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
    private final String ERROR = "error.jsp";
    
//    Register
    private final String REGISTER = "Register";
    private final String REGISTER_CONTROLLER = "RegisterController";
    
//    Login
    private final String LOGIN = "Login";
    private final String LOGIN_CONTROLLER = "LoginController";
    
//    Logout
    private final String LOGOUT = "Logout";
    private final String LOGOUT_CONTROLLER = "LogoutController";
    
    
    private final String GO_TO_PRODUCT_PAGE = "GoToProductPage";
    private final String PRODUCT_PAGE_CONTROLLER = "ProductPageController";
    private final String SEARCH_PRODUCT = "SearchProduct";
    private final String SEARCH_PRODUCT_CONTROLLER = "SearchProductController";
    private final String SORT_PRODUCT_PRICE_UP = "SortProductPriceUp";
    private final String SORT_PRODUCT_PRICE_UP_CONTROLLER = "SortProductPriceUpController";
    private final String SORT_PRODUCT_PRICE_DOWN = "SortProductPriceDown";
    private final String SORT_PRODUCT_PRICE_DOWN_CONTROLLER = "SortProductPriceDownController";
    private final String SORT_PRODUCT_WORD_DOWN = "SortProductWordDown";
    private final String SORT_PRODUCT_WORD_DOWN_CONTROLLER = "SortProductWordDownController";
    private final String SORT_PRODUCT_WORD_UP = "SortProductWordUp";
    private final String SORT_PRODUCT_WORD_UP_CONTROLLER = "SortProductWordUpController";
    private final String ADD_TO_CART = "AddToCart";
    private final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private final String DELETE_CART = "DeleteCart";
    private final String DELETE_CART_CONTROLLER = "DeleteCartController";
    private final String CHECKOUT = "Checkout";
    private final String CHECKOUT_CONTROLLER = "CheckoutController";
    private final String LOAD_CART_DATA = "LoadCartData";
    private final String LOAD_CART_DATA_CONTROLLER = "LoadCartDataController";
    
    
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
            } else if (action.equals(LOGOUT)){
                url = LOGOUT_CONTROLLER;
            } 
        }
        catch (Exception e) {
            log("Error at MainController: " + e.toString());
        }
        finally {
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
