package productInfo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ProductController")
@MultipartConfig(maxFileSize = 1024 * 1024 * 2, location = "c:/Temp/picture")
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProductDAO productDAO;
    private ServletContext ctx;

    // 웹 리소스 기본 경로 지정
    private final String START_PAGE = "../views/productReg.jsp";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        productDAO = new ProductDAO();
        ctx = getServletContext();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        productDAO = new ProductDAO();

        Method m;
        String view = null;

        if (action == null) {
            action = "listProducts";
        }

        try {
            m = this.getClass().getMethod(action, HttpServletRequest.class);
            view = (String) m.invoke(this, request);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
            ctx.log("요청 action 없음!!");
            request.setAttribute("error", "action 파라미터가 잘못되었습니다!!");
            view = START_PAGE;
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (view != null && view.startsWith("redirect:/")) {
            String rview = view.substring("redirect:/".length());
            response.sendRedirect(request.getContextPath() + rview);
        } else {
            if (view != null) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/views/" + view);  // 경로 수정
                if (dispatcher != null) {
                    dispatcher.forward(request, response);
                } else {
                    throw new ServletException("Dispatcher is null");
                }
            } else {
                throw new ServletException("View is null");
            }
        }
    }
    public String addProduct(HttpServletRequest request) throws ServletException, IOException {
        Product product = new Product();
        
        // DB 연동시 한글 깨짐 문제 해결 코드 
     	request.setCharacterEncoding("UTF-8"); // JSP 페이지에서

        try {
            // 이미지 파일 저장
            Part part = request.getPart("file");
            String fileName = getFilename(part);
            if (fileName != null && !fileName.isEmpty()) {
                part.write(fileName);
            }

            // 입력값을 Product 객체로 매핑
            BeanUtils.populate(product, request.getParameterMap());

            // 이미지 파일 이름을 Product 객체에도 저장
            product.setImageUrl("/picture/" + fileName);

            // 상품 정보를 데이터베이스에 저장
            productDAO.addProduct(product);
        } catch (Exception e) {
            e.printStackTrace();
            ctx.log("상품 추가 과정에서 문제 발생!!");
            request.setAttribute("error", "상품이 정상적으로 등록되지 않았습니다!!");
            return listProducts(request);
        }
        return "redirect:/ProductController?action=listProducts";
    }


    public String listProducts(HttpServletRequest request) {
    	
        List<Product> list;
        try {
            list = productDAO.getAllProducts();
            request.setAttribute("productsList", list);
            return "../views/addProduct.jsp"; // 상품 리스트 페이지 경로로 수정
        } catch (Exception e) {
            e.printStackTrace();
            ctx.log("상품 목록 생성 과정에서 문제 발생!!");
            request.setAttribute("error", "상품 목록이 정상적으로 처리되지 않았습니다!!");
            return "../views/main.jsp"; // 에러 페이지 경로로 수정
        }
    }

    public String getProduct(HttpServletRequest request) {
    	
        int product_num = Integer.parseInt(request.getParameter("product_num"));
        try {
            Product product = productDAO.getProduct(product_num);
            request.setAttribute("product", product);
            return "../views/productDetail.jsp"; // 상품 상세 페이지 경로로 수정
        } catch (SQLException e) {
            e.printStackTrace();
            ctx.log("상품을 가져오는 과정에서 문제 발생!!");
            request.setAttribute("error", "상품을 정상적으로 가져오지 못했습니다!!");
            
        }
        return "../views/addProduct.jsp"; // 상품 리스트 페이지 경로로 수정
    }

    
    
    
    
    
    
    public String updateProduct(HttpServletRequest request) {
        int product_num = Integer.parseInt(request.getParameter("product_num"));
        try {
            // 기존의 상품 정보를 가져옴
            Product product = productDAO.getProduct(product_num);
            
            // 폼에서 입력받은 새로운 상품 속성 값을 가져와서 업데이트
            String name = request.getParameter("name");
            int price = Integer.parseInt(request.getParameter("price"));
            

            product.setName(name);
            product.setPrice(price);
            
            

            // 상품 정보를 업데이트
            productDAO.updateProduct(product);
            
            return "../views/product_mage.jsp"; // 상품 상세 페이지 경로로 수정
            
            
            // return "redirect:/ProductController?action=listProducts"; // 상품 목록으로 리다이렉트
        } catch (SQLException e) {
            e.printStackTrace();
            ctx.log("상품 업데이트 과정에서 문제 발생!!");
            request.setAttribute("error", "상품이 정상적으로 업데이트되지 않았습니다!!");
            return listProducts(request);
        }
    }

    public String deleteProduct(HttpServletRequest request) {
        int product_num = Integer.parseInt(request.getParameter("product_num"));
        try {
            // 상품 삭제
            productDAO.deleteProduct(product_num);
            
            return "../views/product_mage.jsp"; // 상품 상세 페이지 경로로 수정
            
            //return "redirect:/ProductController?action=listProducts"; // 상품 목록으로 리다이렉트
        } catch (SQLException e) {
            e.printStackTrace();
            ctx.log("상품 삭제 과정에서 문제 발생!!");
            request.setAttribute("error", "상품이 정상적으로 삭제되지 않았습니다!!");
            return listProducts(request);
        }
    }
    
    
    
    
    public String purchaseProduct(HttpServletRequest request) {
        int productNum = Integer.parseInt(request.getParameter("productNum"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try {
            Product product = productDAO.getProduct(productNum);
            int availableQuantity = product.getQuantity();

            if (availableQuantity >= quantity) {
                // 재고가 충분한 경우, 상품 수량 감소 처리
                productDAO.updateProductQuantity(productNum, availableQuantity - quantity);
                request.setAttribute("message", "구매가 완료되었습니다.");
            } else {
                // 재고가 부족한 경우, 에러 메시지 설정
                request.setAttribute("error", "수량이 부족합니다.");
            }

            // 상품 상세 페이지로 이동
            return "productDetail.jsp"; // 상품 상세 페이지 경로로 수정
            
        } catch (SQLException e) {
            e.printStackTrace();
            ctx.log("상품 구매 과정에서 문제 발생!!");
            request.setAttribute("error", "상품 구매 중 오류가 발생했습니다.");
            return "error.jsp"; // 오류 페이지 경로로 수정
        }
    }
    
    
    
    
    
    

    private String getFilename(Part part) {
        String fileName = null;
        // 파일 이름이 들어 있는 헤더 영역을 가져옴
        String header = part.getHeader("content-disposition");
        System.out.println("Header =>" + header);

        // 파일 이름이 들어 있는 속성 부분의 시작 위치를 가져와 " " 사이의 값만 가지고 옴
        int start = header.indexOf("filename=");
        fileName = header.substring(start + 10, header.length() - 1);
        ctx.log("파일명:" + fileName);
        return fileName;
    }
}