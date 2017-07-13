package reserve.model.vo;

import java.sql.Date;

public class Time implements java.io.Serializable{
	private int timeIndex;
	private String showTime;
	
	public Time() {}

	public Time(int timeIndex, String showTime) {
		this.timeIndex = timeIndex;
		this.showTime = showTime;
	}

	public int getTimeIndex() {
		return timeIndex;
	}

	public void setTimeIndex(int timeIndex) {
		this.timeIndex = timeIndex;
	}

	public String getShowTime() {
		return showTime;
	}

	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}

	@Override
	public String toString() {
		return this.timeIndex + ", " + this.showTime;
	}
	
	
}
