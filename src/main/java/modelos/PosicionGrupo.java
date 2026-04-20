package modelos;

public class PosicionGrupo {
    private int idEquipo;
    private int puntos;
    private int pj; // Partidos Jugados
    private int golesFavor;
    private int golesContra;

    public PosicionGrupo() {}

    public PosicionGrupo(int idEquipo, int puntos, int pj, int golesFavor, int golesContra) {
        this.idEquipo = idEquipo;
        this.puntos = puntos;
        this.pj = pj;
        this.golesFavor = golesFavor;
        this.golesContra = golesContra;
    }

    // Getters y Setters
    public int getIdEquipo() { return idEquipo; }
    public void setIdEquipo(int idEquipo) { this.idEquipo = idEquipo; }
    public int getPuntos() { return puntos; }
    public void setPuntos(int puntos) { this.puntos = puntos; }
    public int getPj() { return pj; }
    public void setPj(int pj) { this.pj = pj; }
    public int getGolesFavor() { return golesFavor; }
    public void setGolesFavor(int golesFavor) { this.golesFavor = golesFavor; }
    public int getGolesContra() { return golesContra; }
    public void setGolesContra(int golesContra) { this.golesContra = golesContra; }
}