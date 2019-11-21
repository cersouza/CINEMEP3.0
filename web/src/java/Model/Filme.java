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
package Model;
import ColecoesTeste.ColecaoDeAtores;
import ColecoesTeste.ColecaoDeGeneros;
import java.util.ArrayList;

public class Filme {   
    
    private int Fil_Codigo;
    private String Fil_Titulo;
    private String Fil_Sinopse;
    private String Fil_Foto;
    private String Fil_Wallpaper;
    private String Fil_Lancamento;
    private String Fil_Tempo;
    private int Fil_Genero;    
    private int Fil_Classificacao;
    private int Fil_Distribuidora;
    private String Fil_Situacao;
    
    private String Fil_GeneroDesc;
    private String Fil_Link;
    
    private ArrayList<String> Fil_Atores = new ArrayList();
    
    public static ColecaoDeGeneros generos = new ColecaoDeGeneros();
    public static ColecaoDeAtores atores = new ColecaoDeAtores();

    public Filme(int Fil_Codigo, String Fil_Titulo, String Fil_Sinopse, String Fil_Foto, String Fil_Wallpaper, String Fil_Lancamento, String Fil_Tempo, int Fil_Genero, int Fil_Classificacao, int Fil_Distribuidora, String Fil_Situacao) {
        this.Fil_Codigo = Fil_Codigo;
        this.Fil_Titulo = Fil_Titulo;
        this.Fil_Sinopse = Fil_Sinopse;
        this.Fil_Foto = Fil_Foto;
        this.Fil_Wallpaper = Fil_Wallpaper;
        this.Fil_Lancamento = Fil_Lancamento;
        this.Fil_Tempo = Fil_Tempo;
        this.Fil_Genero = Fil_Genero;
        
        // Adicionando Gênero Descrição 
        this.Fil_GeneroDesc = generos.getGeneros().get(Fil_Genero).getGen_Descricao();
        
        //Adicionando Link padrão
        this.Fil_Link = "filme.jsp?id=" + this.Fil_Codigo;
        
        //Adicionando Nomes de atores
        this.Fil_Atores.add(atores.getAtorById(0).getAtr_Nome());
        this.Fil_Atores.add(atores.getAtorById(1).getAtr_Nome());
        this.Fil_Atores.add(atores.getAtorById(2).getAtr_Nome());
                
        this.Fil_Classificacao = Fil_Classificacao;
        this.Fil_Distribuidora = Fil_Distribuidora;
        this.Fil_Situacao = Fil_Situacao;
    }

    public ArrayList<String> getFil_Atores() {
        return Fil_Atores;
    }

    public void setFil_Atores(ArrayList<String> Fil_Atores) {
        this.Fil_Atores = Fil_Atores;
    }
    
    public String getFil_Link() {
        return Fil_Link;
    }

    public void setFil_Link(String Fil_Link) {
        this.Fil_Link = Fil_Link;
    }

    public String getFil_GeneroDesc() {
        return Fil_GeneroDesc;
    }

    public void setFil_GeneroDesc(String Fil_GeneroDesc) {
        this.Fil_GeneroDesc = Fil_GeneroDesc;
    }
        
    public String getFil_Wallpaper() {
        return Fil_Wallpaper;
    }

    public void setFil_Wallpaper(String Fil_Wallpaper) {
        this.Fil_Wallpaper = Fil_Wallpaper;
    }

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

    public String getFil_Lancamento() {
        return Fil_Lancamento;
    }

    public void setFil_Lancamento(String Fil_Lancamento) {
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
    
    /**
     * Retorna o caminho da imagem de Classificação
     * @return {String} 
     */
    public String getImage_Fil_Classificacao() {
        return "resources/img/classificacao_" + Fil_Classificacao + ".png";
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
