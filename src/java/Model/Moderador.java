/*

    Create table Moderador {
	Mod_Codigo int identity(1,1),
        Mod_Usuario varchar(25) not null,
	Mod_Nome varchar(50),
	Mod_Senha varchar(20),
	Mod_Email varchar(100),
	Mod_Telefone varchar(15),
	Mod_CPF char(11),
	Mod_Situacao varchar(7),
	primary key(Mod_ID)
    }

 */
package Model;

public class Moderador {
    
    public Moderador() {
    };
    
    public int Mod_Codigo;
    public String Mod_Usuario;
    public String Mod_Nome;
    public String Mod_Senha;
    public String Mod_Email;
    public String Mod_Telefone;
    public String Mod_CPF;
    public String Mod_Situacao;

    public int getMod_Codigo() {
        return Mod_Codigo;
    }

    public void setMod_Codigo(int Mod_Codigo) {
        this.Mod_Codigo = Mod_Codigo;
    }

    public String getMod_Usuario() {
        return Mod_Usuario;
    }

    public void setMod_Usuario(String Mod_Usuario) {
        this.Mod_Usuario = Mod_Usuario;
    }

    public String getMod_Nome() {
        return Mod_Nome;
    }

    public void setMod_Nome(String Mod_Nome) {
        this.Mod_Nome = Mod_Nome;
    }

    public String getMod_Senha() {
        return Mod_Senha;
    }

    public void setMod_Senha(String Mod_Senha) {
        this.Mod_Senha = Mod_Senha;
    }

    public String getMod_Email() {
        return Mod_Email;
    }

    public void setMod_Email(String Mod_Email) {
        this.Mod_Email = Mod_Email;
    }

    public String getMod_Telefone() {
        return Mod_Telefone;
    }

    public void setMod_Telefone(String Mod_Telefone) {
        this.Mod_Telefone = Mod_Telefone;
    }

    public String getMod_CPF() {
        return Mod_CPF;
    }

    public void setMod_CPF(String Mod_CPF) {
        this.Mod_CPF = Mod_CPF;
    }

    public String getMod_Situacao() {
        return Mod_Situacao;
    }

    public void setMod_Situacao(String Mod_Situacao) {
        this.Mod_Situacao = Mod_Situacao;
    }

    
}
