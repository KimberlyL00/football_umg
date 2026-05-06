package modelos;

import java.sql.Timestamp;

public class Partido {
    private int id_partido;
    private Timestamp fecha_hora;
    private int id_estadio;
    private int id_fase;
    private int id_equipo_local;
    private int id_equipo_visitante;
    private int goles_local;
    private int goles_visitante;

    public Partido() {}

    public int getId_partido() { return id_partido; }
    public void setId_partido(int id_partido) { this.id_partido = id_partido; }
    public Timestamp getFecha_hora() { return fecha_hora; }
    public void setFecha_hora(Timestamp fecha_hora) { this.fecha_hora = fecha_hora; }
    public int getId_estadio() { return id_estadio; }
    public void setId_estadio(int id_estadio) { this.id_estadio = id_estadio; }
    public int getId_fase() { return id_fase; }
    public void setId_fase(int id_fase) { this.id_fase = id_fase; }
    public int getId_equipo_local() { return id_equipo_local; }
    public void setId_equipo_local(int id_equipo_local) { this.id_equipo_local = id_equipo_local; }
    public int getId_equipo_visitante() { return id_equipo_visitante; }
    public void setId_equipo_visitante(int id_equipo_visitante) { this.id_equipo_visitante = id_equipo_visitante; }
    public int getGoles_local() { return goles_local; }
    public void setGoles_local(int goles_local) { this.goles_local = goles_local; }
    public int getGoles_visitante() { return goles_visitante; }
    public void setGoles_visitante(int goles_visitante) { this.goles_visitante = goles_visitante; }
}