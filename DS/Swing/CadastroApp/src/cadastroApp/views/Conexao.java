package cadastroApp.views;
import java.awt.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Conexao {
	// gerencia a conexão com o banco de dados 
		private Connection connection = null;
		// gerencia as consultas com o banco de dados
		private Statement statement = null;
		// armazena as irfomações vindo de um select.
		private ResultSet resultset = null;
	
	public void conectar() {
		// 1º Java data base connection
		// 2 º servidor
		// 3 º nome da tabela
		String servidor = "jdbc:mysql://localhost:3306/cadastroApp";
		// login do banco de dados
		String usuario ="root";
		String senha = "";
		// Driver utilizado para conexão
		String driver= "com.mysql.jdbc.Driver";
		//Exceção
		try {
			// faz conexão com o banco 
			this.connection = DriverManager.getConnection(servidor, usuario, senha);
			// cria o ambiente para executar códigos  dentro do banco
			this.statement = this.connection.createStatement();
			System.out.println("Conexão efetuada com sucesso");
		}catch (Exception e) {
			System.out.println("Erro: "+ e.getMessage());

		}
	}

}
