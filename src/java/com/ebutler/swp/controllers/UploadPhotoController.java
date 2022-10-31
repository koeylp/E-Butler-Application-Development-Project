/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebutler.swp.controllers;

import com.ebutler.swp.dao.CustomerDAO;
import com.ebutler.swp.dto.CustomerDTO;
import com.ebutler.swp.dto.UserDTO;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author thekh
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(name = "UploadPhotoController", urlPatterns = {"/UploadPhotoController"})
public class UploadPhotoController extends HttpServlet {

    private final static String ERROR = "errorPage.jsp";
    private final static String SUCCESS = "MainController?action=GoToUserProfile&current_form=account";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {

            HttpSession session = request.getSession();
            if (session != null) {
                UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");

                CustomerDAO cusDao = new CustomerDAO();

                

                String uploadPath = getServletContext().getRealPath("") + File.separator + "img" + File.separator + "avatars";
                File uploadDir = new File(uploadPath);

                String newPath = "";
                if (uploadPath.contains(File.separator + "build")) {
                    newPath = uploadPath.replace(File.separator + "build", "");
                }
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                for (Part part : request.getParts()) {
                    String fileName = part.getSubmittedFileName();
                    part.write(newPath + File.separator + fileName);
                }
                Part part = request.getPart("file");
                String fileName = part.getSubmittedFileName();
                if (cusDao.uploadPhoto(user.getUsername(), fileName)) {
                    CustomerDTO customer = (CustomerDTO) session.getAttribute("CURRENT_CUSTOMER");
                    customer.setAvatar(fileName);
                    session.setAttribute("CURRENT_CUSTOMER", customer);
                    url = SUCCESS;
                }

            }
        } catch (Exception e) {
            log("Error at UploadPhotoController: " + e.getMessage());
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
