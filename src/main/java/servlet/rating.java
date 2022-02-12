package servlet;

import java.io.IOException;

import javax.persistence.metamodel.SetAttribute;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entites.product;
import entites.ratings;
import helper.factroy;
import userdao.productDao;
import userdao.ratingDao;

/**
 * Servlet implementation class rating
 */
public class rating extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rating() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String rating = request.getParameter("rating");
			 
			 String name = request.getParameter("name");
			 String comment = request.getParameter("comment");
			 
			ratingDao ratingDao= new ratingDao(factroy.gFactory());
			
		
			
	 int productid = Integer.parseInt(request.getParameter("proid"));
		
		System.out.println("product id -------" +productid);
			
	 ratingDao dao = new ratingDao(factroy.gFactory());
	
	 ratings ratings = new ratings();
	
	ratings.setRatings(rating); 
	ratings.setusername(name);; 
	ratings.setComments(comment);
	ratings.setProduct(productid); 
	
	dao.saveRating(ratings);
	
	
	
	HttpSession session = request.getSession();
	session.setAttribute("id",productid);
			 
	
	System.out.println("new id"+productid);
	
	response.sendRedirect("ProView.jsp?id="+productid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
