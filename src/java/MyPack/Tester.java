
package MyPack;


public class Tester {
    public static void main(String args[]){
        DatabaseConnector dc = new DatabaseConnector();
        dc.setConnectionWithOracle();
        /*int count=0;
        count = dc.getTableCount();
        String str[] = new String[200];
        str = dc.getTableNames();
        for (int i=0;i<count;++i)
        System.out.println(str[i]);*/
       
    }
}
