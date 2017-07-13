package reserve.model.vo;

public class Search implements java.io.Serializable{
	private String searchText;
	private String searchCategory;
	
	public Search() {
	}

	public Search(String searchText, String searchCategory) {
		super();
		this.searchText = searchText;
		
		this.searchCategory = searchCategory;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}


	public String getSearchCategory() {
		return searchCategory;
	}

	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}

	@Override
	public String toString() {
		return "Search [searchText=" + searchText + ", searchCategory=" + searchCategory + "]";
	}
}
