package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transaction;

import org.hibernate.Session;

import entites.massage;
import entites.product;
import helper.factroy;

/**
 * Servlet implementation class deleteProduct
 */
public class deleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {

		int proId = Integer.parseInt(request.getParameter("proid"));
	
		Session s = factroy.gFactory().openSession();
		 org.hibernate.Transaction tx = s.beginTransaction();
		
		 product pro = s.get(product.class, proId);
		
		s.delete(pro);
		
		tx.commit();
	   s.close();
	   massage massage = new massage("Remove Successfully", "Remove", "Dmsg");
	   HttpSession session = request.getSession();
	 session.setAttribute("msg", massage);
		
	   response.sendRedirect("adminProfile.jsp");
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
		
	}

	

}
