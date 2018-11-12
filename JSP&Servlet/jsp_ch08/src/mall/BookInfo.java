package mall;

public class BookInfo extends ProductInfo {
	private short page;
	private String writer;
	
	public short getPage() {
		return page;
	}

	public String getWriter() {
		return writer;
	}

	public void setPage(short page) {
		this.page = page;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
}
