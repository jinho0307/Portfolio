package reserve.model.vo;

public class ReserveName implements java.io.Serializable{
	private String userId;
	private String cinemaName;
	private String showTime;
	private String screenRoomName;
	private String seat;
	private String movieName;
	
	public ReserveName() {}

	public ReserveName(String userId, String cinemaName, String showTime, String screenRoomName, String seat,
			String movieName) {
		this.userId = userId;
		this.cinemaName = cinemaName;
		this.showTime = showTime;
		this.screenRoomName = screenRoomName;
		this.seat = seat;
		this.movieName = movieName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCinemaName() {
		return cinemaName;
	}

	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}

	public String getShowTime() {
		return showTime;
	}

	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}

	public String getScreenRoomName() {
		return screenRoomName;
	}

	public void setScreenRoomName(String screenRoomName) {
		this.screenRoomName = screenRoomName;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	@Override
	public String toString() {
		return "ReserveName [userId=" + userId + ", cinemaName=" + cinemaName + ", showTime=" + showTime
				+ ", screenRoomName=" + screenRoomName + ", seat=" + seat + ", movieName=" + movieName + "]";
	}
	
	
}
