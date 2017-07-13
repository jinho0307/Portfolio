package reserve.model.vo;

public class reserveInfo implements java.io.Serializable{
	private String cinemaName;
	private String screenRoomName;
	private String movieName;
	private String movieAge;
	private String moviePoster;
	private String Show_Time;
	
	public reserveInfo() {}

	public reserveInfo(String cinemaName, String screenRoomName, String movieName, String movieAge, String moviePoster, String show_Time) {
		this.cinemaName = cinemaName;
		this.screenRoomName = screenRoomName;
		this.movieName = movieName;
		this.movieAge = movieAge;
		this.moviePoster = moviePoster;
		this.Show_Time = show_Time;
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

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getMovieAge() {
		return movieAge;
	}

	public void setMovieAge(String movieAge) {
		this.movieAge = movieAge;
	}

	public String getMoviePoster() {
		return moviePoster;
	}

	public void setMoviePoster(String moviePoster) {
		this.moviePoster = moviePoster;
	}

	public String getShow_Time() {
		return Show_Time;
	}

	public void setShow_Time(String show_Time) {
		Show_Time = show_Time;
	}

	@Override
	public String toString() {
		return cinemaName + ", " + screenRoomName + ", " + movieAge + ", " + movieName + ", " + moviePoster + ", " + Show_Time;
	}
	
	
}
