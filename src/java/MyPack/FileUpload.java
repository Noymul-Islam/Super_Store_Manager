
package MyPack;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import org.apache.commons.fileupload.FileItemStream;

public class FileUpload {
     public static boolean processFile(String path,FileItemStream item,String pid){
        try{
            File f = new File(path+File.separator+"images"+File.separator+pid);
            if (!f.exists())
                f.mkdir();
            String pathOfPic = "./images"+"/"+pid+"/"+item.getName();
            DatabaseConnector dc = new DatabaseConnector();
            dc.setConnectionWithOracle();
            String type="";
            for (int i=0;i<3;++i){
                type+=pid.charAt(i);
            }
            System.out.println("type -->"+type);
            dc.insertPic(pathOfPic, type, pid);
            File savedFile = new File(f.getAbsolutePath()+File.separator+item.getName());
            System.out.println("FileName:"+item.getName());
            FileOutputStream fos =  new FileOutputStream(savedFile);
            InputStream is = item.openStream();
            int x =0;
            byte[] b = new byte[1024];
            while ( ( x=is.read(b) ) != -1){
                fos.write(b,0,x);
            }
            fos.flush();
            fos.close();
            return true;
        }   
        catch(Exception e){
            e.printStackTrace();
        }
    return false;
    }
}
