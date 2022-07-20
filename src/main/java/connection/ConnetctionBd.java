package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnetctionBd {
	
	private static String url ="jdbc:postgresql://localhost:5433/projeto_jsp?autoReconnect=true";
	private static String user = "postgres";
	private static String password = "cavalo1313";
	
	private static Connection connection = null;

	static {
		conectar();
	}
	
	public ConnetctionBd() {
		
		conectar();
	}

	private static void conectar() {
		try {
			if(connection == null) {
				Class.forName("org.postgresql.Driver");
				connection = DriverManager.getConnection(url, user, password);
				connection.setAutoCommit(false);
				System.out.println("Conexão com Banco de Dados Ok!");
				
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	public Connection getConnection() {
		return connection;
	}
	
	
}

