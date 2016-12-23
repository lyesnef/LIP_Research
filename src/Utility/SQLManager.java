package Utility;

import java.io.IOException;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

/*
 * Ibatis 매니저
 * SqlMapConfig파일을 초기화하면서 
 * 간단하게 ibatis 프레임워크를 활용할 수 있게한다
 */
public abstract class SQLManager {
	private SqlMapClient sc	=	null;
	
	public SQLManager(){
		try{
			sc	=	SqlMapClientBuilder.buildSqlMapClient(
					Resources.getResourceAsReader("SqlMapConfig.xml"));
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	public SqlMapClient getSqlMap(){
		
		return sc;
	}
}
