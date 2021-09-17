package tokyomanji;

public class Member {
	
	protected String name;
	protected String rank;
	
	public Member() {}
	
	public Member(String name, String rank) {
		super();
		this.name = name;
		this.rank = rank;
	}
	
	public String getname() {
		return name;
	}
	public void setname(String name) {
		this.name = name;
	}
	public String getrank() {
		return rank;
	}
	public void setrank(String rank) {
		this.rank = rank;
	}
}