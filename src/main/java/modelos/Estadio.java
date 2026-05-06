package modelos;

public class Estadio {
    private int id_estadio;
    private String nombre;
    private String ciudad;

    public Estadio() {}

    public Estadio(int id_estadio, String nombre, String ciudad) {
        this.id_estadio = id_estadio;
        this.nombre = nombre;
        this.ciudad = ciudad;
    }

    public int getId_estadio() { return id_estadio; }
    public void setId_estadio(int id_estadio) { this.id_estadio = id_estadio; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getCiudad() { return ciudad; }
    public void setCiudad(String ciudad) { this.ciudad = ciudad; }
}