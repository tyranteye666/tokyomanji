package tokyomanji;

public class Member {
	
	protected String name;
	protected String rank;
	protected String tattoo;
	
	public Member() {}
	
	public Member(String name, String rank, String tattoo) {
		super();
		this.name = name;
		this.rank = rank;
		this.tattoo = tattoo;
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
	public String gettattoo() {
		return tattoo;
	}
	public void settattoo(String tattoo) {
		this.tattoo = tattoo;
	}
}