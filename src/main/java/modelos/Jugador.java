package modelos;

public class Jugador {
    private int id_jugador;
    private String nombre_completo;
    private int numero_camiseta;
    private int id_equipo;
    private int id_posicion;

    public Jugador() {}

    public Jugador(int id_jugador, String nombre_completo, int numero_camiseta, int id_equipo, int id_posicion) {
        this.id_jugador = id_jugador;
        this.nombre_completo = nombre_completo;
        this.numero_camiseta = numero_camiseta;
        this.id_equipo = id_equipo;
        this.id_posicion = id_posicion;
    }

    public int getId_jugador() { return id_jugador; }
    public void setId_jugador(int id_jugador) { this.id_jugador = id_jugador; }
    public String getNombre_completo() { return nombre_completo; }
    public void setNombre_completo(String nombre_completo) { this.nombre_completo = nombre_completo; }
    public int getNumero_camiseta() { return numero_camiseta; }
    public void setNumero_camiseta(int numero_camiseta) { this.numero_camiseta = numero_camiseta; }
    public int getId_equipo() { return id_equipo; }
    public void setId_equipo(int id_equipo) { this.id_equipo = id_equipo; }
    public int getId_posicion() { return id_posicion; }
    public void setId_posicion(int id_posicion) { this.id_posicion = id_posicion; }
}