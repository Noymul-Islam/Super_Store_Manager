/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

/**
 *
 * @author DELL
 */
public class GraphData {
    public String nameOfAttribute;
    public String[] nameOfTypes = new String[10];
    public String totalSold;
    public String[] totalSoldOfEachType = new String[10];
    public String tn;

    public void setTn(String tn) {
        this.tn = tn;
    }

   
    public GraphData(String attr){
        nameOfAttribute = attr;
        nameOfTypes[0] = "groceries";
        nameOfTypes[1] = "vegetables";
        nameOfTypes[2] = "eggs";
        nameOfTypes[3] = "meats";
        nameOfTypes[4] = "fishes";
        nameOfTypes[5] = "cosmetics";
        nameOfTypes[6] = "colddrinks";
        nameOfTypes[7] = "chockolates";
        nameOfTypes[8] = "liquids";
        nameOfTypes[9] = "others";
    }

    public String getNameOfAttribute() {
        return nameOfAttribute;
    }

    public void setNameOfAttribute(String nameOfAttribute) {
        this.nameOfAttribute = nameOfAttribute;
    }

    public String[] getNameOfTypes() {
        return nameOfTypes;
    }

    public void setNameOfTypes(String[] nameOfTypes) {
        this.nameOfTypes = nameOfTypes;
    }

    public String getTotalSold() {
        return totalSold;
    }

    public void setTotalSold(String totalSold) {
        this.totalSold = totalSold;
    }

    public String[] getTotalSoldOfEachType() {
        return totalSoldOfEachType;
    }

    public void setTotalSoldOfEachType(String[] totalSoldOfEachType) {
        this.totalSoldOfEachType = totalSoldOfEachType;
    }

   
    
}
