package modelos;

public class Equipo {
    private int id;
    private String nombre;
    private String pais;
    private String grupo; // Nuevo campo según tu SQL
    private String entrenador; // Nuevo campo según tu SQL

    public Equipo() {}

    public Equipo(int id, String nombre, String pais, String grupo, String entrenador) {
        this.id = id;
        this.nombre = nombre;
        this.pais = pais;
        this.grupo = grupo;
        this.entrenador = entrenador;
    }

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getPais() { return pais; }
    public void setPais(String pais) { this.pais = pais; }
    public String getGrupo() { return grupo; }
    public void setGrupo(String grupo) { this.grupo = grupo; }
    public String getEntrenador() { return entrenador; }
    public void setEntrenador(String entrenador) { this.entrenador = entrenador; }
}