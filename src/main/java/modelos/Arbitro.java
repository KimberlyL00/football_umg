package modelos;

public class Arbitro {
    private int id;
    private String nombre;
    private String pais;
    private int experiencia;

    public Arbitro() {}

    public Arbitro(int id, String nombre, String pais, int experiencia) {
        this.id = id;
        this.nombre = nombre;
        this.pais = pais;
        this.experiencia = experiencia;
    }

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getPais() { return pais; }
    public void setPais(String pais) { this.pais = pais; }
    public int getExperiencia() { return experiencia; }
    public void setExperiencia(int experiencia) { this.experiencia = experiencia; }
}