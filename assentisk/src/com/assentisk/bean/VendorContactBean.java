package com.assentisk.bean;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import com.sun.org.apache.bcel.internal.generic.NEW;

@SuppressWarnings("all")
public class VendorContactBean {
	
		
		public static List<String> id=new ArrayList<String>();
		
		public static List<String> name=new ArrayList<String>();
		public static List<String> designation=new ArrayList<String>();
		public static List<String> phone=new ArrayList<String>();
		public static List<String> email=new ArrayList<String>();

		public List getemail() {
			return email;
		}
		public void setemail(String email) {
			this.email.add(email);
		}
		public List getId() {
			return id;
		}
		public void setId(String id) {
			this.id.add(id);
		}
		
		public List getname() {
			return name;
		}
		
		public void setname(String name) {
			this.name.add(name);
		}
		
		public List getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone.add(phone);
		}
		
		public List getDesignation() {
			return designation;
		}
		public void setDesignation(String designation) {
			this.designation.add(designation);
		}
		public void removeElement(int id) {
			id= id - 1;
			this.id.remove(id );
			this.name.remove(id);
			this.designation.remove(id);
			this.phone.remove(id);
			this.email.remove(id);
			
		}
		public void cleanListElement() {
			int len=this.getname().size();
			
			for(int i=len-1;i>=0;i--){
				this.id.remove(i );
				this.name.remove(i);
				this.designation.remove(i);
				this.phone.remove(i);
				this.email.remove(i);
			}
			len=this.getname().size();
			
			
		}
		
	
		
	}


