/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebutler.swp.controllers;

import com.ebutler.swp.dao.UserDAO;
import com.ebutler.swp.dto.GoogleUserDTO;
import com.ebutler.swp.dto.UserDTO;
import com.ebutler.swp.utils.GoogleUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thekh
 */
@WebServlet(name = "LoginWithGoogleController", urlPatterns = {"/LoginWithGoogleController"})
public class LoginWithGoogleController extends HttpServlet {

    private static final String ERROR = "errorPage.jsp";
    private static final String SUCCESS = "RegisterController";
    private static final String SUCCESS_ALREADY_CUS = "LoadingProductAndServiceCategory";
    private static final String SUCCESS_ALREADY_PRO = "Provider_ProductController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String code = request.getParameter("code");
            UserDAO dao = new UserDAO();
            UserDTO loginUser = new UserDTO();
            if (!code.isEmpty()) {
                HttpSession session = request.getSession();  
                String accessToken = GoogleUtils.getToken(code);
                GoogleUserDTO googleUser = GoogleUtils.getUserInfo(accessToken);
                if (!dao.isExistedEmail(googleUser.getEmail())) {
                    request.setAttribute("GOOGLE_USER", googleUser);
                    url = SUCCESS;
                } else {
                    loginUser = dao.getUserByEmail(googleUser.getEmail());
                    String role = dao.getUserByEmail(googleUser.getEmail()).getRole_id();
                    if (role.equals("CUS")) {
                        session.setAttribute("LOGIN_USER", loginUser);
                        url = SUCCESS_ALREADY_CUS;
                    } else if (role.equals("PRO")) {
                        session.setAttribute("LOGIN_USER", loginUser);
                        url = SUCCESS_ALREADY_PRO;
                    }
                }
                
            }
        } catch (Exception e) {
            log("Error at LoginGoogleController: " + e.toString());
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
