package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.ConnetctionBd;
import model.ModelLogin;

public class DAOUsuarioRepository {
	
	private Connection connection;
	
	public DAOUsuarioRepository() {
		ConnetctionBd connetctionBd = new ConnetctionBd();
		connection = connetctionBd.getConnection();
	}
	
	
	public ModelLogin gravarUsuario(ModelLogin obj) throws Exception {
		
		if (obj.isNovo()) {

			String sql = "INSERT INTO model_login(nome, email,login, senha) VALUES(?, ?, ?,?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, obj.getNome());
			statement.setString(2, obj.getEmail());
			statement.setString(3, obj.getLogin());
			statement.setString(4, obj.getSenha());
			statement.execute();
			connection.commit();
			
			
		}else {
			String sql = "update model_login SET nome = ? , email = ?, login = ?, senha = ?  where id = "+ obj.getId();
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, obj.getNome());
			statement.setString(2, obj.getEmail());
			statement.setString(3, obj.getLogin());
			statement.setString(4, obj.getSenha());
			
			statement.executeUpdate();
			connection.commit();
		}
		
		return this.buscarUsuario(obj.getLogin());
		
		
	}
	
	
	
	public List<ModelLogin> consultaUsuarioList(String nome) throws Exception{
		List<ModelLogin> modelLoginList = new ArrayList<>();
		String sql = "select * from model_login where upper(nome) like upper(?)";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1,"%"+nome+"%");
		
		ResultSet resultado = statement.executeQuery();
		
		while(resultado.next()) {
			ModelLogin modelLogin = new ModelLogin();
			
			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setLogin(resultado.getString("login"));
			
			modelLoginList.add(modelLogin);
			
		}
		
		return modelLoginList;
		
	}
	
	
	public ModelLogin buscarUsuario(String login) throws Exception {
		
		ModelLogin modelLogin = new ModelLogin();
		String sql = "select * from model_login where (login) = lower(?)";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, login);		
		ResultSet resultado = statement.executeQuery();
		
		while(resultado.next()) {
			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setLogin(resultado.getString("login"));
			
		}
		return modelLogin;
	}


	public boolean validaLogin(String login) throws Exception{
		String sql = "select count(1)>0 as existe from model_login where (login) =LOWER(?)";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, login);
		ResultSet resultado = statement.executeQuery();

		resultado.next();
		return resultado.getBoolean("existe");

	}
	
	public void deletarUser(String idUser) throws Exception {
		String sql = "delete from model_login where id = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		statement.setLong(1, Long.parseLong(idUser));
		
		statement.executeUpdate();
		connection.commit();
		
	}
	

}



