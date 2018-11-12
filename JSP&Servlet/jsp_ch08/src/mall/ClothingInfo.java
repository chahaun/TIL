package mall;

public class ClothingInfo extends ProductInfo {
	private char size;
	private String color;

	public String getColor() {
		return color;
	}

	public char getSize() {
		return size;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public void setSize(char size) {
		this.size = size;
	}
}
