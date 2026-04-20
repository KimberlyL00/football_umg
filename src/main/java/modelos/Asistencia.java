package modelos;

public class Asistencia {
    private int id;
    private int idPartido;
    private int cantidadGente;
    private double precioEntrada;

    public Asistencia() {}

    public Asistencia(int id, int idPartido, int cantidadGente, double precioEntrada) {
        this.id = id;
        this.idPartido = idPartido;
        this.cantidadGente = cantidadGente;
        this.precioEntrada = precioEntrada;
    }

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getIdPartido() { return idPartido; }
    public void setIdPartido(int idPartido) { this.idPartido = idPartido; }
    public int getCantidadGente() { return cantidadGente; }
    public void setCantidadGente(int cantidadGente) { this.cantidadGente = cantidadGente; }
    public double getPrecioEntrada() { return precioEntrada; }
    public void setPrecioEntrada(double precioEntrada) { this.precioEntrada = precioEntrada; }
}