package Model;

import javax.persistence.Entity;
import javax.persistence.*;

@Entity
public class Customer {

	@Id
	@GeneratedValue
	private int Customer_id;
	String NAME;
	String EMAIL;
	String ADDRESS;
	String CONTACT;
	String PASSWORD;
	
	
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Customer(int customer_id, String nAME, String eMAIL, String aDDRESS, String cONTACT, String pASSWORD) {
		super();
		Customer_id = customer_id;
		NAME = nAME;
		EMAIL = eMAIL;
		ADDRESS = aDDRESS;
		CONTACT = cONTACT;
		PASSWORD = pASSWORD;
	}
	
	public int getCustomer_id() {
		return Customer_id;
	}
	public void setCustomer_id(int customer_id) {
		Customer_id = customer_id;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getCONTACT() {
		return CONTACT;
	}
	public void setCONTACT(String cONTACT) {
		CONTACT = cONTACT;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	
	
}
