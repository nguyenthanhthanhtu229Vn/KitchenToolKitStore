/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users.dto;

import java.util.HashMap;
import java.util.Iterator;

/**
 *
 * @author tuana
 */
public class cartObj extends HashMap {

    public cartObj() {
        super();
    }

    public void addCart(productDTO dto , int quantity , String size) throws Exception {
        String productDetailID = dto.getProductDetailID();
        if (this.containsKey(dto.getProductDetailID()) && quantity==0 ) {
            int oldQuantity = ((productDTO) this.get(productDetailID)).getQuantity();
            ((productDTO) this.get(productDetailID)).setQuantity(oldQuantity + 1);
        }
//        else if(quantity>0 && this.containsKey(dto.getProductID())){
//            ((productDTO) this.get(productID)).setQuantity(quantity);
//        }
        else if(quantity>0 && this.containsKey(dto.getProductDetailID()) ){
            int oldQuantity = ((productDTO) this.get(productDetailID)).getQuantity();
            ((productDTO) this.get(productDetailID)).setQuantity(oldQuantity + quantity);

        }
        
        else {
            if (quantity>0){
                dto.setQuantity(quantity);
                this.put(dto.getProductDetailID(), dto);
            }
            this.put(dto.getProductDetailID(), dto);
        }

    }

    public void removeCart(String productDetailID) throws Exception {
        if (this.containsKey(productDetailID)) {          
            this.remove(productDetailID);          
        }
       
    }

    public int getSum() throws Exception{
        int total = 0;
         Iterator<productDTO> iterator = this.values().iterator();
         while (iterator.hasNext()) {
            productDTO next = iterator.next();
            total+=next.getQuantity();
        }
         return total;
    }
    public void updateCart(String productDetailID, int newQuantity) throws Exception {
        if (this.containsKey(productDetailID)) {
            ((productDTO) this.get(productDetailID)).setQuantity(newQuantity);
        }
    }
       
    public float getTotal() throws Exception{
        float total = 0;
         Iterator<productDTO> iterator = this.values().iterator();
         while (iterator.hasNext()) {
            productDTO next = iterator.next();
            total+=(next.getPrice()*next.getQuantity());
        }
         return total;
    }
    
    public boolean getSize(String size) throws Exception{
        boolean check = false;
        Iterator<productDTO> iterator = this.values().iterator();
         while (iterator.hasNext()) {
            productDTO next = iterator.next();
            if(size == next.getSize()){
                check =  true;
            }
        }
         return check;
    }
    
}
