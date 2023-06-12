package joinMembership;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FindIdController")
public class FindIdController extends HttpServlet {
    private JoinMembershipDAO joinMembershipDAO;

    public void init() {
        joinMembershipDAO = new JoinMembershipDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    	request.setCharacterEncoding("UTF-8");
    	String name = request.getParameter("name");
        String password = request.getParameter("password");

        JoinMembership user = joinMembershipDAO.findUserByNameAndPassword(name, password);

        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("/views/display_id.jsp").forward(request, response);
        } else {
            String message = "입력하신 정보가 없습니다!";
            request.setAttribute("message", message);
            request.getRequestDispatcher("/views/find_id.jsp").forward(request, response);
        }
    }
}
