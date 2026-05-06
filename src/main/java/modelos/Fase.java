package modelos;

public class Fase {
    private int id_fase;
    private String descripcion;

    public Fase() {}

    public Fase(int id_fase, String descripcion) {
        this.id_fase = id_fase;
        this.descripcion = descripcion;
    }

    public int getId_fase() { return id_fase; }
    public void setId_fase(int id_fase) { this.id_fase = id_fase; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
}