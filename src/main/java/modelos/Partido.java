package modelos;
import java.util.Date;

public class Partido {
    private int id;
    private int id_equipo_local;
    private int id_equipo_visitante;
    private int id_estadio;
    private int goles_local;
    private int goles_visitante;
    private String fase;
    private Date fecha;

    public Partido() {}
    // Getters y Setters 
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getId_equipo_local() { return id_equipo_local; }
    public void setId_equipo_local(int id_equipo_local) { this.id_equipo_local = id_equipo_local; }
    public int getId_equipo_visitante() { return id_equipo_visitante; }
    public void setId_equipo_visitante(int id_equipo_visitante) { this.id_equipo_visitante = id_equipo_visitante; }
    public int getId_estadio() { return id_estadio; }
    public void setId_estadio(int id_estadio) { this.id_estadio = id_estadio; }
    public int getGoles_local() { return goles_local; }
    public void setGoles_local(int goles_local) { this.goles_local = goles_local; }
    public int getGoles_visitante() { return goles_visitante; }
    public void setGoles_visitante(int goles_visitante) { this.goles_visitante = goles_visitante; }
    public String getFase() { return fase; }
    public void setFase(String fase) { this.fase = fase; }
    public Date getFecha() { return fecha; }
    public void setFecha(Date fecha) { this.fecha = fecha; }
}