/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebutler.swp.controllers;

import com.ebutler.swp.dao.DeliveryDAO;
import com.ebutler.swp.dto.OrderDetailDTO;
import com.ebutler.swp.dto.UserDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class Update_Delivery_StatusController extends HttpServlet {

    private final String SUCCESS = "delivery_detail.jsp" ; 
    private final String ERROR = "delivery_detail.jsp" ; 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR ; 
        try {
            HttpSession session = request.getSession() ;
            boolean move = false ; 
            boolean checkForUpdateDelivery = false ;
            boolean updateDeliveryStatusForProduct = false ;
            boolean updateDelivery = false ;
            boolean updateOrder = false ;
            int statusDelivery = Integer.parseInt(request.getParameter("DeliveryStatus")) ; 
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER") ;
            int id = Integer.parseInt(request.getParameter("Product_id")) ;  
            int order_ID = Integer.parseInt(request.getParameter("Product_Order_id")) ;  
            DeliveryDAO deliveryDAO = new DeliveryDAO() ;
            
            updateDeliveryStatusForProduct = deliveryDAO.updateProductOrder(3, id) ;
            checkForUpdateDelivery = deliveryDAO.checkForDelivery(order_ID) ;
            if (updateDeliveryStatusForProduct) {
                move = true ; 
            }
            if(checkForUpdateDelivery) {
                updateDelivery = deliveryDAO.updateDelivery(3, order_ID) ;
                move = true ; 
            }
            if(checkForUpdateDelivery) {
                updateOrder = deliveryDAO.updateOrder(2, order_ID) ;
                move = true ; 
            }
            List<OrderDetailDTO> listOrder = new ArrayList(); 
            listOrder = deliveryDAO.loadOrderDetail(order_ID, user) ;
            if (move) {
                url = SUCCESS ; 
                session.setAttribute("Delivery_Detail", listOrder);
            }
        } catch (Exception e) {
        }finally {
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
