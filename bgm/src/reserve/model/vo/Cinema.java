package reserve.model.vo;

public class Cinema implements java.io.Serializable {
	private String cinemaId;
	private String cinemaName;
	private String cinemaGps;
	
	public Cinema() {}

	public Cinema(String cinemaId, String cinemaName, String cinemaGps) {
		this.cinemaId = cinemaId;
		this.cinemaName = cinemaName;
		this.cinemaGps = cinemaGps;
	}

	public String getCinemaId() {
		return cinemaId;
	}

	public void setCinemaId(String cinemaId) {
		this.cinemaId = cinemaId;
	}

	public String getCinemaName() {
		return cinemaName;
	}

	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}

	public String getCinemaGps() {
		return cinemaGps;
	}

	public void setCinemaGps(String cinemaGps) {
		this.cinemaGps = cinemaGps;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.cinemaId + ", " + this.cinemaName + ", " + this.cinemaGps;
	}
	
	
}
