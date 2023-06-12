package joinMembership;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdatePermissionController")
public class UpdatePermissionController extends HttpServlet {
    private JoinMembershipDAO joinMembershipDAO;

    public void init() {
        joinMembershipDAO = new JoinMembershipDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	
    	String id = request.getParameter("id");
        String permission = request.getParameter("permission");

        joinMembershipDAO.updatePermission(id, permission);

        response.sendRedirect("../views/admin_main.jsp");
    }
}