package modelos;

public class Gol {
    // Llave compuesta: id_partido + id_jugador + minuto
    private int id_partido;
    private int id_jugador;
    private int minuto;
    private String tipo_gol; // Valores posibles: Normal, Penal, Autogol

    public Gol() {}

    public Gol(int id_partido, int id_jugador, int minuto, String tipo_gol) {
        this.id_partido = id_partido;
        this.id_jugador = id_jugador;
        this.minuto = minuto;
        this.tipo_gol = tipo_gol;
    }

    public int getId_partido() { return id_partido; }
    public void setId_partido(int id_partido) { this.id_partido = id_partido; }
    public int getId_jugador() { return id_jugador; }
    public void setId_jugador(int id_jugador) { this.id_jugador = id_jugador; }
    public int getMinuto() { return minuto; }
    public void setMinuto(int minuto) { this.minuto = minuto; }
    public String getTipo_gol() { return tipo_gol; }
    public void setTipo_gol(String tipo_gol) { this.tipo_gol = tipo_gol; }
}