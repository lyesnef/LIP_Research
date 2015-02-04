package Utility;

import java.io.File;

import java.io.IOException;

import org.apache.commons.io.FileUtils;
/*
 * 외부에서 파일을 업로드 할때 사용한다. 
 * struts io.jar파일과 함께 쓰여야한다
 */
public class FileUpload {
	private String dirPath;
	
	public FileUpload(String dirPath){
		this.dirPath	=	dirPath;
	}

	public String getDirPath() {
		return dirPath;
	}
	
	public void setDirPath(String dirPath) {
		this.dirPath = dirPath;
	}

	public boolean saveFile(File upload, String uploadFileName){
		File saveFile = null;
		
		if(upload !=null && upload.exists()){
			saveFile	=	new File(dirPath+uploadFileName);
			try {
				FileUtils.copyFile(upload, saveFile);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return saveFile.exists();
	}
	
}
