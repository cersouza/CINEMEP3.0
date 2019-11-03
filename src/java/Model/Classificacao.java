/*

    Create table Classificacao(
        Cla_Codigo int,
        Cla_Descricao varchar(50),
        primary key(Cla_codigo)
    );

*/
package Model;

public class Classificacao {
    
    public Classificacao() {
    };
    
    public int Cla_Codigo;
    public String Cla_Descricao;

    public int getCla_Codigo() {
        return Cla_Codigo;
    }

    public void setCla_Codigo(int Cla_Codigo) {
        this.Cla_Codigo = Cla_Codigo;
    }

    public String getCla_Descricao() {
        return Cla_Descricao;
    }

    public void setCla_Descricao(String Cla_Descricao) {
        this.Cla_Descricao = Cla_Descricao;
    }
}
