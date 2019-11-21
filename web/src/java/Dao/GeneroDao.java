/*
    
    Create table Genero(
        Gen_Codigo int,
        Gen_Descricao varchar(50),
        primary key(Gen_Codigo)
    );

*/
package Dao;

import Model.*;

public class GeneroDao {
    public GeneroDao(){
    };
    
    public int Gen_Codigo;
    public String Gen_Descricao;

    public int getGen_Codigo() {
        return Gen_Codigo;
    }

    public void setGen_Codigo(int Gen_Codigo) {
        this.Gen_Codigo = Gen_Codigo;
    }

    public String getGen_Descricao() {
        return Gen_Descricao;
    }

    public void setGen_Descricao(String Gen_Descricao) {
        this.Gen_Descricao = Gen_Descricao;
    }
    
    
}
