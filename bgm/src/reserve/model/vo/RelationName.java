package reserve.model.vo;

public class RelationName  implements java.io.Serializable{
	private String movieName;
	private String cinemaName;
	private String screenRoomName;
	private String showTime;
	
	public RelationName() {}

	public RelationName(String movieName, String cinemaName, String screenRoomName, String showTime) {
		this.movieName = movieName;
		this.cinemaName = cinemaName;
		this.screenRoomName = screenRoomName;
		this.showTime = showTime;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getCinemaName() {
		return cinemaName;
	}

	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}

	public String getScreenRoomName() {
		return screenRoomName;
	}

	public void setScreenRoomName(String screenRoomName) {
		this.screenRoomName = screenRoomName;
	}

	public String getShowTime() {
		return showTime;
	}

	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}

	@Override
	public String toString() {
		return "RelationName [movieName=" + movieName + ", cinemaName=" + cinemaName + ", screenRoomName="
				+ screenRoomName + ", showTime=" + showTime + "]";
	}
	
	
}
