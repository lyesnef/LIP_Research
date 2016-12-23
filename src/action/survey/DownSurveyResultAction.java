package action.survey;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import action.user.info.DownloadExcel;
import bean.survey.ResultSurvey;

import com.opensymphony.xwork2.ActionSupport;

import dao.SurveyDao;


public class DownSurveyResultAction extends ActionSupport{

	int surveyNum;
	private String fileName; 
	private String contentType;          //��Ʈ�� Ÿ��
	private String contentDisposition;	 //��Ʈ���� �� �̸�
	private InputStream inputStream;  //��Ʈ�� ������
	private long contentLength;          //��Ʈ���� ũ��	
	private String inputPath;
	
	@Override
	public String execute() throws SQLException, UnsupportedEncodingException, FileNotFoundException  {
		
		
		if (surveyNum != 0) {
			try {
				makeExcel(surveyNum);
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
		this.inputPath = "D:\\excel\\" + surveyNum + ".xls";
		this.fileName = "s"+surveyNum + ".xls";
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(inputPath));
			WritableSheet sheet = workbook.createSheet("result", 0);

			SurveyDao survyeDao = new SurveyDao();
			List<ResultSurvey> rSurveyList= new ArrayList<ResultSurvey>();
			
			/*GetPollDao gpd = new GetPollDao();
			List<ResultExcel> results = null;
			String pollQuestion = "";*/
			try {
				rSurveyList = survyeDao.downSurveyResutl(surveyNum);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			sheet.addCell(new Label(0, 0,  "문제번호"));//new Label(row ,column++,item.getNo())
			sheet.addCell(new Label(1, 0,  "문제"));
			sheet.addCell(new Label(2, 0,  "보기"));
			sheet.addCell(new Label(3, 0,  "보기내용"));
			sheet.addCell(new Label(4, 0,  "나이"));
			sheet.addCell(new Label(5, 0,  "성별"));
			sheet.addCell(new Label(6, 0,  "지역"));
			sheet.addCell(new Label(7, 0,  "이메일"));
			for(int i=0; i < rSurveyList.get(0).getSetConstraintList().size(); i++)
			{
				sheet.addCell(new Label(i+8, 0, rSurveyList.get(0).getSetConstraintList().get(i).getConstraintName() ));
			}
			
			if (!rSurveyList.isEmpty()) {
				int row = 1;
				for (ResultSurvey item : rSurveyList) {
					int column = 0;
					sheet.addCell(new Label(column++, row,  Integer.toString(item.getQuestionOrder())));
					sheet.addCell(new Label(column++, row,  item.getQuestionContant()));
					sheet.addCell(new Label(column++, row,  Integer.toString(item.getExampleOrder())));
					sheet.addCell(new Label(column++, row,  item.getExampleContant()));
					sheet.addCell(new Label(column++, row,  item.getAgeName()));
					sheet.addCell(new Label(column++, row,  item.getGenderName()));
					sheet.addCell(new Label(column++, row,  item.getPostcodeAddress()));
					sheet.addCell(new Label(column++, row,  item.getMemberEmail()));
					for(int i=0; i < item.getSetConstraintList().size(); i++)
					{
						sheet.addCell(new Label(column++, row,  item.getSetConstraintList().get(i).getSetConstraintName()));
					}
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

	public int getSurveyNum() {
		return surveyNum;
	}

	public void setSurveyNum(int surveyNum) {
		this.surveyNum = surveyNum;
	}
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
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

	

}
