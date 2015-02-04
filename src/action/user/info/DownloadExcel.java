package action.user.info;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;
import bean.member.ResultExcel;
import dao.GetPollDao;

public class DownloadExcel extends ActionSupport{

	private int pollNumber;
	private String fileName; 
	private String contentType;          //��Ʈ�� Ÿ��
	private String contentDisposition;	 //��Ʈ���� �� �̸�
	private InputStream inputStream;  //��Ʈ�� ������
	private long contentLength;          //��Ʈ���� ũ��	
	private String inputPath;
	
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getPollNumber() {
		return pollNumber;
	}

	public void setPollNumber(int pollNumber) {
		this.pollNumber = pollNumber;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}

	public String getInputPath() {
		return inputPath;
	}

	public void setInputPath(String inputPath) {
		this.inputPath = inputPath;
	}

	public String execute() throws SQLException, UnsupportedEncodingException, FileNotFoundException {
		// TODO Auto-generated method stub
		if (pollNumber != 0) {
			try {
				makeExcel(pollNumber);
			} catch (RowsExceededException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (WriteException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
    	//contentLength
    	File f = new File(inputPath);
    	setContentLength(f.length());
    	//contentDisposition
    	setContentDisposition("attachment; filename=" + URLEncoder.encode(fileName, "UTF-8"));
    	//inputStream    	
    	setInputStream(new FileInputStream(inputPath));	
		
		return SUCCESS;
	}

	private void makeExcel(int pollNumber) throws IOException, RowsExceededException, WriteException, SQLException {
		// TODO Auto-generated method stub
		DownloadExcel de = new DownloadExcel();
		this.inputPath = "D:\\excel\\" + pollNumber + ".xls";
		this.fileName = pollNumber + ".xls";
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(inputPath));
			WritableSheet sheet = workbook.createSheet("result", 0);

			GetPollDao gpd = new GetPollDao();
			List<ResultExcel> results = null;
			String pollQuestion = "";
			try {
				pollQuestion = gpd.getPollQuestion(pollNumber);
				results = gpd.selectResultExcel(pollNumber);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


			System.out.println(results.isEmpty());
			sheet.addCell(new Label(0, 0,  pollQuestion));//new Label(row ,column++,item.getNo())
			sheet.addCell(new Label(0, 1,  "No."));//new Label(row ,column++,item.getNo())
			sheet.addCell(new Label(1, 1,  "성별"));
			sheet.addCell(new Label(2, 1,  "연령"));
			sheet.addCell(new Label(3, 1,  "지역"));
			sheet.addCell(new Label(4, 1,   "투표결과"));
			sheet.addCell(new Label(5, 1,   "내용"));
			
			if (!results.isEmpty()) {
				int row = 2;
				for (ResultExcel item : results) {
					int column = 0;
					sheet.addCell(new Label(column++, row,  Integer.toString(item.getNo())));//new Label(row ,column++,item.getNo())
					sheet.addCell(new Label(column++, row,  item.getGenderName()));
					sheet.addCell(new Label(column++, row,  item.getAgeName()));
					sheet.addCell(new Label(column++, row,  item.getRegionName()));
					sheet.addCell(new Label(column++, row,   Integer.toString(item.getExampleOrder())));
					sheet.addCell(new Label(column++, row,  item.getExampleContant()));
					row++;
				}
			}
			workbook.write();
			workbook.close();
		} catch (RowsExceededException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (WriteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
}


