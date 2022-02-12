package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import entites.addCart;
import entites.massage;
import entites.user;
import helper.factroy;
import userdao.userdao;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String email =request.getParameter("uemail");
			String password=request.getParameter("upassword");

			
			userdao userdao = new userdao(factroy.gFactory());
			
			
			user  u = userdao.getUser(email, password);
		
		
			if (u==null) {
				
				massage massage1 = new massage("Login Failed Invalid Deatails Try Again...","Login error", "Dmsg");
				
				HttpSession session = request.getSession();
				session.setAttribute("msg", massage1);
				
				response.sendRedirect("Homepage.jsp");
				
			} else {

		
			
			if (u.getUserType().equals("Admin")) {
				
				
				HttpSession session1 = request.getSession();
				session1.setAttribute("admin", u);
				
				
				massage massage = new massage("Your Are Successfully Login Admin page.","Login error", "Smsg");
				
				HttpSession session2 = request.getSession();
				session2.setAttribute("msg", massage);
				
				response.sendRedirect("adminProfile.jsp");
				
			} else if (u.getUserType().equals("Normal")) {
				

				HttpSession session = request.getSession();
				session.setAttribute("user", u);
				
				massage massage = new massage("Your Are Successfully Login.","Login error", "Smsg text-center");
				
				HttpSession session2 = request.getSession();
				session2.setAttribute("msg", massage);
				
				response.sendRedirect("userProfile.jsp");
			}else {
				
				massage massage = new massage("You are Not a user","Login error", "Dmsg text-center");
				
				HttpSession session2 = request.getSession();
				session2.setAttribute("msg", massage);
				
				response.sendRedirect("Homepage.jsp");
				
				
			}
			
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
