package ClasesDAO;

import modelos.Evento;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventoDAO {

    public List<Evento> obtenerTodos() {
        List<Evento> lista = new ArrayList<>();
        String sql = "SELECT id, id_partido, id_jugador, tipo, minuto FROM evento ORDER BY id";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Evento ev = new Evento();
                ev.setId(rs.getInt("id"));
                ev.setId_partido(rs.getInt("id_partido"));
                ev.setId_jugador(rs.getInt("id_jugador"));
                ev.setTipo(rs.getString("tipo"));
                ev.setMinuto(rs.getInt("minuto"));
                lista.add(ev);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar eventos: " + e.getMessage());
        }
        return lista;
    }

    public void insertar(Evento ev) {
        String sql = "INSERT INTO evento (id_partido, id_jugador, tipo, minuto) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, ev.getId_partido());
            ps.setInt(2, ev.getId_jugador());
            ps.setString(3, ev.getTipo());
            ps.setInt(4, ev.getMinuto());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar evento: " + e.getMessage());
        }
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM evento WHERE id = ?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar evento: " + e.getMessage());
        }
    }
}