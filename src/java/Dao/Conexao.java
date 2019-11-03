package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Conexao {

    // 0 - deu certo
    // 1 - deu errado
    /////////////////
    public int execUpdate(String query){
        try {
            Statement stmt = getConnetion().createStatement();
            stmt.executeUpdate(query);
            return 0;
        } catch (SQLException e) {
            return 1;
        }
    } 
    
    public ResultSet execQuery(String query) throws SQLException{
        Statement stmt = getConnetion().createStatement();
        return stmt.executeQuery(query);
    } 
    
    private Connection getConnetion()
            throws SQLException {
        //DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        return DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/loja","root","unimep");
    }   
};
