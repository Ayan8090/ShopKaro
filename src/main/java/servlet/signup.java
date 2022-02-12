package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import entites.massage;
import entites.user;
import helper.factroy;

/**
 * Servlet implementation class signup
 */
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password= request.getParameter("password");
		String phone = request.getParameter("phone");
		String city = request.getParameter("city");
		
	Session s = factroy.gFactory().openSession();
	Transaction tx = s.beginTransaction();
	
	
	user u = new user(name, email, password, phone, city,"Normal","default.jpg", null);
	s.save(u);
	
	tx.commit();
	s.clear();
	
	massage msg = new massage("Welcome You have Resgisterd...","login error", "Smsg");
	
	HttpSession session = request.getSession();
    session.setAttribute("msg", msg);  
	
	response.sendRedirect("Homepage.jsp");
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
		
	}

}
