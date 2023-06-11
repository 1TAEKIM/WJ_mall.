package productInfo;

import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ProductDAO {
	private String jdbcDriver = "org.h2.Driver";
    private String jdbcUrl = "jdbc:h2:tcp://localhost/~/shopping_site"; // H2 데이터베이스 URL
    private String dbUsername = "shopping_site"; // H2 데이터베이스 사용자명
    private String dbPassword = "1234"; // H2 데이터베이스 비밀번호
    
    public Connection open() {
    	Connection conn = null;
    	try {
    		Class.forName(jdbcDriver);
    		conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return conn;
    }
    
    public void addProduct(Product product) throws Exception {
        Connection conn = open();
        
        String sql = "INSERT INTO products (category, name, price, description, quantity, imageUrl) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        
        try (conn; pstmt) {
            pstmt.setString(1, product.getCategory());
            pstmt.setString(2, product.getName());
            pstmt.setInt(3, product.getPrice());
            pstmt.setString(4, product.getDescription());
            pstmt.setInt(5, product.getQuantity());
            pstmt.setString(6, product.getImageUrl());
            
            pstmt.executeUpdate(); // 데이터베이스에 데이터를 삽입
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pstmt.close();
            conn.close();
        }
    }
    
    public Product getProduct(int product_num) throws SQLException{
    	Connection conn = open();
    	
    	Product product = new Product();
    	String sql = "SELELT * FROM products where product_num=?";
    	
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	pstmt.setInt(1, product_num);
    	ResultSet rs = pstmt.executeQuery();
    	
    	rs.next();
    	
    	try(conn; pstmt){
    		pstmt.setString(1, product.getCategory());
    		pstmt.setString(2, product.getName());
    		pstmt.setInt(3, product.getPrice());
    		pstmt.setString(4, product.getDescription());
    		pstmt.setInt(5, product.getQuantity());
    		pstmt.setString(6, product.getImageUrl());
    		pstmt.executeQuery();
    		return product;
    	}
    }
    
    
    public List<Product> getAllProducts() throws Exception {
    	Connection conn = open();
    	List<Product> productList = new ArrayList<>();
    	
    	String sql = "SELECT * FROM products";
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	ResultSet rs = pstmt.executeQuery();
    	
    	try(conn; pstmt; rs){
    		while(rs.next()) {
    			Product product = new Product();
    			product.setProductNum(rs.getInt("product_num"));
    			product.setCategory(rs.getString("category"));
    			product.setName(rs.getString("name"));
    			product.setPrice(rs.getInt("price"));
    			product.setDescription(rs.getString("description"));
    			product.setQuantity(rs.getInt("quantity"));
    			product.setImageUrl(rs.getString("imageUrl"));
    			
    			productList.add(product);
    		}
    		return productList;
    	}
    }
    
    
    public List<Product> getAllProductsByCategory(String category) throws Exception {
        Connection conn = open();
        List<Product> productList = new ArrayList<>();

        String sql = "SELECT * FROM products WHERE category=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, category);
        ResultSet rs = pstmt.executeQuery();

        try (conn; pstmt; rs) {
            while (rs.next()) {
                Product product = new Product();
                product.setProductNum(rs.getInt("product_num"));
                product.setCategory(rs.getString("category"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getInt("price"));
                product.setDescription(rs.getString("description"));
                product.setQuantity(rs.getInt("quantity"));
                product.setImageUrl(rs.getString("imageUrl"));

                productList.add(product);
            }
            return productList;
        }
    }
    	
     public void delProduct(int product_num) throws SQLException{
    	 
    	 Connection conn = open();
    	 String sql = "DELELT FROM products where product_num=?";
    	 PreparedStatement pstmt = conn.prepareStatement(sql);
    	 
    	 try(conn; pstmt){
    		 pstmt.setInt(1, product_num);
    		 if(pstmt.executeUpdate() == 0) {
    			 throw new SQLException("DB에러");
    		 }
    	 }
    	 
     }
}
