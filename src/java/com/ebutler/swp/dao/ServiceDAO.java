/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebutler.swp.dao;

import com.ebutler.swp.dto.ServiceCategoryDTO;
import com.ebutler.swp.dto.ServiceDTO;
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
    private static final String GET_SERVICE_LIST = "select service_ID, category_ID, name, image from tblService where category_ID = ?";
    private static final String SEARCH_SERVICE_CATEGORY = "select service_ID, category_ID, name, image from tblService where category_ID = ? AND name LIKE ?";
    private static final String SORT_SERVICE_CATEGORY_WORD_UP = "select service_ID, category_ID, name, image from tblService where category_ID = ? ORDER BY name ASC";
    private static final String SORT_SERVICE_CATEGORY_WORD_DOWN = "select service_ID, category_ID, name, image from tblService where category_ID = ? ORDER BY name DESC";

    public static List<ServiceCategoryDTO> getListServiceCategory() throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ServiceCategoryDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_SERVICE_CATEGORY_LIST);
            rs = ptm.executeQuery();
            while (rs.next()) {
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

    public static List<ServiceDTO> getListService(String categoryID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ServiceDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_SERVICE_LIST);
            ptm.setString(1, categoryID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ServiceDTO(rs.getString("service_ID"), rs.getString("category_ID"), rs.getString("name"), rs.getString("image")));
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

    public static List<ServiceDTO> sortServiceCategoryWordUP(String categoryID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ServiceDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SORT_SERVICE_CATEGORY_WORD_UP);
            ptm.setString(1, categoryID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ServiceDTO(rs.getString("service_ID"), rs.getString("category_ID"), rs.getString("name"), rs.getString("image")));
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

    public static List<ServiceDTO> sortServiceCategoryWordDOWN(String categoryID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ServiceDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SORT_SERVICE_CATEGORY_WORD_DOWN);
            ptm.setString(1, categoryID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ServiceDTO(rs.getString("service_ID"), rs.getString("category_ID"), rs.getString("name"), rs.getString("image")));
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

    public static List<ServiceDTO> searhServiceCategory(String categoryID, String search) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ServiceDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SEARCH_SERVICE_CATEGORY);
            ptm.setString(1, categoryID);
            ptm.setString(2, "%" + search + "%");
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ServiceDTO(rs.getString("service_ID"), rs.getString("category_ID"), rs.getString("name"), rs.getString("image")));
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
}
