/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebutler.swp.dao;

import com.ebutler.swp.dto.ProviderDTO;
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
public class ProviderDAO {
    private final String INSERT = "INSERT tblProvider (username, password, role_ID, phone, email, name, logo) VALUES (?, ?, ?, ?, ?, ?, ?)";
    
//    private final String LIST_PRODUCT = "SELECT product_ID , name ,image, price, quantity , description , status  FROM tblProduct_Detail" ;  
//    
//    private final String LIST_STAFF = "SELECT * from tblStaff" ;
//    
//    private final String LIST_SERVICE = "SELECT ser.service_ID , serC.name , serP.name , serP.price , serP.description , Pro.name FROM ((tblService_Category serC JOIN tbl_Servive ser ON serC.category_ID = ser.category_ID ) JOIN tblService_Detail serP ON ser.service_ID = serP.service_ID) JOIN tblProvider Pro ON serP.provider_ID = Pro.provider_ID" ;
//    
//    private final String LIST_ORDER = "SELECT ord.order_ID, ord.order_Date, cus.customer_Name, ord.total , ord.status FROM tblOrder ord JOIN tblCustomer cus ON ord.customer_ID = cus.customer_ID " ;
    
    
    public boolean InsertPro(ProviderDTO provider) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null)
            {         
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, provider.getUsername());
                ptm.setString(2, provider.getPassword());
                ptm.setString(3, provider.getRole_id());
                ptm.setString(4, provider.getPhone());
                ptm.setString(5, provider.getEmail());
                ptm.setString(6, provider.getName());
                ptm.setString(7, provider.getLogo());
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

}
