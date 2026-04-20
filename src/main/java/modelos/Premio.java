package modelos;

public class Premio {
    private int id;
    private int idPartido;
    private int idJugador;
    private String nombrePremio;
    private double calificacion;

    public Premio() {}

    public Premio(int id, int idPartido, int idJugador, String nombrePremio, double calificacion) {
        this.id = id;
        this.idPartido = idPartido;
        this.idJugador = idJugador;
        this.nombrePremio = nombrePremio;
        this.calificacion = calificacion;
    }

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getIdPartido() { return idPartido; }
    public void setIdPartido(int idPartido) { this.idPartido = idPartido; }
    public int getIdJugador() { return idJugador; }
    public void setIdJugador(int idJugador) { this.idJugador = idJugador; }
    public String getNombrePremio() { return nombrePremio; }
    public void setNombrePremio(String nombrePremio) { this.nombrePremio = nombrePremio; }
    public double getCalificacion() { return calificacion; }
    public void setCalificacion(double calificacion) { this.calificacion = calificacion; }
}