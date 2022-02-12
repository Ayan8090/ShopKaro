package userdao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import entites.addCart;



public class cartDao {


	private SessionFactory factory;


	public cartDao(SessionFactory factory) {
		this.factory = factory;
	}

/*category list*/
public List<addCart> getCartItem()
{
	Session s = this.factory.openSession();
Query query = s.createQuery("from addCart");
 
List<addCart> list = ((org.hibernate.Query) query).list();
	s.close();
	
	return list;
	}

public addCart itemByid(int id) {
	addCart addCart =null;
	try {	
		Session session = this.factory.openSession();
		Query query = session.createQuery("from addCart where proid =: s");
	      query.setParameter("s", id);
			
	     List<addCart> list = query.list();
			session.close();
			
		
			 session.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return addCart;
}
public addCart cartbyUSerID(int userid){
	
addCart addCart = null;
try {
	
		Session session = this.factory.openSession();
      Query query = session.createQuery("from addCart where userId =: s");
      query.setParameter("s", userid);
		
     List<addCart> list = query.list();
		session.close();
		
} catch (Exception e) {
	e.printStackTrace();
}
	
	return addCart;
	
}

public List<addCart> OnlycartbyId(int userid){

	Session session = this.factory.openSession();
  Query query = session.createQuery("from addCart where userId =: s");
  query.setParameter("s", userid);
	
  List<addCart> addcart = query.list();
	session.close();
	
	

return addcart;


}
}
