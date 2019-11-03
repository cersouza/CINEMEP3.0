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
package Model;

import java.sql.Date;

public class Comentario {
    
    public int Com_Codigo;
    public int Com_Usuario;
    public String Com_Comentario;
    public int Com_Gostou;
    public int Com_NaoGostou;
    public int Com_Avaliacao;
    public int Com_Filme;
    public Date Com_Data;
    public String Com_Situacao;

    public int getCom_Codigo() {
        return Com_Codigo;
    }

    public void setCom_Codigo(int Com_Codigo) {
        this.Com_Codigo = Com_Codigo;
    }

    public int getCom_Usuario() {
        return Com_Usuario;
    }

    public void setCom_Usuario(int Com_Usuario) {
        this.Com_Usuario = Com_Usuario;
    }

    public String getCom_Comentario() {
        return Com_Comentario;
    }

    public void setCom_Comentario(String Com_Comentario) {
        this.Com_Comentario = Com_Comentario;
    }

    public int getCom_Gostou() {
        return Com_Gostou;
    }

    public void setCom_Gostou(int Com_Gostou) {
        this.Com_Gostou = Com_Gostou;
    }

    public int getCom_NaoGostou() {
        return Com_NaoGostou;
    }

    public void setCom_NaoGostou(int Com_NaoGostou) {
        this.Com_NaoGostou = Com_NaoGostou;
    }

    public int getCom_Avaliacao() {
        return Com_Avaliacao;
    }

    public void setCom_Avaliacao(int Com_Avaliacao) {
        this.Com_Avaliacao = Com_Avaliacao;
    }

    public int getCom_Filme() {
        return Com_Filme;
    }

    public void setCom_Filme(int Com_Filme) {
        this.Com_Filme = Com_Filme;
    }

    public Date getCom_Data() {
        return Com_Data;
    }

    public void setCom_Data(Date Com_Data) {
        this.Com_Data = Com_Data;
    }

    public String getCom_Situacao() {
        return Com_Situacao;
    }

    public void setCom_Situacao(String Com_Situacao) {
        this.Com_Situacao = Com_Situacao;
    }
}
