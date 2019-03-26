package kr.co.domain;

public class TvpDTO {
	private String id;
	private String pname;
	private String pb;

	public TvpDTO() {
		// TODO Auto-generated constructor stub
	}

	public TvpDTO(String id, String pname, String pb) {
		super();
		this.id = id;
		this.pname = pname;
		this.pb = pb;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPb() {
		return pb;
	}

	public void setPb(String pb) {
		this.pb = pb;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TvpDTO other = (TvpDTO) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "TvpDTO [id=" + id + ", pname=" + pname + ", pb=" + pb + "]";
	}

}
