package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Model.Classificacao;
import Dao.Conexao;

public class ClassificacaoDao {
    
    private Conexao con;
    
    public ClassificacaoDao() {    
        con = new Conexao();
    } 
    
    
    public void add(Classificacao cla) {
        String query = "insert into classificacao(cla_descricao) values('" + 
                       cla.getCla_Descricao() + "')";

        con.execUpdate(query);
    }
    
    public void del(int codigo) {
        String query = "delete from classificacao where cla_codigo = " + codigo;

        con.execUpdate(query);
    }
    
    public void upg(Classificacao cla) {
        String query = "update classificacao set"+
                       "cla_descricao='" + cla.getCla_Descricao() +
                       "' where cla_codigo=" + cla.getCla_Codigo();

        con.execUpdate(query);
    }
    
    public ArrayList<Classificacao> lista() throws SQLException {
        ArrayList<Classificacao> aCla = new ArrayList<Classificacao>();
        
        String query = "select * from classificacao";
        ResultSet res = con.execQuery(query);;
        while (res.next()) {
            Classificacao cla = new Classificacao();
            cla.setCla_Codigo(res.getInt("cla_codigo"));
            cla.setCla_Descricao(res.getString("cla_descricao"));
            aCla.add(cla);
        }
        return aCla;
    }
    
    public Classificacao pesquisarPK(int codigo) throws SQLException {
        String query = "select * from classificacao where cla_codigo = "
                + codigo;
        
        ResultSet res = con.execQuery(query);

        Classificacao cla = new Classificacao();
        if (res.next()) {
           cla.setCla_Codigo(res.getInt("cla_codigo"));
           cla.setCla_Descricao(res.getString("cla_descricao"));                     
        }
        return cla;
    }
}
