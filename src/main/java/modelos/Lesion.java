package modelos;

public class Lesion {
    private int id;
    private int idJugador;
    private String descripcion;
    private String tiempoRecup;

    public Lesion() {}

    public Lesion(int id, int idJugador, String descripcion, String tiempoRecup) {
        this.id = id;
        this.idJugador = idJugador;
        this.descripcion = descripcion;
        this.tiempoRecup = tiempoRecup;
    }

    // Getters y Setters...
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getIdJugador() { return idJugador; }
    public void setIdJugador(int idJugador) { this.idJugador = idJugador; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
    public String getTiempoRecup() { return tiempoRecup; }
    public void setTiempoRecup(String tiempoRecup) { this.tiempoRecup = tiempoRecup; }
}