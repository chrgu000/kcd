package com.model.newAdd;
// Generated 2018-1-23 10:18:29 by Hibernate Tools 3.4.0.CR1

/**
 * BmsTeam generated by hbm2java
 */
public class BmsTeam implements java.io.Serializable {

	private Integer deptno;
	private String tname;
	private String tsum;
	private String tteamVolume;
	private String tteamRefunds;
	private String ta;
	private String tb;
	private String tc;
	private String td;
	private String te;

	public BmsTeam() {
	}

	public BmsTeam(String tname, String tsum, String tteamVolume, String tteamRefunds, String ta, String tb, String tc,
			String td, String te) {
		this.tname = tname;
		this.tsum = tsum;
		this.tteamVolume = tteamVolume;
		this.tteamRefunds = tteamRefunds;
		this.ta = ta;
		this.tb = tb;
		this.tc = tc;
		this.td = td;
		this.te = te;
	}

	public Integer getDeptno() {
		return this.deptno;
	}

	public void setDeptno(Integer deptno) {
		this.deptno = deptno;
	}

	public String getTname() {
		return this.tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getTsum() {
		return this.tsum;
	}

	public void setTsum(String tsum) {
		this.tsum = tsum;
	}

	public String getTteamVolume() {
		return this.tteamVolume;
	}

	public void setTteamVolume(String tteamVolume) {
		this.tteamVolume = tteamVolume;
	}

	public String getTteamRefunds() {
		return this.tteamRefunds;
	}

	public void setTteamRefunds(String tteamRefunds) {
		this.tteamRefunds = tteamRefunds;
	}

	public String getTa() {
		return this.ta;
	}

	public void setTa(String ta) {
		this.ta = ta;
	}

	public String getTb() {
		return this.tb;
	}

	public void setTb(String tb) {
		this.tb = tb;
	}

	public String getTc() {
		return this.tc;
	}

	public void setTc(String tc) {
		this.tc = tc;
	}

	public String getTd() {
		return this.td;
	}

	public void setTd(String td) {
		this.td = td;
	}

	public String getTe() {
		return this.te;
	}

	public void setTe(String te) {
		this.te = te;
	}

}
