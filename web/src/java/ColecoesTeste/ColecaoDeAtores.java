package ColecoesTeste;

import Model.Ator;
import java.util.ArrayList;

public class ColecaoDeAtores {
    private ArrayList<Ator> atores = new ArrayList();

    public ColecaoDeAtores() {
        Ator ator1 = new Ator(0, "Brie Larson", "1989-11-01");
        atores.add(ator1);
        
        Ator ator2 = new Ator(1, "Samuel L. Jackson", "1948-12-21");
        atores.add(ator2);
        
        Ator ator3 = new Ator(2, "Jude Law", "1972-12-29");
        atores.add(ator3);
    }

    public ArrayList<Ator> getAtores() {
        return atores;
    }
    
    public Ator getAtorById(int id) {
        return this.atores.get(id);
    }
    
}
