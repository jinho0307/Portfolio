package movie.model.vo;

import java.sql.Date;

public class Movie {
	private String mId;
	private String mName;
	private Date mDate;
	private String mDirector;
	private String mCast;
	private String mGenre;
	private String mAge;
	private String mSite;
	private String mPlot;
	private int mYN;
	private int movieReserve;
	private int all;
	private int mPay;
	private int readCount;
	public Movie() {
	}

	public Movie(String mId, String mName, Date mDate, String mDirector, String mCast, String mGenre, String mAge,
			String mSite, String mPlot, int mYN, int mPay) {
		super();
		this.mId = mId;
		this.mName = mName;
		this.mDate = mDate;
		this.mDirector = mDirector;
		this.mCast = mCast;
		this.mGenre = mGenre;
		this.mAge = mAge;
		this.mSite = mSite;
		this.mPlot = mPlot;
		this.mYN = mYN;
		this.mPay = mPay;
	}
	

	

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getmPay() {
		return mPay;
	}

	public void setmPay(int mPay) {
		this.mPay = mPay;
	}

	public int getAll() {
		return all;
	}

	public void setAll(int all) {
		this.all = all;
	}

	public int getMovieReserve() {
		return movieReserve;
	}

	public void setMovieReserve(int movieReserve) {
		this.movieReserve = movieReserve;
	}

	public int getmYN() {
		return mYN;
	}

	public void setmYN(int mYN) {
		this.mYN = mYN;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public Date getmDate() {
		return mDate;
	}

	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}

	public String getmDirector() {
		return mDirector;
	}

	public void setmDirector(String mDirector) {
		this.mDirector = mDirector;
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

	public String getmGenre() {
		return mGenre;
	}

	public void setmGenre(String mGenre) {
		this.mGenre = mGenre;
	}

	public void setmAge(String mAge) {
		this.mAge = mAge;
	}

	public String getmSite() {
		return mSite;
	}

	public void setmSite(String mSite) {
		this.mSite = mSite;
	}

	public String getmPlot() {
		return mPlot;
	}

	public void setmPlot(String mPlot) {
		this.mPlot = mPlot;
	}

	@Override
	public String toString() {
		return mId + ", " + mName + ", " + mDate + ", " + mDirector + ", " + mCast + ", " + mGenre + ", " + mAge + ", "
				+ mSite + ", " + mPlot + ", " + mYN;
	}

}
