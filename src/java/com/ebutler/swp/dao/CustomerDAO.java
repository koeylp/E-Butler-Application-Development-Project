/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebutler.swp.dao;

import com.ebutler.swp.dto.CustomerDTO;
import com.ebutler.swp.dto.ProductCategoryDTO;
import com.ebutler.swp.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CustomerDAO {
    private final String INSERT = "INSERT INTO tblCustomer (username, password, role_ID, phone, email, name, gender, dob, avatar, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String GET_PRODUCT_CATEGORY_LIST = "SELECT category_ID, name, image FROM tblProductCategory";
    private static final String GET_USER_PROFILE_INFO = "select username, password, role_ID, phone, email, name, gender, dob, avatar, status from tblCustomer where username = ?";
    private final String GET_CURRENT_PSW = "SELECT password from tblCustomer WHERE username = ?";
    private final String UPDATE_CURRENT_PSW = "UPDATE tblCustomer SET password=? WHERE username=?";
    private final String UPDATE_CURRENT_CUSTOMER_INFO = "UPDATE tblCustomer SET avatar=?,name=?, email=?,dob= ?, gender=?, phone=?  WHERE username= ?";

    public boolean InsertCus(CustomerDTO customer) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null)
            {         
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, customer.getUsername());
                ptm.setString(2, customer.getPassword());
                ptm.setString(3, customer.getRole_id());
                ptm.setString(4, customer.getPhone());
                ptm.setString(5, customer.getEmail());
                ptm.setString(6, customer.getName());
                ptm.setInt(7, customer.getGender());
                ptm.setString(8, customer.getDob());
                ptm.setString(9, customer.getAvatar());
                ptm.setInt(10, customer.getStatus());
                return (ptm.executeUpdate() > 0) ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally{
            if(conn != null) conn.close();
            if(ptm != null) ptm.close();
        }
        
        return false;
    }

    public static List<ProductCategoryDTO> getProductCategoryList() throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ProductCategoryDTO> list = new ArrayList<>();
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                ptm = conn.prepareStatement(GET_PRODUCT_CATEGORY_LIST);
                rs = ptm.executeQuery();
                while(rs.next()){
                    list.add(new ProductCategoryDTO(rs.getString(1), rs.getString(2), rs.getString(3)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
   
    public CustomerDTO getCurrentCustomer(String username) throws SQLException{
        CustomerDTO customer = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null)
            {
                 ptm = conn.prepareStatement(GET_USER_PROFILE_INFO);
                 ptm.setString(1, username);
                 rs = ptm.executeQuery();
                if(rs.next()) {
                    customer = new CustomerDTO(rs.getString("username"), rs.getString("password"), rs.getString("role_ID"), rs.getString("phone"), rs.getString("email"), rs.getString("name"), rs.getInt("gender"), rs.getString("dob"), rs.getString("avatar"), rs.getInt("status"));
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs != null) rs.close();
            if(conn != null) conn.close();
            if(ptm != null) ptm.close();
        }
        
        return customer;
    }

    public boolean updateCurrentCustomerInfo(String avatar, String name, String email, String dob, int gender, String phone, String username) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null)
            {
   //private final String UPDATE_CURRENT_CUSTOMER_INFO = "UPDATE tblCustomer SET avatar=?,name=?, email=?,dob= ?, gender=?, phone=?  WHERE username= ?";
                 ptm = conn.prepareStatement(UPDATE_CURRENT_CUSTOMER_INFO);
                 ptm.setString(1, avatar);
                 ptm.setString(2, name);
                 ptm.setString(3, email);
                 ptm.setString(4, dob);
                 ptm.setInt(5, gender);
                 ptm.setString(6, phone);
                 ptm.setString(7, username);


//                 rs = ptm.executeQuery();
//                if(rs.next()) {
//                    customer = new CustomerDTO(rs.getString("username"), rs.getString("password"), rs.getString("role_ID"), rs.getString("phone"), rs.getString("email"), rs.getString("name"), rs.getInt("gender"), rs.getString("dob"), rs.getString("avatar"), rs.getInt("status"));
//                }
                check = ptm.executeUpdate() > 0;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(conn != null) conn.close();
            if(ptm != null) ptm.close();
        }
        
        return check;
    }
    public boolean updateCurrentPassword(String newPassword ,String username) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_CURRENT_PSW);
                ptm.setString(1, newPassword);  
                ptm.setString(2, username);  
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
     public String getCurrentCustomerPassword(String username) throws SQLException{
        String currentPsw = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null)
            {
                 ptm = conn.prepareStatement(GET_CURRENT_PSW);
                 ptm.setString(1, username);
                 rs = ptm.executeQuery();
                if(rs.next()) {
                    currentPsw = rs.getString("password");
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs != null) rs.close();
            if(conn != null) conn.close();
            if(ptm != null) ptm.close();
        }
        
        return currentPsw;
    }
}

