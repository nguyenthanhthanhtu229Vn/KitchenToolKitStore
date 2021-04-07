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
public class OrderDetailDTO implements Serializable{
    private String orderDetailID;
    private OrderDTO order;
    private ProductDetailDTO productDetail;
    private int quantity;
    private float unitPrice;


    public OrderDetailDTO() {
    }

    public OrderDetailDTO(String orderDetailID, OrderDTO order, ProductDetailDTO productDetail, int quantity, float unitPrice) {
        this.orderDetailID = orderDetailID;
        this.order = order;
        this.productDetail = productDetail;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public String getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(String orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public OrderDTO getOrder() {
        return order;
    }

    public void setOrder(OrderDTO order) {
        this.order = order;
    }

    public ProductDetailDTO getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetailDTO productDetail) {
        this.productDetail = productDetail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

}
