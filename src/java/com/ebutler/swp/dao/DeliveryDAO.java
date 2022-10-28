/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebutler.swp.dao;

import com.ebutler.swp.dto.DeliveryDTO;
import com.ebutler.swp.dto.OrderDetailDTO;
import com.ebutler.swp.dto.UserDTO;
import com.ebutler.swp.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class DeliveryDAO {
    private final String DELIVERY_LIST = "SELECT De.order_id, De.address, Ord.order_Date,Ord.customer_ID, Cus.name,Ord.total, De.status FROM (tblDelivery De JOIN tblOrder Ord ON De.order_id = Ord.order_ID) JOIN tblCustomer Cus ON Cus.username = Ord.customer_ID WHERE Ord.shipping = ? ";
    private final String DELIVERY_LIST_DEYAIL = "SELECT OPD.id, De.order_id, PD.name, OPD.quantity, PD.price, OPD.status FROM ( tblDelivery De JOIN tblOrder_Product_Detail OPD ON De.order_id = OPD.order_ID ) JOIN tblProductDetail PD ON PD.id = OPD.product_detail_ID  WHERE De.order_id = ? AND De.shipper_id = ? ";
    private final String UPDATE_PRODUCT_ORDER = "UPDATE tblOrder_Product_Detail SET status = ? WHERE id = ? " ; 
    private final String UPDATE_DELIVERY = "UPDATE tblDelivery SET status = ? WHERE order_id = ?" ; 
    private final String UPDATE_ORDER = "UPDATE tblOrder SET status = ? WHERE order_ID = ? " ; 
    private final String CHECK_BEFORE_UPDATE_DELIVERY = "SELECT * FROM tblOrder_Product_Detail WHERE order_ID = ? AND status = 2 " ; 
    
    
    
    
    public List<DeliveryDTO> loadListDelivery(UserDTO user) throws SQLException, ClassNotFoundException {
        List<DeliveryDTO> listDelivery = new ArrayList() ;
        Connection conn = null ; 
        PreparedStatement ptm = null ; 
        ResultSet rs = null ;
        try {
            conn = DBUtils.getConnection() ; 
            if(conn != null) {
                ptm = conn.prepareStatement(DELIVERY_LIST) ;
                ptm.setString(1, user.getUsername() ); 
                rs = ptm.executeQuery() ; 
                while (rs.next()) {
                    listDelivery.add(new DeliveryDTO(rs.getInt(1), rs.getString(2),rs.getDate(3),rs.getString(4) ,rs.getString(5), rs.getDouble(6), rs.getInt(7))) ;
                }
            }
        } catch (Exception e) {
        }finally {
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
        return listDelivery ;
    }
    public List<OrderDetailDTO> loadOrderDetail( int orderID ,UserDTO user) throws SQLException {
        List<OrderDetailDTO> listOrder = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELIVERY_LIST_DEYAIL); 
                ptm.setString(2, user.getUsername());
                ptm.setInt(1, orderID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    listOrder.add(new OrderDetailDTO(rs.getInt(1), rs.getInt(2), 0, rs.getString(3), rs.getInt(4), rs.getDouble(5), 0, rs.getInt(6))); 
                }
            }
        } catch (Exception e) {
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
        return listOrder;
    }
    public boolean updateProductOrder(int status ,int id) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_PRODUCT_ORDER); 
                ptm.setInt(1, status);
                ptm.setInt(2, id);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
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
        return check;
    }
    public boolean updateDelivery(int status ,int orderID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_DELIVERY); 
                ptm.setInt(1, status);
                ptm.setInt(2, orderID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
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
        return check;
    }
    public boolean updateOrder(int status ,int orderID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_ORDER); 
                ptm.setInt(1, status);
                ptm.setInt(2, orderID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
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
        return check;
    }
    public boolean checkForDelivery(int orderID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_BEFORE_UPDATE_DELIVERY); 
                ptm.setInt(1, orderID);
                rs = ptm.executeQuery() ;
                while(rs.next()) {
                    check = true ; 
                }
            }
        } catch (Exception e) {
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
        return check;
    }
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        List<DeliveryDTO> listDelivery = new ArrayList() ;
        List<OrderDetailDTO> listOrder = new ArrayList();
        DeliveryDAO deliveryDAO = new DeliveryDAO() ; 
        
        UserDAO userDAO = new UserDAO();
        UserDTO login_user = userDAO.Login("shopee", "1"); 
        listDelivery = deliveryDAO.loadListDelivery(login_user) ;
        listOrder = deliveryDAO.loadOrderDetail(1, login_user) ; 
        for (OrderDetailDTO deliveryDTO : listOrder) {
            System.out.println(deliveryDTO.toString());
        }
        boolean check = deliveryDAO.checkForDelivery(1) ; 
        System.out.println(check);
        
    }




}
