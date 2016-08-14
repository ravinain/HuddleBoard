package com.huddle.dbo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="OTHER_INFO")
public class OtherInfo implements Serializable, Huddle{

	@Id
	@Column(name="OTHER_ID")
	private long otherID;
	
	@Column(name="OTHER_CATEGORY")
	private String otherCategory;
	
	@Column(name="OTHER_APP")
	private String otherApp;
	
	@Column(name="OTHER_INFO")
	private String otherInfo;

	public long getOtherID() {
		return otherID;
	}

	public void setOtherID(long otherID) {
		this.otherID = otherID;
	}

	public String getOtherCategory() {
		return otherCategory;
	}

	public void setOtherCategory(String otherCategory) {
		this.otherCategory = otherCategory;
	}

	public String getOtherApp() {
		return otherApp;
	}

	public void setOtherApp(String otherApp) {
		this.otherApp = otherApp;
	}

	public String getOtherInfo() {
		return otherInfo;
	}

	public void setOtherInfo(String otherInfo) {
		this.otherInfo = otherInfo;
	}

}
