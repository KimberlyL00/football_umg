package modelos;

public class Evento {
    // 1. Atributos
    private int id;
    private int id_partido;
    private int id_jugador;
    private String tipo;
    private int minuto;

    // 2. Constructor 
    public Evento() {
    }

    // 3. Constructor con Parámetros
    public Evento(int id, int id_partido, int id_jugador, String tipo, int minuto) {
        this.id = id;
        this.id_partido = id_partido;
        this.id_jugador = id_jugador;
        this.tipo = tipo;
        this.minuto = minuto;
    }

    // 4. Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getId_partido() { return id_partido; }
    public void setId_partido(int id_partido) { this.id_partido = id_partido; }

    public int getId_jugador() { return id_jugador; }
    public void setId_jugador(int id_jugador) { this.id_jugador = id_jugador; }

    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }

    public int getMinuto() { return minuto; }
    public void setMinuto(int minuto) { this.minuto = minuto; }
}