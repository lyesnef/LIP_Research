package dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.bbs.FAQ;
import bean.bbs.Notice;
import bean.bbs.QnA;

import Utility.SQLManager;

public class NoticeDao extends SQLManager {

	public List getNoticeList() throws SQLException{
		return this.getSqlMap().queryForList("getNoticeList");
	}
	
	public Notice getSingleNotice(int noticeNumber) throws SQLException{
		return (Notice) this.getSqlMap().queryForObject("getSingleNotice", noticeNumber);
	}
	
	public void insertNotice(Notice notice) throws SQLException{
		this.getSqlMap().insert("insertNotice", notice);
	}
	
	public void deleteNotice(int noticeNumber) throws SQLException{
		this.getSqlMap().delete("deleteNotice", noticeNumber);
	}
	
	public void updateNotice(Notice notice) throws SQLException{
		this.getSqlMap().update("updateNotice", notice);
	}
	
	public List getFaq() throws SQLException{
		return this.getSqlMap().queryForList("getFaq");
	}
	
	public FAQ getFaqByNumber(int faqNumber) throws SQLException{
		return (FAQ) this.getSqlMap().queryForObject("getFaqByNumber", faqNumber);
	}
	
	public void insertFaq(FAQ faq) throws SQLException{
		this.getSqlMap().insert("insertFaq", faq);
	}
	
	public void deleteFaq(int faqNumber) throws SQLException{
		this.getSqlMap().delete("deleteFaq", faqNumber);
	}
	
	public void updateFaq(FAQ faq) throws SQLException{
		this.getSqlMap().update("updateFaq", faq);
	}

	public int getRowCount() throws SQLException {
		// TODO Auto-generated method stub
		return (Integer) this.getSqlMap().queryForObject("getRowCount");
	}

	public List<QnA> getQnaList(Map map) throws SQLException {
		// TODO Auto-generated method stub
		return this.getSqlMap().queryForList("getQnaList", map);
	}

	public List<QnA> getQnaListByCondition(Map map) throws SQLException {
		// TODO Auto-generated method stub
		return this.getSqlMap().queryForList("getQnaListByCondition", map);
	}

	public void insertQna(QnA qna) throws SQLException {
		// TODO Auto-generated method stub
		this.getSqlMap().insert("insertQna", qna);
	}

	public QnA getQnaByNumber(int qnaNumber) throws SQLException {
		// TODO Auto-generated method stub
		return (QnA) this.getSqlMap().queryForObject("getQnaByNumber", qnaNumber);
	}

	public void deleteQna(int qnaNumber) throws SQLException {
		// TODO Auto-generated method stub
		this.getSqlMap().delete("deleteQna", qnaNumber);
	}

	public void updateQna(QnA qna) throws SQLException {
		// TODO Auto-generated method stub
		this.getSqlMap().update("updateQna", qna);
	}

	
}
