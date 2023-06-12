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
    	
    	request.setCharacterEncoding("UTF-8");
        // JSP 페이지에서 전달된 데이터 가져오기
    	String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        
        // JoinMembership 객체 생성
//        JoinMembership joinmembership = new JoinMembership(id, password, name, address);
//        joinmembership.setId(id);
//        joinmembership.setPassword(password);
//        joinmembership.setName(name);
//        joinmembership.setAddress(address);
//        
//        //DAO를 사용하여 데이터베이스에 회원 추가 
//        joinMembershipDAO.addUser(joinmembership);
		
        
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
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        JoinMembership user = joinMembershipDAO.authenticate(id, password);

        if (user != null) {
            if (user.getPermission().equals("true")) {
                response.sendRedirect("../views/admin_main.jsp");
            } else {
                request.getSession().setAttribute("user", user);
                response.sendRedirect("../views/main.jsp");
            }
        } else {
            response.sendRedirect("../views/login.jsp");
        }
    }

}