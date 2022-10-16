/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebutler.swp.dao;

import com.ebutler.swp.dto.ProductDTO;
import com.ebutler.swp.dto.ProductDetailDTO;
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
public class ProductDAO {


//    private static final String GET_LIST_PRODUCT = "SELECT category_Name,p.product_Name, category_Image, p.price, p.quantity FROM tblProduct_Category c JOIN tblProduct t  ON c.category_ID = t.category_ID INNER JOIN tblProduct_Provider p ON p.product_ID = t.product_ID where c.category_ID = ?";
    private static final String GET_LIST_PRODUCT = "SELECT category_Name, p.product_Provider_ID, p.provider_ID, p.product_ID, p.product_Name, category_Image, p.price, p.quantity, p.image, p.description, p.status FROM tblProductCategory c JOIN tblProduct t  ON c.category_ID = t.category_ID INNER JOIN tblProductDetail p ON p.product_ID = t.product_ID where c.category_ID = ?";
    
    private static final String GET_LIST_PRODUCT_BY_TYPE = "SELECT product.product_ID, product.category_ID ,product.name, product.image FROM tblProductCategory cate JOIN tblProduct product ON cate.category_ID = product.category_ID where cate.category_ID = ?";
    
    private static final String GET_LIST_PRODUCT_BY_TYPE_DETAIL = "SELECT detail.id, detail.provider_ID, detail.product_ID, detail.name, detail.quantity, detail.price, detail.image, detail.description, detail.status FROM tblProduct product JOIN tblProductDetail detail on product.product_ID = detail.product_ID JOIN tblProductCategory cate ON cate.category_ID = product.category_ID WHERE cate.category_ID = ? AND product.product_ID = ?";
            
    private static final String GET_SEARCH_PRODUCT = "SELECT product.product_ID, product.category_ID ,product.name, product.image FROM tblProductCategory cate JOIN tblProduct product ON cate.category_ID = product.category_ID where product.name LIKE ? AND cate.category_ID = ?";
    private static final String GET_SEARCH_PRODUCT1 = "SELECT t.id, provider_ID, t.product_ID, name, quantity, price, image, description, status FROM tblProductDetail t JOIN tblProduct h ON t.product_ID = h.product_ID JOIN tblProductCategory c ON c.category_ID = h.category_ID where product_Name like ? and t.product_ID = ?";
    private static final String GET_SEARCH_PRODUCT_DETAIL_BY_TYPE = "SELECT detail.id, detail.provider_ID, detail.product_ID, detail.name, detail.quantity, detail.price, detail.image, detail.description, detail.status FROM tblProduct product JOIN tblProductDetail detail on product.product_ID = detail.product_ID JOIN tblProductCategory cate ON cate.category_ID = product.category_ID WHERE cate.category_ID = ? AND product.product_ID = ? AND detail.name like ?";
    private static final String GET_SEARCH_PRODUCT_CATEGORY = "SELECT product.product_ID, product.category_ID, product.name, product.image FROM tblProduct product JOIN tblProductCategory cate on product.category_ID = cate.category_ID WHERE product.category_ID = ? AND product.name LIKE ?";
    
    private static final String GET_PRODUCT_BY_ID = "SELECT p.name, p.id, p.provider_ID, p.product_ID, p.name, p.image, p.price, p.quantity, p.image, p.description, p.status FROM tblProduct_Category c JOIN tblProduct t  ON c.category_ID = t.category_ID INNER JOIN tblProduct_Detail p ON p.product_ID = t.product_ID WHERE p.product_ID = ?";

