/*

create table Comentario(
    Com_Codigo int identity(1,1),
    Com_Usuario int,
    Com_Comentario text,
    Com_Gostou int,
    Com_NaoGostou int,
    Com_Avaliacao int,
    Com_Filme int,
    Com_Data date,
    Com_Situacao char,
    primary key(Com_Codigo),
    foreign key(Com_Usuario) references Usuario(Usu_Codigo),
    foreign key(Com_Filme) references Filmes(Fil_Codigo)
);

*/
package Dao;

    
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Date;

import Model.Comentario;
import Dao.Conexao;

public class ComentarioDao {
    
    private Conexao con;
    
    public ComentarioDao() {
        con = new Conexao();
    } 
    
    
    public void add(Comentario com) {
        String query = "insert into comentario("+
            "Com_Usuario,Com_Comentario,Com_Gostou,Com_NaoGostou,"+
            "Com_Avaliacao,Com_Filme,Com_Data,Com_Situacao) values(" + 
                  com.getCom_Usuario() + "," + 
            "'" + com.getCom_Comentario() + "'," + 
                  com.getCom_Gostou() + "," +
                  com.getCom_NaoGostou() + "," + 
                  com.getCom_Avaliacao() + "," + 
                  com.getCom_Filme() + 
            "'" + com.getCom_Data() + "'," +
            "'" + com.getCom_Situacao() + "'" +
            ")";

        con.execUpdate(query);
    }
    
    public void del(int codigo) {
        String query = "delete from comentario where Com_Codigo = " + codigo;

        con.execUpdate(query);
    }
    
    public void upg(Comentario com) {
        String query = "update comentario set"+
                "Com_Usuario=" + com.getCom_Usuario() + "," + 
                "Com_Comentario='" + com.getCom_Comentario() + "'," + 
                "Com_Gostou=" +  com.getCom_Gostou() + "," +
                "Com_NaoGostou=" +  com.getCom_NaoGostou() + "," + 
                "Com_Avaliacao=" + com.getCom_Avaliacao() + "," + 
                "Com_Filme=" +  com.getCom_Filme() + 
                "Com_Data='" + com.getCom_Data() + "'," +
                "Com_Situacao='" + com.getCom_Situacao() + "'" +       
                " where Com_Codigo=" + com.getCom_Codigo();
        con.execUpdate(query);
    }
    
    public ArrayList<Comentario> lista() throws SQLException {
        ArrayList<Comentario> aCom = new ArrayList<Comentario>();
        
        String query = "select * from comentario";
        ResultSet res = con.execQuery(query);
        while (res.next()) {
            Comentario com = new Comentario();
            com.setCom_Codigo(res.getInt("Com_Codigo"));
            com.setCom_Usuario(res.getInt("Com_Usuario"));
            com.setCom_Comentario(res.getString("Com_Comentario"));
            com.setCom_Gostou(res.getInt("Com_Gostou"));
            com.setCom_NaoGostou(res.getInt("Com_NaoGostou"));
            com.setCom_Avaliacao(res.getInt("Com_Avaliacao"));
            com.setCom_Filme(res.getInt("Com_Filme"));
            com.setCom_Data(res.getDate("Com_Data"));
            com.setCom_Situacao(res.getString("Com_Situacao"));
            aCom.add(com);
        }
        return aCom;
    }
    
    public Comentario pesquisarPK(int codigo) throws SQLException {
        String query = "select * from comentario where Com_Codigo = "
                + codigo;
        
        ResultSet res = con.execQuery(query);

        Comentario com = new Comentario();
        if (res.next()) {
           com.setCom_Codigo(res.getInt("Com_Codigo"));
            com.setCom_Usuario(res.getInt("Com_Usuario"));
            com.setCom_Comentario(res.getString("Com_Comentario"));
            com.setCom_Gostou(res.getInt("Com_Gostou"));
            com.setCom_NaoGostou(res.getInt("Com_NaoGostou"));
            com.setCom_Avaliacao(res.getInt("Com_Avaliacao"));
            com.setCom_Filme(res.getInt("Com_Filme"));
            com.setCom_Data(res.getDate("Com_Data"));
            com.setCom_Situacao(res.getString("Com_Situacao"));                     
        }
        return com;
    }
}