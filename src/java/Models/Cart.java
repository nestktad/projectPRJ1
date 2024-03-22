/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FPT
 */
public class Cart {
     private List<Item> items;
     
     
    public Cart() {
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public int getQuantityById(int bid) {
        return getItembyId(bid).getQuantity();
    }

    private Item getItembyId(int bid) {
        for (Item i : items) {
            if (i.getBook().getBid()== bid) {
                return i;
            }
        }
        return null;
    }

    public void addItem(Item t) {
        if (getItembyId(t.getBook().getBid()) != null) {
            Item m = getItembyId(t.getBook().getBid());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItembyId(id) != null) {
            items.remove(getItembyId(id));
        }
    }

    public double getTotalMoney() {
        double t = 0;
        for (Item i : items) 
            t+=(i.getQuantity()*i.getBook().getPrice());
        return t;
    }
    private Book getBookById(int bid,List<Book> list){
        for(Book i:list){
            if(i.getBid()==bid)
                return i;
        }
        return null;
    }
    
    public Cart(String txt,List<Book> list){
        items=new ArrayList<>();
        try{
        if(txt!=null && txt.length()!=0){
            String[] s=txt.split("/");//thay / cho dau ,
            for(String i:s){
                String[] n=i.split(":");
                int bid=Integer.parseInt(n[0]);
                int quantity=Integer.parseInt(n[1]);
                Book b=getBookById(bid, list);
                Item t=new Item(b, quantity, b.getPrice()*2);
                addItem(t);
            }
        }
        }catch(NumberFormatException e){
            
        }
    }
}
