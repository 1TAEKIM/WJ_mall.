package joinMembership;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FindPwController")
public class FindPwController extends HttpServlet {
    private JoinMembershipDAO joinMembershipDAO;

    public void init() {
        joinMembershipDAO = new JoinMembershipDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");

        JoinMembership user = joinMembershipDAO.findUserById(id);

        if (user != null) {
            request.setAttribute("id", user.getId());
            request.setAttribute("password", user.getPassword());
        } else {
            String message = "입력하신 아이디가 존재하지 않습니다!";
            request.setAttribute("message", message);
        }
        
        request.getRequestDispatcher("/views/display_pw.jsp").forward(request, response);
    }
}
