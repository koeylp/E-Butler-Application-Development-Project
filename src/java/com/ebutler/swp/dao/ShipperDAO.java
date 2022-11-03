/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebutler.swp.dao;

import com.ebutler.swp.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author thekh
 */
public class ShipperDAO {
    private static final String UPDATE_WALLET = "UPDATE tblShipper\n"
            + "SET wallet = ?\n"
            + "WHERE username = ?";
    private static final String GET_WALLET = "SELECT wallet\n"
            + "FROM tblShipper\n"
            + "WHERE username = ?";
    
    public static double getWallet(String username) throws SQLException {
        double wallet = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_WALLET);
                ptm.setString(1, username);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    wallet = rs.getDouble("wallet");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }

        return wallet;
    }

    public static boolean updateWallet(String username, double wallet) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_WALLET);
                ptm.setDouble(1, getWallet(username) + wallet);
                ptm.setString(2, username);
                check = ptm.executeUpdate() > 0;

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }

        return check;
    }
}
