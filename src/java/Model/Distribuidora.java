/*

create table Distribuidora(
    Dis_Codigo int identity(1,1),
    Dis_RazaoSocial varchar(50),
    Dis_NomeFantasia varchar(50),
    Dis_Cnpj varchar(14),
    Dis_Site varchar(100),
    Dis_Email varchar(100),
    Dis_Endereco varchar(60),
    Dis_Bairro varchar(40),
    Dis_Cidade varchar(32),
    Dis_Estado char(2),
    Dis_Numero varchar(5),
    Dis_Ie varchar(14),
    primary key(Dis_Codigo)
);

*/
package Model;

public class Distribuidora {
    public Distribuidora(){};
    
    public int Dis_Codigo;
    public String Dis_RazaoSocial;
    public String Dis_NomeFantasia;
    public String Dis_Cnpj;
    public String Dis_Site;
    public String Dis_Email;
    public String Dis_Endereco;
    public String Dis_Bairro;
    public String Dis_Cidade;
    public String Dis_Estado;
    public String Dis_Numero;
    public String Dis_Ie;
    
    public String getDis_RazaoSocial() {
        return Dis_RazaoSocial;
    }

    public void setDis_RazaoSocial(String Dis_RazaoSocial) {
        this.Dis_RazaoSocial = Dis_RazaoSocial;
    }

    public String getDis_NomeFantasia() {
        return Dis_NomeFantasia;
    }

    public void setDis_NomeFantasia(String Dis_NomeFantasia) {
        this.Dis_NomeFantasia = Dis_NomeFantasia;
    }

    public String getDis_Cnpj() {
        return Dis_Cnpj;
    }

    public void setDis_Cnpj(String Dis_Cnpj) {
        this.Dis_Cnpj = Dis_Cnpj;
    }

    public String getDis_Site() {
        return Dis_Site;
    }

    public void setDis_Site(String Dis_Site) {
        this.Dis_Site = Dis_Site;
    }

    public String getDis_Email() {
        return Dis_Email;
    }

    public void setDis_Email(String Dis_Email) {
        this.Dis_Email = Dis_Email;
    }

    public String getDis_Endereco() {
        return Dis_Endereco;
    }

    public void setDis_Endereco(String Dis_Endereco) {
        this.Dis_Endereco = Dis_Endereco;
    }

    public String getDis_Bairro() {
        return Dis_Bairro;
    }

    public void setDis_Bairro(String Dis_Bairro) {
        this.Dis_Bairro = Dis_Bairro;
    }

    public String getDis_Cidade() {
        return Dis_Cidade;
    }

    public void setDis_Cidade(String Dis_Cidade) {
        this.Dis_Cidade = Dis_Cidade;
    }

    public String getDis_Estado() {
        return Dis_Estado;
    }

    public void setDis_Estado(String Dis_Estado) {
        this.Dis_Estado = Dis_Estado;
    }

    public String getDis_Numero() {
        return Dis_Numero;
    }

    public void setDis_Numero(String Dis_Numero) {
        this.Dis_Numero = Dis_Numero;
    }

    public String getDis_Ie() {
        return Dis_Ie;
    }

    public void setDis_Ie(String Dis_Ie) {
        this.Dis_Ie = Dis_Ie;
    }
}
