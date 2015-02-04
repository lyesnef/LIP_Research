package Utility;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class ConvertDate {
	SimpleDateFormat sdf	=	new SimpleDateFormat("yyyy-MM-dd");
	
	public java.util.Date StringToUtilDate(String value){
		java.util.Date result	=	new java.util.Date();
		
		try {
			System.out.println(value);
			result	=	sdf.parse(value);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public java.sql.Date UtilDateToSqlDate(java.util.Date value){
		
		return new java.sql.Date(value.getTime());
	}
	
}
