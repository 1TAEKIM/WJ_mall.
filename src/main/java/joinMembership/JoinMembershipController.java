package joinMembership;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/JoinMembershipController")
public class JoinMembershipController extends HttpServlet {
    private JoinMembershipDAO joinMembershipDAO;

    public void init() {
        joinMembershipDAO = new JoinMembershipDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        // JSP 페이지에서 전달된 데이터 가져오기
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String permission = request.getParameter("permission");

        // Check for duplicate ID
        boolean isDuplicate = joinMembershipDAO.checkDuplicateId(id);

        if (isDuplicate) {
            // Redirect back to the registration page with an error message
            response.sendRedirect("../views/joinMembership.jsp?error=duplicate");
        } else {
            // Create JoinMembership object
            JoinMembership joinmembership = new JoinMembership(id, password, name, address, "false");
            joinmembership.setId(id);
            joinmembership.setPassword(password);
            joinmembership.setName(name);
            joinmembership.setAddress(address);

            // Add user to the database
            joinMembershipDAO.addUser(joinmembership);

            // Redirect to a success page
            response.sendRedirect("../views/login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	String id = request.getParameter("id");
        String password = request.getParameter("password");

        JoinMembership user = joinMembershipDAO.authenticate(id, password);

        if (user != null) {
            if (user.getPermission().equals("true")) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("../views/main.jsp");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("../views/main.jsp");
            }
        } else {
            response.sendRedirect("../views/login.jsp");
        }
    }
    
    
    
    
    protected void doLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        session.invalidate();
        response.sendRedirect("../views/main.jsp");
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String logout = request.getParameter("logout");
        if (logout != null && logout.equals("true")) {
            doLogout(request, response);
            return; // 작업을 완료하고 다른 페이지로 이동했으므로 return문을 추가하여 메서드 실행을 종료합니다.
        }
        super.service(request, response);
    }

    
    
    

	/*
	 * protected void doLogout(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * request.setCharacterEncoding("UTF-8"); HttpSession session =
	 * request.getSession(); session.removeAttribute("user"); session.invalidate();
	 * response.sendRedirect("../views/main.jsp"); }
	 * 
	 * protected void service(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * request.setCharacterEncoding("UTF-8"); String logout =
	 * request.getParameter("logout"); if (logout != null && logout.equals("true"))
	 * { doLogout(request, response); } else { super.service(request, response); } }
	 */
}
