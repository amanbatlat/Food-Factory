package Controller;



import java.util.Iterator;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import Model.Payment;
public class PaymentControl {

	SessionFactory sf;
	Session ss;
	Transaction tr;
	public void insert(Payment obj) {
		sf = GetSession.getconnection();
		ss = sf.openSession();
		tr = ss.beginTransaction();
		ss.save(obj);
		tr.commit();
		ss.close();
		sf.close();
		
	}
	
	public void update(Payment obj) {
		sf = GetSession.getconnection();
		ss = sf.openSession();
		tr = ss.beginTransaction();
		ss.update(obj);
		tr.commit();
		ss.close();
		sf.close();
		
	}
	
	public void Delete(Payment obj) {
		
		sf = GetSession.getconnection();
		ss = sf.openSession();
		tr = ss.beginTransaction();
		ss.delete(obj);
		tr.commit();
		ss.close();
		sf.close();
	}
	
	public Payment select(int id) {
		Payment obj=null;
		sf = GetSession.getconnection();
		ss = sf.openSession();
		Criteria cr = ss.createCriteria(Payment.class);
		cr.add(Restrictions.eq("id", id));
		Iterator<Payment> itr = cr.list().iterator();
		ss.close();
		sf.close();
		
		if(itr.hasNext()) {
			obj = itr.next();
			return obj;
		}
		return obj;
		
	}
	
	
	
	public Iterator<Payment> selectall() {
		Iterator<Payment> itr = null;
		sf = GetSession.getconnection();
		ss = sf.openSession();
		Criteria cr = ss.createCriteria(Payment.class);
		itr = cr.list().iterator();
		ss.close();
		sf.close();
		return itr;
	}

	
	
	
}
