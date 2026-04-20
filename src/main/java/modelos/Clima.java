package modelos;

public class Clima {
    private int id;
    private int idPartido;
    private int temperatura;
    private String condicion;
    private int humedad;

    public Clima() {}

    public Clima(int id, int idPartido, int temperatura, String condicion, int humedad) {
        this.id = id;
        this.idPartido = idPartido;
        this.temperatura = temperatura;
        this.condicion = condicion;
        this.humedad = humedad;
    }

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getIdPartido() { return idPartido; }
    public void setIdPartido(int idPartido) { this.idPartido = idPartido; }
    public int getTemperatura() { return temperatura; }
    public void setTemperatura(int temperatura) { this.temperatura = temperatura; }
    public String getCondicion() { return condicion; }
    public void setCondicion(String condicion) { this.condicion = condicion; }
    public int getHumedad() { return humedad; }
    public void setHumedad(int humedad) { this.humedad = humedad; }
}