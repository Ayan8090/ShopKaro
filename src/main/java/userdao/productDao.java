package userdao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entites.category;
import entites.product;

public class productDao {

	private SessionFactory factory;

	

	public productDao(SessionFactory factory) {
		this.factory = factory;
	}




	public boolean SaveProduct(product product) {
		boolean f=false;
		try {
		Session s=this.factory.openSession();
	    Transaction tx=	s.beginTransaction();
		s.save(product);
	    
		f=true;
		tx.commit();
			s.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			f=false;
		}
		
		return f;
	}
	public List<product> getProduct()
	{
		Session s = this.factory.openSession();
	Query query = s.createQuery("from product");
	 
	List<product> list = ((org.hibernate.Query) query).list();
		s.close();
		
		return list;
		}
	
/*	product by 10*/
	
	public List<product> getProductSE(int start ,int end)
	{
		Session s = this.factory.openSession();
	Query query = s.createQuery("from product");
	query.setFirstResult(start);
	query.setMaxResults(end);
	
	List<product> list = ((org.hibernate.Query) query).list();
		s.close();
		
		return list;
		}
	
	public product proByID(int id) {
		product  product =null;
		try {
			
			Session s = this.factory.openSession();
			product  = s.get(product.class, id);
			
			s.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return product;
	}

/*category by options*/
public List<product> getItemsByCate(int cid)
{
	Session s = this.factory.openSession();
Query query = s.createQuery("from product as p where p.category.catId =:id");
 query.setParameter("id",cid);
 List<product> list = ((org.hibernate.Query) query).list();
	s.close();
	
	return list;
	}

public boolean updateProduct(product product) {
	boolean f=false;
	try {
	Session s=this.factory.openSession();
    Transaction tx=	s.beginTransaction();
	s.update(product);
    
	f=true;
	tx.commit();
		s.close();
		
		
	} catch (Exception e) {
		e.printStackTrace();
		f=false;
	}
	
	return f;
}

public product upPro(int id) {
	product  product =null;
	try {
		
		Session s = this.factory.openSession();
		product  = s.get(product.class, id);
		
		s.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return product;
}
}
