package Model;




import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;



@Entity
public class Food {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	String FOODNAME;
	int PRICE;
	String IMAGE;
	@ManyToOne
	@JoinColumn(name="Category_id")
	Category Category_id; 
	@ManyToOne
	@JoinColumn(name="Restaurant_id")
	Restaurant Restaurant_id ;
	

	
	public Food() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Food(int id, String fOODNAME, int pRICE, String iMAGE, Category category_id, Restaurant restaurant_id) {
		super();
		this.id = id;
		FOODNAME = fOODNAME;
		PRICE = pRICE;
		IMAGE = iMAGE;
		Category_id = category_id;
		Restaurant_id = restaurant_id;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getFOODNAME() {
		return FOODNAME;
	}



	public void setFOODNAME(String fOODNAME) {
		FOODNAME = fOODNAME;
	}



	public int getPRICE() {
		return PRICE;
	}



	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}



	public String getIMAGE() {
		return IMAGE;
	}



	public void setIMAGE(String iMAGE) {
		IMAGE = iMAGE;
	}



	public Category getCategory_id() {
		return Category_id;
	}



	public void setCategory_id(Category category_id) {
		Category_id = category_id;
	}



	public Restaurant getRestaurant_id() {
		return Restaurant_id;
	}



	public void setRestaurant_id(Restaurant restaurant_id) {
		Restaurant_id = restaurant_id;
	}


			
}
