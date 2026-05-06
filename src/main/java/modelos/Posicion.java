package modelos;

public class Posicion {
    private int id_posicion;
    private String descripcion;

    public Posicion() {}

    public Posicion(int id_posicion, String descripcion) {
        this.id_posicion = id_posicion;
        this.descripcion = descripcion;
    }

    public int getId_posicion() { return id_posicion; }
    public void setId_posicion(int id_posicion) { this.id_posicion = id_posicion; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
}