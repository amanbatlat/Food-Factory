package Model;

import javax.persistence.*;

@Entity
public class Credit
{

	@Id
	@GeneratedValue
	private int CreditId;
	String HOLDERNAME;
	String CARDNUMBER;
	String MONTH;
	String YEAR;
	String CVV;
	@ManyToOne
	@JoinColumn(name="custid")
	Customer custid;
	public Credit() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Credit(int creditId, String hOLDERNAME, String cARDNUMBER, String mONTH, String yEAR, String cVV,
			Customer custid) {
		super();
		CreditId = creditId;
		HOLDERNAME = hOLDERNAME;
		CARDNUMBER = cARDNUMBER;
		MONTH = mONTH;
		YEAR = yEAR;
		CVV = cVV;
		this.custid = custid;
	}

	public int getCreditId() {
		return CreditId;
	}
	public void setCreditId(int creditId) {
		CreditId = creditId;
	}
	public String getHOLDERNAME() {
		return HOLDERNAME;
	}
	public void setHOLDERNAME(String hOLDERNAME) {
		HOLDERNAME = hOLDERNAME;
	}
	public String getCARDNUMBER() {
		return CARDNUMBER;
	}
	public void setCARDNUMBER(String cARDNUMBER) {
		CARDNUMBER = cARDNUMBER;
	}
	public String getMONTH() {
		return MONTH;
	}
	public void setMONTH(String mONTH) {
		MONTH = mONTH;
	}
	public String getYEAR() {
		return YEAR;
	}
	public void setYEAR(String yEAR) {
		YEAR = yEAR;
	}
	public String getCVV() {
		return CVV;
	}
	public void setCVV(String cVV) {
		CVV = cVV;
	}
	public Customer getCustid() {
		return custid;
	}
	public void setCustid(Customer custid) {
		this.custid = custid;
	}
	
}
