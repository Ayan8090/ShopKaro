package userdao;

import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entites.category;



public class categroyDao {

	
	private SessionFactory factory;


	public categroyDao(SessionFactory factory) {
		this.factory = factory;
	}

	/* save category */
public int saveCat(category cat) {
	
		
	Session session = this.factory.openSession();
	Transaction tx = session.beginTransaction();
	 
	int catId= (Integer) session.save(cat);
	
	tx.commit();
	session.close();
	return catId;
	
	
	}

/*category list*/
public List<category> getcate()
{
	Session s = this.factory.openSession();
Query query = s.createQuery("from category");
 
List<category> list = query.list();
	s.close();
	
	return list;
	}

/*category by id*/
public category getCateId(int id) {
	category category = null;
	try {
		Session s = this.factory.openSession();
		category = s.get(category.class, id);
		
		s.close();
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	return category;
	
}
public category SearchCate(String name) {
	category category = null;
	try {
		String query = "from category where description like : e";
		Session session =	this.factory.openSession();
		Query q =session.createQuery(query);
		q.setParameter("e","%"+name+"%");
	
		category=(category)((org.hibernate.Query) q).uniqueResult();
		
		session.close();
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}

	return category;
}
}