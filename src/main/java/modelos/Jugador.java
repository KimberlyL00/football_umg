package modelos;

public class Jugador {
    // 1. Atributos
    private int id;
    private int id_equipo;
    private String nombre;
    private String posicion;
    private int numero_playera;
    private boolean jugador_activo;

    // 2. Constructor Vacío 
    public Jugador() {
    }

    // 3. Constructor Completo
    public Jugador(int id, int id_equipo, String nombre, String posicion, int numero_playera, boolean jugador_activo) {
        this.id = id;
        this.id_equipo = id_equipo;
        this.nombre = nombre;
        this.posicion = posicion;
        this.numero_playera = numero_playera;
        this.jugador_activo = jugador_activo;
    }

    // 4. Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getId_equipo() { return id_equipo; }
    public void setId_equipo(int id_equipo) { this.id_equipo = id_equipo; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getPosicion() { return posicion; }
    public void setPosicion(String posicion) { this.posicion = posicion; }

    public int getNumero_playera() { return numero_playera; }
    public void setNumero_playera(int numero_playera) { this.numero_playera = numero_playera; }

    public boolean isJugador_activo() { return jugador_activo; }
    public void setJugador_activo(boolean jugador_activo) { this.jugador_activo = jugador_activo; }

    @Override
    public String toString() {
        return "Jugador: " + nombre + " (#" + numero_playera + ") - " + posicion + " [Activo: " + jugador_activo + "]";
    }
}