package modelos;

public class Alineacion {
    // Llave compuesta: id_partido + id_jugador
    private int id_partido;
    private int id_jugador;
    private boolean es_titular;
    private int minutos_jugados;

    public Alineacion() {}

    public Alineacion(int id_partido, int id_jugador, boolean es_titular, int minutos_jugados) {
        this.id_partido = id_partido;
        this.id_jugador = id_jugador;
        this.es_titular = es_titular;
        this.minutos_jugados = minutos_jugados;
    }

    public int getId_partido() { return id_partido; }
    public void setId_partido(int id_partido) { this.id_partido = id_partido; }
    public int getId_jugador() { return id_jugador; }
    public void setId_jugador(int id_jugador) { this.id_jugador = id_jugador; }
    public boolean isEs_titular() { return es_titular; }
    public void setEs_titular(boolean es_titular) { this.es_titular = es_titular; }
    public int getMinutos_jugados() { return minutos_jugados; }
    public void setMinutos_jugados(int minutos_jugados) { this.minutos_jugados = minutos_jugados; }
}