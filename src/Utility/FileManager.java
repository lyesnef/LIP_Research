package Utility;

public class FileManager {
	public String getExtenstion(String newFileName, String fileName){
		String result	=	newFileName;
		int aa	= fileName.indexOf(".");
		result	+= fileName.substring(aa);
		return result;
	}

}
