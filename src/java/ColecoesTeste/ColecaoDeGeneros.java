package ColecoesTeste;

import Model.Genero;
import java.io.Serializable;
import java.util.ArrayList;

public class ColecaoDeGeneros implements Serializable{
    private ArrayList<Genero> generos = new ArrayList();
    
    public ColecaoDeGeneros(){
        Genero genero = new Genero(0, "Aventura");
        generos.add(genero);
        
        Genero genero2 = new Genero(1, "Ação");
        generos.add(genero2);
        
        Genero genero3 = new Genero(2, "Animação");
        generos.add(genero3);
        
        Genero genero4 = new Genero(3, "Comédia");
        generos.add(genero4);
        
        Genero genero5 = new Genero(4, "Romance");
        generos.add(genero5);
        
        Genero genero6 = new Genero(5, "Documentário");
        generos.add(genero6);
        
        Genero genero7 = new Genero(7, "Drama");
        generos.add(genero7);
        
        Genero genero8 = new Genero(8, "Suspense");
        generos.add(genero8);
        
        Genero genero9 = new Genero(9, "Terror");
        generos.add(genero9);
        
        Genero genero10 = new Genero(10, "Ficção Científica");
        generos.add(genero10);
    }
    
    public ArrayList<Genero> getGeneros(){
        return this.generos;
    }
}
