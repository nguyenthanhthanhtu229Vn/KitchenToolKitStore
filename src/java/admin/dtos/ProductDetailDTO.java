/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.dtos;

import java.io.Serializable;

/**
 *
 * @author ASUS
 */
public class ProductDetailDTO implements Serializable{
    private String productDetailID;
    private ProductDTO product;
    private String  size,brand;
    private float price;
    private String productDescription;
    private int quantity;
    private boolean statusIsDelete;

    public ProductDetailDTO() {
    }

    public ProductDetailDTO(String productDetailID, boolean statusIsDelete) {
        this.productDetailID = productDetailID;
        this.statusIsDelete = statusIsDelete;
    }

    public ProductDetailDTO(String productDetailID, String size, String brand, float price, String productDescription, int quantity) {
        this.productDetailID = productDetailID;
        this.size = size;
        this.brand = brand;
        this.price = price;
        this.productDescription = productDescription;
        this.quantity = quantity;
    }

    public ProductDetailDTO(String productDetailID, ProductDTO product, String size, String brand, float price, String productDescription, int quantity, boolean statusIsDelete) {
        this.productDetailID = productDetailID;
        this.product = product;
        this.size = size;
        this.brand = brand;
        this.price = price;
        this.productDescription = productDescription;
        this.quantity = quantity;
        this.statusIsDelete = statusIsDelete;
    }

    public String getProductDetailID() {
        return productDetailID;
    }

    public void setProductDetailID(String productDetailID) {
        this.productDetailID = productDetailID;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isStatusIsDelete() {
        return statusIsDelete;
    }

    public void setStatusIsDelete(boolean statusIsDelete) {
        this.statusIsDelete = statusIsDelete;
    }
 
}
