package ClasesDAO;

import modelos.Evento;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventoDAO {

    // CREATE
    public void insertar(Evento evento) {
        String sql = "INSERT INTO evento (id_partido, id_jugador, tipo, minuto) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, evento.getId_partido());
            ps.setInt(2, evento.getId_jugador());
            ps.setString(3, evento.getTipo());
            ps.setInt(4, evento.getMinuto());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al insertar evento: " + e.getMessage());
        }
    }

    // READ - todos
    public List<Evento> obtenerTodos() {
        List<Evento> lista = new ArrayList<>();
        String sql = "SELECT * FROM evento";
        try (Connection conn = ConexionDB.conectar();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                Evento e = new Evento(
                    rs.getInt("id"),
                    rs.getInt("id_partido"),
                    rs.getInt("id_jugador"),
                    rs.getString("tipo"),
                    rs.getInt("minuto")
                );
                lista.add(e);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener eventos: " + e.getMessage());
        }
        return lista;
    }

    // READ - por partido
    public List<Evento> obtenerPorPartido(int idPartido) {
        List<Evento> lista = new ArrayList<>();
        String sql = "SELECT * FROM evento WHERE id_partido = ?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idPartido);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Evento e = new Evento(
                    rs.getInt("id"),
                    rs.getInt("id_partido"),
                    rs.getInt("id_jugador"),
                    rs.getString("tipo"),
                    rs.getInt("minuto")
                );
                lista.add(e);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener eventos por partido: " + e.getMessage());
        }
        return lista;
    }

    // READ - goleadores (para el Pichichi)
    public List<Object[]> obtenerGoleadores() {
        List<Object[]> lista = new ArrayList<>();
        String sql = "SELECT j.nombre, COUNT(*) as goles " +
                     "FROM evento e " +
                     "JOIN jugador j ON e.id_jugador = j.id " +
                     "WHERE e.tipo = 'GOL' " +
                     "GROUP BY j.nombre " +
                     "ORDER BY goles DESC";
        try (Connection conn = ConexionDB.conectar();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                Object[] fila = {rs.getString("nombre"), rs.getInt("goles")};
                lista.add(fila);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener goleadores: " + e.getMessage());
        }
        return lista;
    }

    // UPDATE
    public void actualizar(Evento evento) {
        String sql = "UPDATE evento SET id_partido=?, id_jugador=?, tipo=?, minuto=? WHERE id=?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, evento.getId_partido());
            ps.setInt(2, evento.getId_jugador());
            ps.setString(3, evento.getTipo());
            ps.setInt(4, evento.getMinuto());
            ps.setInt(5, evento.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al actualizar evento: " + e.getMessage());
        }
    }

    // DELETE
    public void eliminar(int id) {
        String sql = "DELETE FROM evento WHERE id=?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al eliminar evento: " + e.getMessage());
        }
    }
}