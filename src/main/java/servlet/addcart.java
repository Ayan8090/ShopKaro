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
import entites.product;
import entites.user;
import helper.factroy;
import userdao.cartDao;
import userdao.productDao;

/**
 * Servlet implementation class addcart
 */
public class addcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public addcart() {
        super();
        // TODO Auto-generated constructor stub
    }

   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
try {
	


/*	Check userlogin or not*/
	
	HttpSession session = request.getSession();
	user  userid = (user) session.getAttribute("user");
	
	int id = Integer.parseInt(request.getParameter("id"));
	
	if(userid==null) {

		massage  massage = new massage("Login First", "cart", "Dmsg");
		HttpSession session3 = request.getSession();
		session3.setAttribute("msg", massage);
		
		response.sendRedirect("ProView.jsp?id="+id);
	}
	

	
	
	
	
  /*Item by id*/
	cartDao da = new cartDao(factroy.gFactory());


/*Item by id*/

productDao prodao= new productDao(factroy.gFactory());

product pro = prodao.proByID(id);

addCart cart1 = da.itemByid(id);

System.out.println("userrrrrrrrrrrrrrrrrrrrrrr-------"+cart1);

if (cart1==null) {
	
	 	 /*savacart*/
		addCart cart = new addCart();

		System.out.print(cart);

		cart.setProid(pro.getId());
		cart.setName(pro.getName());
		cart.setDes(pro.getDes());
		cart.setQunitity(1);
		cart.setPrice(pro.getPrice());
		cart.setUserId(userid.getId());

		System.out.print(cart);

		Session s = factroy.gFactory().openSession();
		Transaction tx2 = s.beginTransaction();

		s.save(cart);

		System.out.print("cart is save"+cart);

		massage  massage = new massage("Product added To Your Cart", "cart", "Smsg");
		HttpSession session3 = request.getSession();
		session3.setAttribute("msg", massage);

		System.out.println("cart save");
		response.sendRedirect("userProfile.jsp");

		tx2.commit();
		s.close();
		
		
}
else if (cart1.getProid()==pro.getId()) {
			
			System.out.println("this product alrdy added");

			addCart user = (addCart) da.cartbyUSerID(cart1.getUserId());
			
			if (user==null) {
				
				System.out.println("user is null-----");
				
				 /*savacart*/
				addCart cart = new addCart();

				System.out.print(cart);

				cart.setProid(pro.getId());
				cart.setName(pro.getName());
				cart.setDes(pro.getDes());
				cart.setQunitity(1);
				cart.setPrice(pro.getPrice());
				cart.setUserId(userid.getId());

				System.out.print(cart);

				Session s = factroy.gFactory().openSession();
				Transaction tx2 = s.beginTransaction();

				s.save(cart);

				System.out.print("cart is save"+cart);

				massage  massage = new massage("Product added To Your Cart", "cart", "Smsg");
				HttpSession session3 = request.getSession();
				session3.setAttribute("msg", massage);

				System.out.println("cart save");
				response.sendRedirect("userProfile.jsp");

				tx2.commit();
				s.close();
				
				

			}else {

		  addCart user1 = (addCart) da.OnlycartbyId(cart1.getUserId());
				
			Session sessi = factroy.gFactory().openSession();
			Transaction tx = sessi.beginTransaction();
				 
			
			user1.setQunitity(user1.getQunitity()+1);

			sessi.update(user1);
					
			tx.commit();
			sessi.close();
				

			massage  massag = new massage("Add One More", "cart", "Smsg");
			HttpSession session4 = request.getSession();
			session4.setAttribute("msg", massag);

			System.out.println("cart qunity update");

			response.sendRedirect("userProfile.jsp");
			}
		}
		

} catch (Exception e) {
	e.printStackTrace();
}
}
	}

	
	

	
