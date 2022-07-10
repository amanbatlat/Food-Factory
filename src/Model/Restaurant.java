package Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Restaurant {

	@Id
	@GeneratedValue
	private int Id;
	
	@Column(unique=true)
	String NAME;
	
	String EMAIL;
	String CONTACT;

	String RPASSWORD;
	
	public Restaurant() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Restaurant(int id, String nAME, String eMAIL, String cONTACT, String pASSWORD) {
		super();
		Id = id;
		NAME = nAME;
		EMAIL = eMAIL;
		CONTACT = cONTACT;
		RPASSWORD = pASSWORD;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
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
	public String getCONTACT() {
		return CONTACT;
	}
	public void setCONTACT(String cONTACT) {
		CONTACT = cONTACT;
	}
	public String getRPASSWORD() {
		return RPASSWORD;
	}
	public void setRPASSWORD(String pASSWORD) {
		RPASSWORD = pASSWORD;
	}
	
}
