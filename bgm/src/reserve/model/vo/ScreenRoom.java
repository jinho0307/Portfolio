package reserve.model.vo;

public class ScreenRoom implements java.io.Serializable{
	private String cinemaId;
	private String screenRoomId;
	private String screenRoomName;
	
	public ScreenRoom() {}

	public ScreenRoom(String cinemaId, String screenRoomId, String screenRoomName) {
		this.cinemaId = cinemaId;
		this.screenRoomId = screenRoomId;
		this.screenRoomName = screenRoomName;
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

	public String getScreenRoomName() {
		return screenRoomName;
	}

	public void setScreenRoomName(String screenRoomName) {
		this.screenRoomName = screenRoomName;
	}

	@Override
	public String toString() {
		return this.cinemaId + ", " + this.screenRoomId + ", " + this.screenRoomName;
	}
	
	
}
