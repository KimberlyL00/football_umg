package modelos;

public class Equipo {
    // 1. Atributos 
    private int id;
    private String nombre;
    private String pais;
    private String Grupo;
    
    // 2. Constructor Vacío
    public Equipo() {
    }

    // 3. Constructor con Parámetros 
    public Equipo(int id, String nombre, String pais, String Grupo) {
        this.id = id;
        this.nombre = nombre;
        this.pais = pais;
        this.Grupo = Grupo;
    }

    // 4. Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getPais() { return pais; }
    public void setPais(String pais) { this.pais = pais; }
    
    public String getGrupo() { return Grupo; }
    public void setGrupo(String Grupo) { this.Grupo = Grupo; }
}