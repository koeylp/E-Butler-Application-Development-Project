/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebutler.swp.dao;

import com.ebutler.swp.dto.CityDTO;
import com.ebutler.swp.dto.ProvinceDTO;
import com.ebutler.swp.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class AddressDAO {
    private final String SELECT_PROVINCE = "select province_ID, province_Name from tblProvince_City";
    private final String SELECT_CITY = "select district_ID, city_name, province_ID from tblDistrict where province_ID = ?";
    
    public ArrayList<ProvinceDTO> SelectProvince() throws SQLException {
        ArrayList<ProvinceDTO> list = new ArrayList<>();
        
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                ptm = conn.prepareStatement(SELECT_PROVINCE);
                rs = ptm.executeQuery();
                while(rs.next()){
                    list.add(new ProvinceDTO(rs.getString(1), rs.getString(2)));
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
    
    public ArrayList<CityDTO> SelectCity(String province_id) throws SQLException {
        ArrayList<CityDTO> list = new ArrayList<>();
        
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                ptm = conn.prepareStatement(SELECT_CITY);
                ptm.setString(1, province_id);
                rs = ptm.executeQuery();
                while(rs.next()){
                    list.add(new CityDTO(rs.getString(1), rs.getString(2), rs.getString(3)));
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
