package Controller;



import java.util.Iterator;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import Model.Customer;

public class CustomerControl {

	SessionFactory sf;
	Session ss;
	Transaction tr;
	public void insert(Customer obj) {
		sf = GetSession.getconnection();
		ss = sf.openSession();
		tr = ss.beginTransaction();
		ss.save(obj);
		tr.commit();
		ss.close();
		sf.close();
		
	}
	
	public void update(Customer obj) {
		sf = GetSession.getconnection();
		ss = sf.openSession();
		tr = ss.beginTransaction();
		ss.update(obj);
		tr.commit();
		ss.close();
		sf.close();
		
	}
	
	public void delete(Customer obj) {
		
		sf = GetSession.getconnection();
		ss = sf.openSession();
		tr = ss.beginTransaction();
		ss.delete(obj);
		tr.commit();
		ss.close();
		sf.close();
	}
	
	public Customer select(int id) {
		Customer obj=null;
		sf = GetSession.getconnection();
		ss = sf.openSession();
		Criteria cr = ss.createCriteria(Customer.class);
		cr.add(Restrictions.eq("id", id));
		Iterator<Customer> itr = cr.list().iterator();
		ss.close();
		sf.close();
		
		if(itr.hasNext()) {
			obj = itr.next();
			return obj;
		}
		return obj;
		
	}
	
	
	
	public Iterator<Customer> selectall() {
		Iterator<Customer> itr = null;
		sf = GetSession.getconnection();
		ss = sf.openSession();
		Criteria cr = ss.createCriteria(Customer.class);
		itr = cr.list().iterator();
		ss.close();
		sf.close();
		return itr;
	}
	
	
}
