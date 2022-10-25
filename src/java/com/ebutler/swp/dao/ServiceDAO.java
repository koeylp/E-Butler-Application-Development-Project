/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebutler.swp.dao;

import com.ebutler.swp.dto.ServiceCartDTO;
import com.ebutler.swp.dto.ServiceCategoryDTO;
import com.ebutler.swp.dto.ServiceDTO;
import com.ebutler.swp.dto.ServiceDetailDTO;
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

    private static final String SORT_SERVICE_DETAIL_WORD_UP = "select detail.id, detail.provider_ID, detail.service_ID, detail.staff_ID, detail.name, detail.price, detail.description, detail.status from tblServiceCategory cate JOIN tblService service ON cate.category_ID = service.category_ID JOIN tblServiceDetail detail ON detail.service_ID = service.service_ID where cate.category_ID = ? AND service.service_ID = ? ORDER BY detail.name ASC";
    private static final String SORT_SERVICE_DETAIL_WORD_DOWN = "select detail.id, detail.provider_ID, detail.service_ID, detail.staff_ID, detail.name, detail.price, detail.description, detail.status from tblServiceCategory cate JOIN tblService service ON cate.category_ID = service.category_ID JOIN tblServiceDetail detail ON detail.service_ID = service.service_ID where cate.category_ID = ? AND service.service_ID = ? ORDER BY detail.name DESC";

    private static final String SORT_SERVICE_DETAIL_PRICE_UP = "select detail.id, detail.provider_ID, detail.service_ID, detail.staff_ID, detail.name, detail.price, detail.description, detail.status from tblServiceCategory cate JOIN tblService service ON cate.category_ID = service.category_ID JOIN tblServiceDetail detail ON detail.service_ID = service.service_ID where cate.category_ID = ? AND service.service_ID = ? ORDER BY detail.price ASC";
    private static final String SORT_SERVICE_DETAIL_PRICE_DOWN = "select detail.id, detail.provider_ID, detail.service_ID, detail.staff_ID, detail.name, detail.price, detail.description, detail.status from tblServiceCategory cate JOIN tblService service ON cate.category_ID = service.category_ID JOIN tblServiceDetail detail ON detail.service_ID = service.service_ID where cate.category_ID = ? AND service.service_ID = ? ORDER BY detail.price DESC";
    private static final String SEARCH_SERVICE_DETAIL_BY_NAME = "select detail.id, detail.provider_ID, detail.service_ID, detail.staff_ID, detail.name, detail.price, detail.description, detail.status from tblServiceCategory cate JOIN tblService service ON cate.category_ID = service.category_ID JOIN tblServiceDetail detail ON detail.service_ID = service.service_ID where cate.category_ID = ? AND service.service_ID = ? AND detail.name LIKE ?";

    private static final String GET_SERVICE_DETAIL_LIST = "select detail.id, detail.provider_ID, detail.service_ID, detail.staff_ID, detail.name, detail.price, detail.description, detail.status from tblServiceCategory cate JOIN tblService service ON cate.category_ID = service.category_ID JOIN tblServiceDetail detail ON detail.service_ID = service.service_ID where cate.category_ID = ? AND service.service_ID = ?";
    private static final String GET_SERVICE_BY_ID = "SELECT provider_ID, service_ID, staff_ID, name, price, description, status FROM tblServiceDetail WHERE id = ?";

    private static final String GET_SERVICE_INFO = "SELECT se.id, se.staff_ID, se.[name], st.[name] as staff_name, se.price, st.avatar, se.[description], st.[status]\n"
            + "FROM [tblServiceDetail] se\n"
            + "JOIN [tblStaff] st ON se.staff_ID = st.staff_ID\n"
            + "WHERE se.id = ?";

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

    public static List<ServiceDetailDTO> getListServiceDetailByType(String categoryID, String serviceID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ServiceDetailDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_SERVICE_DETAIL_LIST);
            ptm.setString(1, categoryID);
            ptm.setString(2, serviceID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ServiceDetailDTO(rs.getInt("id"), rs.getString("provider_ID"), rs.getString("service_ID"), rs.getInt("staff_ID"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"), rs.getInt("status")));
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

    public static List<ServiceDetailDTO> sortListServiceDetailByTypeWordUP(String categoryID, String serviceID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ServiceDetailDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SORT_SERVICE_DETAIL_WORD_UP);
            ptm.setString(1, categoryID);
            ptm.setString(2, serviceID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ServiceDetailDTO(rs.getInt("id"), rs.getString("provider_ID"), rs.getString("service_ID"), rs.getInt("staff_ID"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"), rs.getInt("status")));
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

    public static List<ServiceDetailDTO> sortListServiceDetailByTypeWordDOWN(String categoryID, String serviceID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ServiceDetailDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SORT_SERVICE_DETAIL_WORD_DOWN);
            ptm.setString(1, categoryID);
            ptm.setString(2, serviceID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ServiceDetailDTO(rs.getInt("id"), rs.getString("provider_ID"), rs.getString("service_ID"), rs.getInt("staff_ID"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"), rs.getInt("status")));
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

    public static List<ServiceDetailDTO> searchListServiceDetailByType(String categoryID, String serviceID, String name) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ServiceDetailDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SEARCH_SERVICE_DETAIL_BY_NAME);
            ptm.setString(1, categoryID);
            ptm.setString(2, serviceID);
            ptm.setString(3, "%" + name + "%");
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ServiceDetailDTO(rs.getInt("id"), rs.getString("provider_ID"), rs.getString("service_ID"), rs.getInt("staff_ID"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"), rs.getInt("status")));
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

    public static List<ServiceDetailDTO> sortListServiceDetailByTypePriceDOWN(String categoryID, String serviceID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ServiceDetailDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SORT_SERVICE_DETAIL_WORD_DOWN);
            ptm.setString(1, categoryID);
            ptm.setString(2, serviceID);

            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ServiceDetailDTO(rs.getInt("id"), rs.getString("provider_ID"), rs.getString("service_ID"), rs.getInt("staff_ID"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"), rs.getInt("status")));
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

    public static List<ServiceDetailDTO> sortListServiceDetailByTypePriceUP(String categoryID, String serviceID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ServiceDetailDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SORT_SERVICE_DETAIL_WORD_UP);
            ptm.setString(1, categoryID);
            ptm.setString(2, serviceID);

            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ServiceDetailDTO(rs.getInt("id"), rs.getString("provider_ID"), rs.getString("service_ID"), rs.getInt("staff_ID"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"), rs.getInt("status")));
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

            StaffDAO staffDAO = new StaffDAO();

            while (rs.next()) {
//                lấy service_id
                String service_id = rs.getString("service_ID");
                list.add(new ServiceDTO(service_id, rs.getString("category_ID"), rs.getString("name"), rs.getString("image"), staffDAO.getListStaffByServiceDetail(service_id)));
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

            StaffDAO staffDAO = new StaffDAO();

            while (rs.next()) {

                String service_id = rs.getString("service_ID");

                list.add(new ServiceDTO(service_id, rs.getString("category_ID"), rs.getString("name"), rs.getString("image"), staffDAO.getListStaffByServiceDetail(service_id)));
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

            StaffDAO staffDAO = new StaffDAO();

            while (rs.next()) {

                String service_id = rs.getString("service_ID");

                list.add(new ServiceDTO(service_id, rs.getString("category_ID"), rs.getString("name"), rs.getString("image"), staffDAO.getListStaffByServiceDetail(service_id)));
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

            StaffDAO staffDAO = new StaffDAO();

            while (rs.next()) {

                String service_id = rs.getString("service_ID");

                list.add(new ServiceDTO(service_id, rs.getString("category_ID"), rs.getString("name"), rs.getString("image"), staffDAO.getListStaffByServiceDetail(service_id)));
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

    public static ServiceDetailDTO getServiceDetailByID(String id) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ServiceDetailDTO serviceDetail = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_SERVICE_BY_ID);
            ptm.setString(1, id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String provider_ID = rs.getString("provider_ID");
                String service_ID = rs.getString("service_ID");
                int staff_ID = rs.getInt("staff_ID");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                int status = rs.getInt("status");
                serviceDetail = new ServiceDetailDTO(Integer.parseInt(id), provider_ID, service_ID, staff_ID, name, price, description, status);
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

        return serviceDetail;
    }

//    se.id, se.staff_ID, se.[name], st.[name], se.price, se.avatar, se.[description], st.[status]
    public static ServiceCartDTO getServiceInfoByID(String id) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ServiceCartDTO serviceDetail = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_SERVICE_INFO);
            ptm.setString(1, id);
            rs = ptm.executeQuery();
            while (rs.next()) {
//                String staff_id = rs.getString("se.staff_ID");
                String service_name = rs.getString("name");
                String staff_name = rs.getString("staff_name");
                double price = rs.getDouble("price");
                String avatar = rs.getString("avatar");
                String description = rs.getString("description");
                int status = rs.getInt("status");
                serviceDetail = new ServiceCartDTO(Integer.parseInt(id), service_name, staff_name, price, avatar, description, status);
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

        return serviceDetail;
    }

    public static void main(String[] args) throws SQLException {
//        List<ServiceDetailDTO> list = sortListServiceDetailByTypeWordDOWN("HC", "1");
//
//        for (ServiceDetailDTO x : list) {
//            System.out.println(x);
//        }
        System.out.println(getServiceInfoByID("3").getStaffName());
    }
}
