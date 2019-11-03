/*

create table Filmes(
    Fil_Codigo int identity(1,1),
    Fil_Titulo varchar(50),
    Fil_Sinopse text,
    Fil_Foto text,
    Fil_Lancamento datetime,
    Fil_Tempo varchar(6),
    Fil_Genero int,
    Fil_Classificacao int,
    Fil_Distribuidora int,
    Fil_Situacao varchar(07),
    primary key(Fil_Codigo),
    foreign key(Fil_Genero) references Genero(Gen_codigo),
    foreign key(Fil_Distribuidora) references Distribuidora(Dis_Codigo),
    foreign key(Fil_Classificacao) references Classificacao(Cla_Codigo)
);

*/
package Dao;

import Model.*;
import java.util.Date;

public class FilmeDao {
    public FilmeDao(){};
    
    public int Fil_Codigo;
    public String Fil_Titulo;
    public String Fil_Sinopse;
    public String Fil_Foto;
    public Date Fil_Lancamento;
    public String Fil_Tempo;
    public int Fil_Genero;
    public int Fil_Classificacao;
    public int Fil_Distribuidora;
    public String Fil_Situacao;

    public int getFil_Codigo() {
        return Fil_Codigo;
    }

    public void setFil_Codigo(int Fil_Codigo) {
        this.Fil_Codigo = Fil_Codigo;
    }

    public String getFil_Titulo() {
        return Fil_Titulo;
    }

    public void setFil_Titulo(String Fil_Titulo) {
        this.Fil_Titulo = Fil_Titulo;
    }

    public String getFil_Sinopse() {
        return Fil_Sinopse;
    }

    public void setFil_Sinopse(String Fil_Sinopse) {
        this.Fil_Sinopse = Fil_Sinopse;
    }

    public String getFil_Foto() {
        return Fil_Foto;
    }

    public void setFil_Foto(String Fil_Foto) {
        this.Fil_Foto = Fil_Foto;
    }

    public Date getFil_Lancamento() {
        return Fil_Lancamento;
    }

    public void setFil_Lancamento(Date Fil_Lancamento) {
        this.Fil_Lancamento = Fil_Lancamento;
    }

    public String getFil_Tempo() {
        return Fil_Tempo;
    }

    public void setFil_Tempo(String Fil_Tempo) {
        this.Fil_Tempo = Fil_Tempo;
    }

    public int getFil_Genero() {
        return Fil_Genero;
    }

    public void setFil_Genero(int Fil_Genero) {
        this.Fil_Genero = Fil_Genero;
    }

    public int getFil_Classificacao() {
        return Fil_Classificacao;
    }

    public void setFil_Classificacao(int Fil_Classificacao) {
        this.Fil_Classificacao = Fil_Classificacao;
    }

    public int getFil_Distribuidora() {
        return Fil_Distribuidora;
    }

    public void setFil_Distribuidora(int Fil_Distribuidora) {
        this.Fil_Distribuidora = Fil_Distribuidora;
    }

    public String getFil_Situacao() {
        return Fil_Situacao;
    }

    public void setFil_Situacao(String Fil_Situacao) {
        this.Fil_Situacao = Fil_Situacao;
    }
}
