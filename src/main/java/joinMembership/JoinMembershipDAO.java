package joinMembership;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class JoinMembershipDAO {
	
	private String jdbcDriver = "org.h2.Driver";
    private String jdbcUrl = "jdbc:h2:tcp://localhost/~/shopping_site"; // H2 데이터베이스 URL
    private String dbUsername = "shopping_site"; // H2 데이터베이스 사용자명
    private String dbPassword = "1234"; // H2 데이터베이스 비밀번호
    
   
    public boolean checkDuplicateId(String id) {
    	
    	try {
			Class.forName(jdbcDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
        try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
            String query = "SELECT COUNT(*) FROM users WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
    
    
    // 사용자 추가
    public void addUser(JoinMembership joinMembership) {
    	try {
			Class.forName(jdbcDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)){
            // SQL 쿼리 실행
            String query = "INSERT INTO Users (ID, password, Name, Address) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, joinMembership.getId());
            preparedStatement.setString(2, joinMembership.getPassword());
            preparedStatement.setString(3, joinMembership.getName());
            preparedStatement.setString(4, joinMembership.getAddress());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    
    

    // 사용자 인증
    public JoinMembership authenticate(String id, String password) {
    	JoinMembership user = null;

    	try {
			Class.forName(jdbcDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)){
            // SQL 쿼리 실행
            String query = "SELECT * FROM Users WHERE ID = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, id);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            // 결과 처리
            if (resultSet.next()) {
                String name = resultSet.getString("Name");
                String address = resultSet.getString("Address");

                // User 객체 생성
                user = new JoinMembership(id, password, name, address);
            }

            // 리소스 해제
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
}
