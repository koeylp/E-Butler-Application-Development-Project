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
    private static final String GET_PRODUCT_CATEGORY_LIST = "SELECT category_ID, name, image FROM tblProduct_Category";
    

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
   
}

