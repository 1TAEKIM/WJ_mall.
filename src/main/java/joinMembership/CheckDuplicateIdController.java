package joinMembership;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckDuplicateIdController")
public class CheckDuplicateIdController extends HttpServlet {
	
    private String jdbcDriver = "org.h2.Driver";
    private String jdbcUrl = "jdbc:h2:tcp://localhost/~/shopping_site"; 
    private String dbUsername = "shopping_site"; 
    private String dbPassword = "1234"; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        boolean isDuplicate = checkDuplicateId(id);

        PrintWriter out = response.getWriter();
        if (isDuplicate) {
            out.print("duplicate");
        } else {
            out.print("available");
        }
    }

    private boolean checkDuplicateId(String id) {
        try {
            Class.forName(jdbcDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
            String query = "SELECT COUNT(*) FROM Users WHERE ID = ?";
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
}
