/*
    
    Create table Genero(
        Gen_Codigo int,
        Gen_Descricao varchar(50),
        primary key(Gen_Codigo)
    );

*/
package Model;

import ColecoesTeste.ColecaoDeFilmes;

public class Genero {    
    private int Gen_Codigo;
    private String Gen_Descricao;
    private int Gen_Qtd_Fil = 0;       
    
    public Genero(int Gen_Codigo, String Gen_Descricao) {
        this.Gen_Codigo = Gen_Codigo;
        this.Gen_Descricao = Gen_Descricao; 
    }
    
    public int getGen_Qtd_Fil() {
        //Conta Quantidade de Filmes com este Gênero
        ColecaoDeFilmes filme = new ColecaoDeFilmes();
        
        for(Filme fil : filme.getFilmes()){
            if (fil.getFil_Genero() == this.Gen_Codigo){
                this.Gen_Qtd_Fil = this.Gen_Qtd_Fil + 1;
            }
        }
        
        return Gen_Qtd_Fil;
    }

    public void setGen_Qtd_Fil(int Gen_Qtd_Fil) {
        this.Gen_Qtd_Fil = Gen_Qtd_Fil;
    }
    
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
