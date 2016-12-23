

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import Utility.ConvertDate;
import Utility.FileManager;
import Utility.FileUpload;
import action.contact.qna.PagingAction;
import bean.bbs.Notice;
import bean.bbs.QnA;
import bean.member.Age;
import bean.member.Gender;
import bean.point.PointIncome;
import bean.point.pointOutcome;
import bean.survey.Category;
import bean.survey.Example;
import bean.survey.Poll;
import bean.survey.PollComment;
import bean.survey.PollResult;
import bean.survey.Survey;

import dao.EventDao;
import dao.MailSendListDao;
import dao.NoticeDao;
import dao.PollDao;
import dao.SurveyDao;


public class test {

	
	
	public static void main(String[] args) throws SQLException {
		String val	=	"adkmasdl/adslkmadslk/adsad";
		
		System.out.println(val.substring(val.lastIndexOf("/")+1));
	}
}
