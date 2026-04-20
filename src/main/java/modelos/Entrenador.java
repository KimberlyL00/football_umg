package modelos;

public class Entrenador {
    private int id;
    private String nombre;
    private String pais;
    private int idEquipo;

    public Entrenador() {}

    public Entrenador(int id, String nombre, String pais, int idEquipo) {
        this.id = id;
        this.nombre = nombre;
        this.pais = pais;
        this.idEquipo = idEquipo;
    }

    // Getters y Setters... (id, nombre, pais, idEquipo)
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getPais() { return pais; }
    public void setPais(String pais) { this.pais = pais; }
    public int getIdEquipo() { return idEquipo; }
    public void setIdEquipo(int idEquipo) { this.idEquipo = idEquipo; }
}