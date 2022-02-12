package servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import entites.user;
import helper.factroy;
import helper.saveImage;

/**
 * Servlet implementation class UpdateProduct
 */
@MultipartConfig
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String name = request.getParameter("Ename");
			String email = request.getParameter("Eemail");
			String password= request.getParameter("Epassword");
			String phone = request.getParameter("Ephone");
			String city = request.getParameter("Ecity");
			Part part=request.getPart("profile");
			String photo = part.getSubmittedFileName();
			
			
		HttpSession session = request.getSession();
		  user  user=	(user)session.getAttribute("user");
			
			user.setName(name);
			user.setEmail(email);
			user.setPassword(password);
		   user.setPhone(phone);
		   user.setCity(city);
		   user.setProfile(photo);
		 
			Session s = factroy.gFactory().openSession();
			Transaction tx = s.beginTransaction();
			
			  
	      String path = request.getRealPath("/")+"userpic"+File.separator+user.getProfile();
		 saveImage.deletepi(path);
		 
		 System.out.println("delete path"+path);
		 
		 saveImage.savepic(part.getInputStream(), path);
			   
		 System.out.println("save path"+path);
			
			s.update(user);
			
			tx.commit();
			s.close();
			
			response.sendRedirect("userProfile.jsp");
			System.out.println("update sucess");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		}
		
		
	}


