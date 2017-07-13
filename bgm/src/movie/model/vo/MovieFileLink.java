package movie.model.vo;

import java.sql.Date;

public class MovieFileLink {

	private String moviePoster;
	private String movieId;
	private String movieImg1;
	private String movieImg2;
	private String movieImg3;
	private String movieImg4;
	private String movieImg5;
	private String movieImg6;
	private String movieImg7;
	private String movieImg8;
	private String movieMp4;
	private String movieName;
	private Date movieDate;
	private int movieReserve;
	private String mDirector;
	private String mGenre;
	private String mCast;
	private String mAge;
	private int all;
	
	public MovieFileLink(){}

	public MovieFileLink(String moviePoster, String movieId, String movieImg1, String movieImg2, String movieImg3,
			String movieName,String movieImg4, String movieImg5, String movieImg6, String movieImg7, String movieImg8, String movieMp4, Date movieDate) {
		super();
		this.moviePoster = moviePoster;
		this.movieId = movieId;
		this.movieImg1 = movieImg1;
		this.movieImg2 = movieImg2;
		this.movieImg3 = movieImg3;
		this.movieImg4 = movieImg4;
		this.movieImg5 = movieImg5;
		this.movieImg6 = movieImg6;
		this.movieImg7 = movieImg7;
		this.movieImg8 = movieImg8;
		this.movieMp4 = movieMp4;
		this.movieName = movieName;
		this.movieDate = movieDate;
	}
	public MovieFileLink(String moviePoster, String movieId, String movieImg1,String movieMp4){
		super();
		this.moviePoster = moviePoster;
		this.movieId = movieId;
		this.movieImg1 = movieImg1;
		this.movieMp4 = movieMp4;
	}

	
	public String getmCast() {
		return mCast;
	}

	public void setmCast(String mCast) {
		this.mCast = mCast;
	}

	public String getmAge() {
		return mAge;
	}

	public void setmAge(String mAge) {
		this.mAge = mAge;
	}

	public int getAll() {
		return all;
	}

	public void setAll(int all) {
		this.all = all;
	}

	public String getmDirector() {
		return mDirector;
	}

	public void setmDirector(String mDirector) {
		this.mDirector = mDirector;
	}

	public String getmGenre() {
		return mGenre;
	}

	public void setmGenre(String mGenre) {
		this.mGenre = mGenre;
	}

	public int getMovieReserve() {
		return movieReserve;
	}

	public void setMovieReserve(int movieReserve) {
		this.movieReserve = movieReserve;
	}

	public Date getMovieDate() {
		return movieDate;
	}

	public void setMovieDate(Date movieDate) {
		this.movieDate = movieDate;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getMoviePoster() {
		return moviePoster;
	}

	public void setMoviePoster(String moviePoster) {
		this.moviePoster = moviePoster;
	}

	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}

	public String getMovieImg1() {
		return movieImg1;
	}

	public void setMovieImg1(String movieImg1) {
		this.movieImg1 = movieImg1;
	}

	public String getMovieImg2() {
		return movieImg2;
	}

	public void setMovieImg2(String movieImg2) {
		this.movieImg2 = movieImg2;
	}

	public String getMovieImg3() {
		return movieImg3;
	}

	public void setMovieImg3(String movieImg3) {
		this.movieImg3 = movieImg3;
	}

	public String getMovieImg4() {
		return movieImg4;
	}

	public void setMovieImg4(String movieImg4) {
		this.movieImg4 = movieImg4;
	}

	public String getMovieImg5() {
		return movieImg5;
	}

	public void setMovieImg5(String movieImg5) {
		this.movieImg5 = movieImg5;
	}

	public String getMovieImg6() {
		return movieImg6;
	}

	public void setMovieImg6(String movieImg6) {
		this.movieImg6 = movieImg6;
	}

	public String getMovieImg7() {
		return movieImg7;
	}

	public void setMovieImg7(String movieImg7) {
		this.movieImg7 = movieImg7;
	}

	public String getMovieImg8() {
		return movieImg8;
	}

	public void setMovieImg8(String movieImg8) {
		this.movieImg8 = movieImg8;
	}

	public String getMovieMp4() {
		return movieMp4;
	}

	public void setMovieMp4(String movieMp4) {
		this.movieMp4 = movieMp4;
	}

	@Override
	public String toString() {
		return  moviePoster + ", " + movieId + ", " + movieImg1
				+ ", " + movieImg2 + ", " + movieImg3 + ", " + movieImg4 + ", "
				+ movieImg5 + ", " + movieImg6 + ", " + movieImg7 + ", " + movieImg8
				+ ", " + movieMp4 + ", " + movieName +", "+ movieDate;
	}
	
	
}