    private static final String SORT_PRODUCT_DETAIL_PRICE_UP = "SELECT detail.id, detail.provider_ID, detail.product_ID, detail.name, detail.quantity, detail.price, detail.image, detail.description, detail.status FROM tblProduct product JOIN tblProductDetail detail on product.product_ID = detail.product_ID JOIN tblProductCategory cate ON cate.category_ID = product.category_ID WHERE cate.category_ID = ? AND product.product_ID = ? ORDER BY detail.price ASC";
    private static final String SORT_PRODUCT_DETAIL_PRICE_DOWN = "SELECT detail.id, detail.provider_ID, detail.product_ID, detail.name, detail.quantity, detail.price, detail.image, detail.description, detail.status FROM tblProduct product JOIN tblProductDetail detail on product.product_ID = detail.product_ID JOIN tblProductCategory cate ON cate.category_ID = product.category_ID WHERE cate.category_ID = ? AND product.product_ID = ? ORDER BY detail.price DESC";
    private static final String SORT_PRODUCT_DETAIL_WORD_UP = "SELECT detail.id, detail.provider_ID, detail.product_ID, detail.name, detail.quantity, detail.price, detail.image, detail.description, detail.status FROM tblProduct product JOIN tblProductDetail detail on product.product_ID = detail.product_ID JOIN tblProductCategory cate ON cate.category_ID = product.category_ID WHERE cate.category_ID = ? AND product.product_ID = ? ORDER BY detail.name ASC";
    private static final String SORT_PRODUCT_DETAIL_WORD_DOWN = "SELECT detail.id, detail.provider_ID, detail.product_ID, detail.name, detail.quantity, detail.price, detail.image, detail.description, detail.status FROM tblProduct product JOIN tblProductDetail detail on product.product_ID = detail.product_ID JOIN tblProductCategory cate ON cate.category_ID = product.category_ID WHERE cate.category_ID = ? AND product.product_ID = ? ORDER BY detail.name DESC";

    private static final String SORT_PRODUCT_CATEGORY_WORD_UP = "SELECT pro.product_ID, pro.category_ID, pro.name, pro.image from tblProductCategory cate JOIN tblProduct pro on cate.category_ID = pro.category_ID where cate.category_ID = ? ORDER BY pro.name ASC";
    private static final String SORT_PRODUCT_CATEGORY_WORD_DOWN = "SELECT pro.product_ID, pro.category_ID, pro.name, pro.image from tblProductCategory cate JOIN tblProduct pro on cate.category_ID = pro.category_ID where cate.category_ID = ? ORDER BY pro.name DESC";

