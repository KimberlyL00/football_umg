package modelos;

public class Equipo {
    private int id_equipo;
    private String nombre_equipo;
    private int id_pais;
    private char grupo;

    public Equipo() {}

    public Equipo(int id_equipo, String nombre_equipo, int id_pais, char grupo) {
        this.id_equipo = id_equipo;
        this.nombre_equipo = nombre_equipo;
        this.id_pais = id_pais;
        this.grupo = grupo;
    }

    public int getId_equipo() { return id_equipo; }
    public void setId_equipo(int id_equipo) { this.id_equipo = id_equipo; }
    public String getNombre_equipo() { return nombre_equipo; }
    public void setNombre_equipo(String nombre_equipo) { this.nombre_equipo = nombre_equipo; }
    public int getId_pais() { return id_pais; }
    public void setId_pais(int id_pais) { this.id_pais = id_pais; }
    public char getGrupo() { return grupo; }
    public void setGrupo(char grupo) { this.grupo = grupo; }
}