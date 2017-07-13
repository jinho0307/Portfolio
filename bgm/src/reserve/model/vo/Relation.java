package reserve.model.vo;

public class Relation implements java.io.Serializable{
	private String movieId;
	private String cinemaId;
	private String screenRoomId;
	private int timeIndex;
	
	public Relation() {}

	public Relation(String movieId, String cinemaId, String screenRoomId, int timeIndex) {
		this.movieId = movieId;
		this.cinemaId = cinemaId;
		this.screenRoomId = screenRoomId;
		this.timeIndex = timeIndex;
	}

	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}

	public String getCinemaId() {
		return cinemaId;
	}

	public void setCinemaId(String cinemaId) {
		this.cinemaId = cinemaId;
	}

	public String getScreenRoomId() {
		return screenRoomId;
	}

	public void setScreenRoomId(String screenRoomId) {
		this.screenRoomId = screenRoomId;
	}

	public int getTimeIndex() {
		return timeIndex;
	}

	public void setTimeIndex(int timeIndex) {
		this.timeIndex = timeIndex;
	}

	@Override
	public String toString() {
		return this.movieId + ", " + this.cinemaId + ", " + this.screenRoomId + ", " + this.timeIndex;
	}
	
}
