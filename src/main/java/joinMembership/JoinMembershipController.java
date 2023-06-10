package joinMembership;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        // JSP 페이지에서 전달된 데이터 가져오기
    	String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        
        // JoinMembership 객체 생성
        JoinMembership joinmembership = new JoinMembership(id, password, name, address);
        joinmembership.setId(id);
        joinmembership.setPassword(password);
        joinmembership.setName(name);
        joinmembership.setAddress(address);
        
        // DAO를 사용하여 데이터베이스에 회원 추가
        joinMembershipDAO.addUser(joinmembership);
        
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        JoinMembership user = joinMembershipDAO.authenticate(id, password);

        if (user != null) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("../views/main.jsp");
        } else {
            response.sendRedirect("../views/login.jsp");
        }
    }
	/*
	 * private void addUser(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { String id =
	 * request.getParameter("id"); String password =
	 * request.getParameter("password"); String name = request.getParameter("name");
	 * String address = request.getParameter("address");
	 * 
	 * JoinMembership user = new JoinMembership(id, password, name, address);
	 * joinMembershipDao.addUser(user);
	 * 
	 * response.sendRedirect("success.jsp"); }
	 */
	/*
	 * private void getAllUsers(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { List<JoinMembership>
	 * userList = userDao.getAllUsers(); request.setAttribute("userList", userList);
	 * 
	 * request.getRequestDispatcher("userList.jsp").forward(request, response); }
	 */
}