    public static List<ProductDTO> getListProductByPlace(String categoty_ID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ProductDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_PRODUCT_BY_TYPE);
            ptm.setString(1, categoty_ID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getString("product_ID"), rs.getString("category_ID"), rs.getString("name"), rs.getString("image")));
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
    
     public static List<ProductDetailDTO> getListProductByPlaceDetail(String categoty_ID, String productID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ProductDetailDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_PRODUCT_BY_TYPE_DETAIL);
            ptm.setString(1, categoty_ID);
            ptm.setString(2, productID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ProductDetailDTO(rs.getString("id"), rs.getString("provider_ID"), rs.getString("product_ID"), rs.getString("name"), rs.getInt("quantity"), rs.getDouble("price"), rs.getString("image"), rs.getString("description"), rs.getInt("status")));
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
     
     public static List<ProductDetailDTO> getSearchProductDetailByType(String categoty_ID, String productID, String search) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ProductDetailDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_SEARCH_PRODUCT_DETAIL_BY_TYPE);
            ptm.setString(1, categoty_ID);
            ptm.setString(2, productID);
            ptm.setString(3, "%"+search+"%");
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ProductDetailDTO(rs.getString("id"), rs.getString("provider_ID"), rs.getString("product_ID"), rs.getString("name"), rs.getInt("quantity"), rs.getDouble("price"), rs.getString("image"), rs.getString("description"), rs.getInt("status")));
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
     
      public static List<ProductDTO> getSearchProductCategory(String categoty_ID, String search) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ProductDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_SEARCH_PRODUCT_CATEGORY);
            ptm.setString(1, categoty_ID);
            ptm.setString(2, "%"+search+"%");
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getString("product_ID"), rs.getString("category_ID"), rs.getString("name"), rs.getString("image")));
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


    public static ProductDTO getProductByID(String product_ID) throws SQLException {
        ProductDTO product = new ProductDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
//            category_Name, category_Image, , p.description, p.status
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_BY_ID);
                ptm.setString(1, product_ID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String product_Provider_ID = rs.getString("id");
                    String provider_ID = rs.getString("provider_ID");
                    String product_Name = rs.getString("name");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");

                    int quantity = rs.getInt("quantity");
//                    product = new ProductDTO(product_Provider_ID, provider_ID, product_ID, product_Name, quantity, price, image, "", 0);
                }
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
        return product;
    }

    public static List<ProductDTO> getSearchProduct(String productName, String categoryID) throws SQLException {

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ProductDTO> list = new ArrayList();
        try {

            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_SEARCH_PRODUCT);
            ptm.setString(1, "%" + productName + "%");
            ptm.setString(2, categoryID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getString("product_ID"), rs.getString("category_ID"), rs.getString("name"), rs.getString("image")));
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

    public static List<ProductDetailDTO> sortListProductDetailPriceUP(String categoryID, String productID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ProductDetailDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SORT_PRODUCT_DETAIL_PRICE_UP);
            ptm.setString(1, categoryID);
            ptm.setString(2, productID);

            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ProductDetailDTO(rs.getString("id"), rs.getString("provider_ID"), rs.getString("product_ID"), rs.getString("name"), rs.getInt("quantity"), rs.getDouble("price"), rs.getString("image"), rs.getString("description"), rs.getInt("status")));
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
    public static List<ProductDetailDTO> sortListProductDetailPriceDOWN(String categoryID, String productID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ProductDetailDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SORT_PRODUCT_DETAIL_PRICE_DOWN);
            ptm.setString(1, categoryID);
            ptm.setString(2, productID);

            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ProductDetailDTO(rs.getString("id"), rs.getString("provider_ID"), rs.getString("product_ID"), rs.getString("name"), rs.getInt("quantity"), rs.getDouble("price"), rs.getString("image"), rs.getString("description"), rs.getInt("status")));
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
    public static List<ProductDetailDTO> sortListProductDetailWordUP(String categoryID, String productID) throws SQLException {
       Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ProductDetailDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SORT_PRODUCT_DETAIL_WORD_UP);
            ptm.setString(1, categoryID);
            ptm.setString(2, productID);

            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ProductDetailDTO(rs.getString("id"), rs.getString("provider_ID"), rs.getString("product_ID"), rs.getString("name"), rs.getInt("quantity"), rs.getDouble("price"), rs.getString("image"), rs.getString("description"), rs.getInt("status")));
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
    public static List<ProductDetailDTO> sortListProductDetailWordDOWN(String categoryID, String productID) throws SQLException {
       Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<ProductDetailDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SORT_PRODUCT_DETAIL_WORD_UP);
            ptm.setString(1, categoryID);
            ptm.setString(2, productID);

            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ProductDetailDTO(rs.getString("id"), rs.getString("provider_ID"), rs.getString("product_ID"), rs.getString("name"), rs.getInt("quantity"), rs.getDouble("price"), rs.getString("image"), rs.getString("description"), rs.getInt("status")));
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
    
    public static List<ProductDTO> sortListProductCategoryWordUP(String categoryID) throws SQLException{
        List<ProductDTO> list = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SORT_PRODUCT_CATEGORY_WORD_UP);
            ptm.setString(1, categoryID);
             rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getString("product_ID"), rs.getString("category_ID"), rs.getString("name"), rs.getString("image")));
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
    public static List<ProductDTO> sortListProductCategoryWordDOWN(String categoryID) throws SQLException{
        List<ProductDTO> list = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SORT_PRODUCT_CATEGORY_WORD_DOWN);
            ptm.setString(1, categoryID);
             rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getString("product_ID"), rs.getString("category_ID"), rs.getString("name"), rs.getString("image")));
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
