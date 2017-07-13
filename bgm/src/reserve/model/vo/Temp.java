package reserve.model.vo;

public class Temp implements java.io.Serializable{
	private String screenRoomName;
	private String time;
	private int cnt;
	
	public Temp() {}

	public Temp(String screenRoomName, String time, int cnt) {
		super();
		this.screenRoomName = screenRoomName;
		this.time = time;
		this.cnt = cnt;
	}

	public String getScreenRoomName() {
		return screenRoomName;
	}

	public void setScreenRoomName(String screenRoomName) {
		this.screenRoomName = screenRoomName;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return screenRoomName + ", " + time + ", " + cnt;
	}
	
	
}
