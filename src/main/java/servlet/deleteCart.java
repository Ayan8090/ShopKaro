package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.omg.CORBA.ObjectHolder;

import entites.addCart;
import entites.massage;
import entites.product;
import helper.factroy;
import userdao.productDao;

/**
 * Servlet implementation class deleteCart
 */
public class deleteCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id").trim());
		
		
	
		Session session = factroy.gFactory().openSession();
	    Transaction tx = session.beginTransaction();
	    
	    addCart user = (addCart)session.get(addCart.class, id);
		
	    session.delete(user);
	    
	    tx.commit();

		session.close();
		
		massage  massage = new massage("Product Removed", "cart", "Dmsg");
		HttpSession se = request.getSession();
		se.setAttribute("msg", massage);
		
		response.sendRedirect("userProfile.jsp");
	}

	

}
