package modelos;

public class Patrocinador {
    private int id;
    private String nombre;
    private String tipo;
    private double aporteUsd;

    public Patrocinador() {}

    public Patrocinador(int id, String nombre, String tipo, double aporteUsd) {
        this.id = id;
        this.nombre = nombre;
        this.tipo = tipo;
        this.aporteUsd = aporteUsd;
    }

    // Getters y Setters... (id, nombre, tipo, aporteUsd)
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }
    public double getAporteUsd() { return aporteUsd; }
    public void setAporteUsd(double aporteUsd) { this.aporteUsd = aporteUsd; }
}
