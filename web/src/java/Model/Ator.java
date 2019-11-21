/* 
    create table Ator(
        Atr_Codigo int auto_increment,
        Atr_Nome varchar(50) not null,
        Atr_DataNasc Date,
        primary key(Atr_Codigo)
    );
*/
package Model;

public class Ator {
    private int Atr_Codigo;
    private String Atr_Nome;
    private String Atr_DataNasc;

    public Ator(int Atr_Codigo, String Atr_Nome, String Atr_DataNasc) {
        this.Atr_Codigo = Atr_Codigo;
        this.Atr_Nome = Atr_Nome;
        this.Atr_DataNasc = Atr_DataNasc;
    }   
    
    public int getAtr_Codigo() {
        return Atr_Codigo;
    }

    public void setAtr_Codigo(int Atr_Codigo) {
        this.Atr_Codigo = Atr_Codigo;
    }

    public String getAtr_Nome() {
        return Atr_Nome;
    }

    public void setAtr_Nome(String Atr_Nome) {
        this.Atr_Nome = Atr_Nome;
    }

    public String getAtr_DataNasc() {
        return Atr_DataNasc;
    }

    public void setAtr_DataNasc(String Atr_DataNasc) {
        this.Atr_DataNasc = Atr_DataNasc;
    }
}
