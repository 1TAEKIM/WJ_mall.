package joinMembership;

import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class JoinMembershipDAO {

    private String jdbcDriver = "org.h2.Driver";
    private String jdbcUrl = "jdbc:h2:tcp://localhost/~/shopping_site";
    private String dbUsername = "shopping_site";
    private String dbPassword = "1234";

    public boolean checkDuplicateId(String id) {
        try {
            Class.forName(jdbcDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
            String query = "SELECT COUNT(*) FROM Users WHERE id = ?";
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

    public void addUser(JoinMembership joinMembership) {
        try {
            Class.forName(jdbcDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
            String query = "INSERT INTO Users (ID, password, Name, Address, Permission) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, joinMembership.getId());
            preparedStatement.setString(2, joinMembership.getPassword());
            preparedStatement.setString(3, joinMembership.getName());
            preparedStatement.setString(4, joinMembership.getAddress());
            preparedStatement.setString(5, "false");
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public JoinMembership authenticate(String id, String password) {
        JoinMembership user = null;

        try {
            Class.forName(jdbcDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
            String query = "SELECT * FROM Users WHERE ID = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, id);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String name = resultSet.getString("Name");
                String address = resultSet.getString("Address");
                String permission = resultSet.getString("Permission");

                user = new JoinMembership(id, password, name, address, permission);
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
    
    
    // 모든 사용자 조회
    public List<JoinMembership> getAllUsers() {
        List<JoinMembership> userList = new ArrayList<>();

        try {
            Class.forName(jdbcDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
            String query = "SELECT * FROM Users";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String id = resultSet.getString("ID");
                String password = resultSet.getString("password");
                String name = resultSet.getString("Name");
                String address = resultSet.getString("Address");
                String permission = resultSet.getString("Permission");

                JoinMembership user = new JoinMembership(id, password, name, address, permission);
                userList.add(user);
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }
    
    
    

    public void updatePermission(String id, String permission) {
        try {
            Class.forName(jdbcDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
            String query = "UPDATE Users SET Permission = ? WHERE ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, permission);
            preparedStatement.setString(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    
    
    
    public JoinMembership findUserByNameAndPassword(String name, String password) {
        JoinMembership user = null;

        try {
            Class.forName(jdbcDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
            String query = "SELECT * FROM Users WHERE Name = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String id = resultSet.getString("ID");
                String address = resultSet.getString("Address");
                String permission = resultSet.getString("Permission");

                user = new JoinMembership(id, password, name, address, permission);
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
    

    
    
    
    public JoinMembership findUserById(String id) {
        JoinMembership user = null;

        try {
            Class.forName(jdbcDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
            String query = "SELECT * FROM Users WHERE ID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String password = resultSet.getString("password");
                String name = resultSet.getString("Name");
                String address = resultSet.getString("Address");
                String permission = resultSet.getString("Permission");

                user = new JoinMembership(id, password, name, address, permission);
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
    
    
    
}
