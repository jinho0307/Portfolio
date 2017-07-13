package QnA.model.vo;

public class QSearch {
	private String searchText;
	private String searchCinema;
	private String searchType;
	private String searchCategory;
	
	public QSearch() {
		// TODO Auto-generated constructor stub
	}

	public QSearch(String searchText, String searchCinema, String searchType, String searchCategory) {
		super();
		this.searchText = searchText;
		this.searchCinema = searchCinema;
		this.searchType = searchType;
		this.searchCategory = searchCategory;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getSearchCinema() {
		return searchCinema;
	}

	public void setSearchCinema(String searchCinema) {
		this.searchCinema = searchCinema;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchCategory() {
		return searchCategory;
	}

	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}

	@Override
	public String toString() {
		return "QSearch [searchText=" + searchText + ", searchCinema=" + searchCinema + ", searchType=" + searchType
				+ ", searchCategory=" + searchCategory + "]";
	}
}
