package modelos;

public class Estadio {
    // 1. Primero los Atributos
    private int id;
    private String nombre;
    private String ciudad;
    private String pais;
    private int capacidad;

    // 2. Luego los Constructores
    public Estadio() {}

    public Estadio(int id, String nombre, String ciudad, String pais, int capacidad) {
        this.id = id;
        this.nombre = nombre;
        this.ciudad = ciudad;
        this.pais = pais;
        this.capacidad = capacidad;
    }

    // 3. Al final los Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getCiudad() { return ciudad; }
    public void setCiudad(String ciudad) { this.ciudad = ciudad; }

    public String getPais() { return pais; }
    public void setPais(String pais) { this.pais = pais; }

    public int getCapacidad() { return capacidad; }
    public void setCapacidad(int capacidad) { this.capacidad = capacidad; }
}