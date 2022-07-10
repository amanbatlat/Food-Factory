package Controller;



import java.util.Iterator;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import Model.Cart;

public class CartControl {

	SessionFactory sf;
	Session ss;
	Transaction tr;
	public void insert(Cart obj) {
		sf = GetSession.getconnection();
		ss = sf.openSession();
		tr = ss.beginTransaction();
		ss.save(obj);
		tr.commit();
		ss.close();
		sf.close();
		
	}
	
	public void update(Cart obj) {
		sf = GetSession.getconnection();
		ss = sf.openSession();
		tr = ss.beginTransaction();
		ss.update(obj);
		tr.commit();
		ss.close();
		sf.close();
		
	}
	
	public void Delete(Cart obj) {
		
		sf = GetSession.getconnection();
		ss = sf.openSession();
		tr = ss.beginTransaction();
		ss.delete(obj);
		tr.commit();
		ss.close();
		sf.close();
	}
	
	public Cart select(int id) {
		Cart obj=null;
		sf = GetSession.getconnection();
		ss = sf.openSession();
		Criteria cr = ss.createCriteria(Cart.class);
		cr.add(Restrictions.eq("id", id));
		Iterator<Cart> itr = cr.list().iterator();
		ss.close();
		sf.close();
		
		if(itr.hasNext()) {
			obj = itr.next();
			return obj;
		}
		return obj;
		
	}
	
	
	
	public Iterator<Cart> selectall() {
		Iterator<Cart> itr = null;
		sf = GetSession.getconnection();
		ss = sf.openSession();
		Criteria cr = ss.createCriteria(Cart.class);
		itr = cr.list().iterator();
		ss.close();
		sf.close();
		return itr;
	}
	
	
}
