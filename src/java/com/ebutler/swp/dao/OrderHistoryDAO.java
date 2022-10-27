/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebutler.swp.dao;

import com.ebutler.swp.dto.ProductOrderHistoryDTO;
import com.ebutler.swp.dto.ServiceOrderedHistoryDTO;
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
public class OrderHistoryDAO {
    private static final String GET_LIST_PRODUCT_ORDER_HISTORY_PENDING = "select customer.username, order1.order_Date, order1.payment, prodDetail.name,prodDetail.price,  detail.quantity , prodDetail.image, order1.status from tblCustomer customer JOIN tblOrder order1 ON customer.username = order1.customer_ID JOIN tblOrder_Product_Detail detail ON detail.order_ID = order1.order_ID JOIN tblProductDetail prodDetail ON prodDetail.id = detail.product_detail_ID where customer.username = ? AND order1.status = ?";
    private static final String GET_LIST_SERVICE_ORDER_HISTORY_PENDING = "SELECT customer.username, order1.order_Date, order1.payment, staff.name as [staff_name], service.name as  [service_name] , service.image, orderDetail.price, order1.status FROM tblOrder order1 JOIN tblOrder_Service_Detail orderDetail ON order1.order_ID = orderDetail.order_ID JOIN tblStaff staff on staff.staff_ID = orderDetail.staff_ID JOIN tblCustomer customer ON customer.username = order1.customer_ID JOIN tblService service ON service.service_ID = orderDetail.id where customer.username=? and order1.status = ?";

    public static List<ProductOrderHistoryDTO> getListProductOrderHistory(String username, int status) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ProductOrderHistoryDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_PRODUCT_ORDER_HISTORY_PENDING);
            ptm.setString(1, username);
            ptm.setInt(2, status);
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ProductOrderHistoryDTO(rs.getString("username"), rs.getString("order_Date"),rs.getString("payment"), rs.getString("name"), rs.getDouble("price") , rs.getInt("quantity"),rs.getString("image"),rs.getInt("status")));
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
    public static List<ServiceOrderedHistoryDTO> getListServideOrderHistory(String username, int status) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ServiceOrderedHistoryDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_SERVICE_ORDER_HISTORY_PENDING);
            ptm.setString(1, username);
            ptm.setInt(2, status);
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ServiceOrderedHistoryDTO(rs.getString("username"), rs.getString("order_Date"),rs.getString("payment"), rs.getString("staff_name"), rs.getString("service_name") , rs.getString("image"),rs.getDouble("price"), rs.getInt("status")));
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
             List<ServiceOrderedHistoryDTO> list = getListServideOrderHistory("Viet Dang", 0);
             for (ServiceOrderedHistoryDTO x : list) {
                 System.out.println(x);
            }
    }
}
