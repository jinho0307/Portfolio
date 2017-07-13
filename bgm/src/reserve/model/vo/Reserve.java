package reserve.model.vo;

public class Reserve  implements java.io.Serializable{
	private String userId;
	private String cinemaId;
	private int timeIndex;
	private String screenRoomId;
	private String seat;
	private String movieId;
	
	public Reserve() {}

	public Reserve(String userId, String cinemaId, int timeIndex, String screenRoomId, String seat, String movieId) {
		this.userId = userId;
		this.cinemaId = cinemaId;
		this.timeIndex = timeIndex;
		this.screenRoomId = screenRoomId;
		this.seat = seat;
		this.movieId = movieId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCinemaId() {
		return cinemaId;
	}

	public void setCinemaId(String cinemaId) {
		this.cinemaId = cinemaId;
	}

	public int getTimeIndex() {
		return timeIndex;
	}

	public void setTimeIndex(int timeIndex) {
		this.timeIndex = timeIndex;
	}

	public String getScreenRoomId() {
		return screenRoomId;
	}

	public void setScreenRoomId(String screenRoomId) {
		this.screenRoomId = screenRoomId;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}

	@Override
	public String toString() {
		return "Reserve [userId=" + userId + ", cinemaId=" + cinemaId + ", timeIndex=" + timeIndex + ", screenRoomId="
				+ screenRoomId + ", seat=" + seat + ", movieId=" + movieId + "]";
	}

	/*@Override
	public String toString() {
		return userId + ", " + cinemaId + ", " + timeIndex + ", " + screenRoomId + ", " + seat + ", " + movieId;
	}*/
	
	
}
