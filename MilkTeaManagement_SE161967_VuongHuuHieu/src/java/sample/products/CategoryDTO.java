/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.products;

/**
 *
 * @author ownhi
 */
public class CategoryDTO {
    private String categoryID;
    private String name;

    public CategoryDTO(String categoryID, String name) {
        this.categoryID = categoryID;
        this.name = name;
    }

    public CategoryDTO() {
        this.categoryID = "";
        this.name = "";
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
