package modelos;

public class Amonestacion {
    // Llave compuesta: id_partido + id_jugador + minuto
    private int id_partido;
    private int id_jugador;
    private int minuto;
    private String color_tarjeta; // Valores posibles: Amarilla, Roja

    public Amonestacion() {}

    public Amonestacion(int id_partido, int id_jugador, int minuto, String color_tarjeta) {
        this.id_partido = id_partido;
        this.id_jugador = id_jugador;
        this.minuto = minuto;
        this.color_tarjeta = color_tarjeta;
    }

    public int getId_partido() { return id_partido; }
    public void setId_partido(int id_partido) { this.id_partido = id_partido; }
    public int getId_jugador() { return id_jugador; }
    public void setId_jugador(int id_jugador) { this.id_jugador = id_jugador; }
    public int getMinuto() { return minuto; }
    public void setMinuto(int minuto) { this.minuto = minuto; }
    public String getColor_tarjeta() { return color_tarjeta; }
    public void setColor_tarjeta(String color_tarjeta) { this.color_tarjeta = color_tarjeta; }
}