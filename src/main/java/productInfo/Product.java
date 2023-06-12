package productInfo;

public class Product {
	
    private int productNum;
    private String category;
    private String name;
    private int price;
    private String description;
    private int quantity;
    private String imageUrl;
    
    public Product() {
        // 기본 생성자
    }
    
    public Product(int productNum, String category, String name, int price, String description, int quantity, String imageUrl) {
        this.productNum = productNum;
        this.category = category;
        this.name = name;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.imageUrl = imageUrl;
    }

    // Getters and setters

    public int getProductNum() {
        return productNum;
    }

    public void setProductNum(int productNum) {
        this.productNum = productNum;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    
    @Override
    public String toString() {
        return "Product [productNum=" + productNum + ", category=" + category + ", name=" + name + ", price=" + price
                + ", description=" + description + ", quantity=" + quantity + ", imageUrl=" + imageUrl + "]";
    }
}