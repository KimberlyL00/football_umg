package controladores;

public class Posicion {

    private int idEquipo;
    private String nombreEquipo;

    private int pj;
    private int pg;
    private int pe;
    private int pp;

    private int gf;
    private int gc;

    private int puntos; // IMPORTANTE

    public Posicion() {
        this.pj = 0;
        this.pg = 0;
        this.pe = 0;
        this.pp = 0;
        this.gf = 0;
        this.gc = 0;
        this.puntos = 0;
    }

    public int getIdEquipo() { return idEquipo; }
    public void setIdEquipo(int idEquipo) { this.idEquipo = idEquipo; }

    public String getNombreEquipo() { return nombreEquipo; }
    public void setNombreEquipo(String nombreEquipo) { this.nombreEquipo = nombreEquipo; }

    public int getPj() { return pj; }
    public void setPj(int pj) { this.pj = pj; }

    public int getPg() { return pg; }
    public void setPg(int pg) { this.pg = pg; }

    public int getPe() { return pe; }
    public void setPe(int pe) { this.pe = pe; }

    public int getPp() { return pp; }
    public void setPp(int pp) { this.pp = pp; }

    public int getGf() { return gf; }
    public void setGf(int gf) { this.gf = gf; }

    public int getGc() { return gc; }
    public void setGc(int gc) { this.gc = gc; }

    public int getPuntos() { return puntos; }
    public void setPuntos(int puntos) { this.puntos = puntos; }
}