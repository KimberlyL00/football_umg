package modelos;

public class TicketVenta {
    private int idTicket;
    private String comprador;
    private int idPartido;
    private String sector;
    private double totalPago;

    public TicketVenta() {}

    public TicketVenta(int idTicket, String comprador, int idPartido, String sector, double totalPago) {
        this.idTicket = idTicket;
        this.comprador = comprador;
        this.idPartido = idPartido;
        this.sector = sector;
        this.totalPago = totalPago;
    }

    // Getters y Setters...
    public int getIdTicket() { return idTicket; }
    public void setIdTicket(int idTicket) { this.idTicket = idTicket; }
    public String getComprador() { return comprador; }
    public void setComprador(String comprador) { this.comprador = comprador; }
    public int getIdPartido() { return idPartido; }
    public void setIdPartido(int idPartido) { this.idPartido = idPartido; }
    public String getSector() { return sector; }
    public void setSector(String sector) { this.sector = sector; }
    public double getTotalPago() { return totalPago; }
    public void setTotalPago(double totalPago) { this.totalPago = totalPago; }
}