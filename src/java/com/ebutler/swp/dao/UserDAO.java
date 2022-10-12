/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebutler.swp.dao;

import com.ebutler.swp.dto.UserDTO;
import com.ebutler.swp.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class UserDAO {
    private final String SEARCH_US = "SELECT username from tblUser WHERE username LIKE ?";
    private final String SEARCH_US_PW = "SELECT * from tblUser WHERE username LIKE ? AND password LIKE ? AND status = 1";
    private final String SEARCH_US_PHONE = "SELECT username from tblUser WHERE phone LIKE ?";
    private final String SEARCH_US_EMAIL = "SELECT username from tblUser WHERE email LIKE ?";
    
    public boolean isExisted(String username) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null)
            {
                ptm = conn.prepareStatement(SEARCH_US);
                ptm.setString(1, username);
                rs = ptm.executeQuery();
                return rs.next();                     
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally{
            if(conn != null) conn.close();
            if(ptm != null) ptm.close();
        }
        
        return true;
    }
    
    public boolean isExistedPhone(String phone) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null)
            {
                ptm = conn.prepareStatement(SEARCH_US_PHONE);
                ptm.setString(1, phone);
                rs = ptm.executeQuery();
                return rs.next();                     
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally{
            if(conn != null) conn.close();
            if(ptm != null) ptm.close();
        }
        
        return true;
    }
    
    public boolean isExistedEmail(String email) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null)
            {
                ptm = conn.prepareStatement(SEARCH_US_EMAIL);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                return rs.next();                     
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally{
            if(conn != null) conn.close();
            if(ptm != null) ptm.close();
        }
        
        return true;
    }
    
    public UserDTO Login(String username, String password) throws SQLException {
        UserDTO user = new UserDTO();
        
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null)
            {
                ptm = conn.prepareStatement(SEARCH_US_PW);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if(rs.next()) {
                    String role_ID = rs.getString("role_ID");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    int status = rs.getInt("status");
                    
                    user = new UserDTO(username, password, role_ID, phone, email, status);
                }                  
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally{
            if(conn != null) conn.close();
            if(ptm != null) ptm.close();
        }
        
        return user;
    }
}
