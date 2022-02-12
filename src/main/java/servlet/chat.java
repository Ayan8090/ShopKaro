package servlet;

import java.io.IOException;

import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import helper.factroy;



/**
 * Servlet implementation class chat
 */
public class chat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public chat() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			
			String chat = request.getParameter("chat");
			
	   entites.chat chat2 = new entites.chat(chat,new Date());
			
	   Session session = factroy.gFactory().openSession();
	   Transaction tx = session.beginTransaction();
	   
	   session.save(chat2);
	   
	   tx.commit();
	   session.close();
	   
	    response.sendRedirect("userProfile.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
