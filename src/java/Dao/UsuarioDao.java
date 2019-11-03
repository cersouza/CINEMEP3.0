/*
    Create table Usuario {
	Usu_Codigo int identity(1,1),
        Usu_Usuario varchar(25) not null,
	Usu_Nome varchar(50),
	Usu_Senha varchar(20),
	Usu_Email varchar(100),
	Usu_Situacao varchar(7),
	primary key(Usu_ID)
    }
*/

package Dao;

import Model.*;

public class UsuarioDao {
    public UsuarioDao() {
    }
    
    public int Usu_Codigo;
    public String Usu_Usuario;
    public String Usu_Nome;
    public String Usu_Senha;
    public String Usu_Email;
    public String Usu_Situacao;

    public int getUsu_Codigo() {
        return Usu_Codigo;
    }

    public void setUsu_Codigo(int Usu_Codigo) {
        this.Usu_Codigo = Usu_Codigo;
    }

    public String getUsu_Usuario() {
        return Usu_Usuario;
    }

    public void setUsu_Usuario(String Usu_Usuario) {
        this.Usu_Usuario = Usu_Usuario;
    }

    public String getUsu_Nome() {
        return Usu_Nome;
    }

    public void setUsu_Nome(String Usu_Nome) {
        this.Usu_Nome = Usu_Nome;
    }

    public String getUsu_Senha() {
        return Usu_Senha;
    }

    public void setUsu_Senha(String Usu_Senha) {
        this.Usu_Senha = Usu_Senha;
    }

    public String getUsu_Email() {
        return Usu_Email;
    }

    public void setUsu_Email(String Usu_Email) {
        this.Usu_Email = Usu_Email;
    }

    public String getUsu_Situacao() {
        return Usu_Situacao;
    }

    public void setUsu_Situacao(String Usu_Situacao) {
        this.Usu_Situacao = Usu_Situacao;
    }
}