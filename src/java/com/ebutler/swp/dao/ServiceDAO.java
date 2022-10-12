/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebutler.swp.dao;

import com.ebutler.swp.dto.ServiceCategoryDTO;
import com.ebutler.swp.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dang Viet
 */
public class ServiceDAO {
        private static final String GET_SERVICE_CATEGORY_LIST = "SELECT category_ID, name, image FROM tblServiceCategory";

    
     public static List<ServiceCategoryDTO> getListServiceCategory() throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ServiceCategoryDTO> list = new ArrayList();
        try {
              conn = DBUtils.getConnection();
              ptm = conn.prepareStatement(GET_SERVICE_CATEGORY_LIST);
              rs = ptm.executeQuery();
              while(rs.next()){
                  list.add(new ServiceCategoryDTO(rs.getString("category_ID"), rs.getString("name"), rs.getString("image")));
              }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
     
     public static void main(String[] args) throws SQLException {
        List<ServiceCategoryDTO> list = getListServiceCategory();
        
         for (ServiceCategoryDTO x : list) {
             System.out.println(x);
         }
    }
}
