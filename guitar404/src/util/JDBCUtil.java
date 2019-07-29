package util;

import java.sql.Connection;
import javax.sql.DataSource;
import org.apache.commons.dbutils.QueryRunner;
import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JDBCUtil {
	// ����c3p0���ӣ�������Ŀ��һ�����ӳؾͿ����ˣ���ΪstaticֻҪʵ����һ��
	// �Զ�����srcĿ¼��c3p0�������ļ���c3p0-config.xml��
	private static ComboPooledDataSource dataSource = new ComboPooledDataSource();
	
	public static DataSource getDataSource() {
		return dataSource;
	}

	// ����DButils���ù�����QueryRunner�Ķ���
	public static QueryRunner getQueryRunner() {
		return new QueryRunner(dataSource);
	}

	//ͨ��c3p0������Դ��ȡ���ݿ����Ӷ���
	public static Connection getConnection() {
		try {
			return dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
