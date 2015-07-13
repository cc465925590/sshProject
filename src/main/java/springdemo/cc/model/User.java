package springdemo.cc.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity (name="users")
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@javax.persistence.Id
	@Column(name="Id")
	private String Id;
	@Column(name="Password")
	private String Password;

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}

}
