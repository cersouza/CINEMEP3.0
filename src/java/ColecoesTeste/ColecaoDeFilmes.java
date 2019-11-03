package ColecoesTeste;

import Model.Filme;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

public class ColecaoDeFilmes implements Serializable{
    private ArrayList<Filme> filmes = new ArrayList();
    
    public ColecaoDeFilmes(){
        Filme filme = new Filme(0, "Capita Marvel", "Carol Danvers (Brie Larson) é uma ex-agente da Força Aérea norte-americana, que, sem se lembrar de sua vida na Terra, é recrutada pelos Kree para fazer parte de seu exército de elite. Inimiga declarada dos Skrull, ela acaba voltando ao seu planeta de origem para impedir uma invasão dos metaformos, e assim vai acabar descobrindo a verdade sobre si, com a ajuda do agente Nick Fury (Samuel L. Jackson) e da gata Goose.", "resources/img/filmes/capa-capita-marvel.jpg", "resources/img/filmes/wallpaper-capita-marvel.jpg", "2019-03-07", "2h10", 1, 1, 1, "Cartaz");        
        filmes.add(filme);
        
        Filme filme2 = new Filme(1, "Vingadores Ultimato", "ApÃ³s Thanos eliminar metade das criaturas vivas, os Vingadores precisam lidar com a dor da perda de amigos e seus entes queridos. Com Tony Stark (Robert Downey Jr.) vagando perdido no espaÃ§o sem Ã¡gua nem comida, Steve Rogers (Chris Evans) e Natasha Romanov (Scarlett Johansson) precisam liderar a resistÃªncia contra o titÃ£ louco", "resources/img/filmes/vingadores-ultimato.jpeg", "resources/img/filmes/wallpaper-vingadores-Ultimato.jpg", "2019-04-25", "03h01", 1, 2, 1, "Ativo");        
        filmes.add(filme2);
        
        Filme filme3 = new Filme(2, "Homem-Aranha: Longe de Casa", "Peter Parker (Tom Holland) está em uma viagem de duas semanas pela Europa, ao lado de seus amigos de colégio, quando é surpreendido pela visita de Nick Fury (Samuel L. Jackson). Convocado para mais uma missão heróica, ele precisa enfrentar vários vilões que surgem em cidades-símbolo do continente, como Londres, Paris e Veneza, e também a aparição do enigmático Mysterio (Jake Gyllenhaal).", "resources/img/filmes/spider-man.jpeg", "resources/img/filmes/wallpaper-spider-man.jpeg", "2019-07-04", "02h30", 4, 1, 1, "Ativo");        
        filmes.add(filme3);
    }
    
    public Collection<Filme> getFilmes(){
        return this.filmes;
    }
    
    public Filme getFilmeById(int id){
        return filmes.get(id);
    }
}
