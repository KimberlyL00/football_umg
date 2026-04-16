package ClasesDAO;

import modelos.Jugador;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JugadorDAO {

    // CREATE - Insertar jugador
    public void insertar(Jugador jugador) {
        String sql = "INSERT INTO jugador (id_equipo, nombre, posicion, numero_playera, jugador_activo) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, jugador.getId_equipo());
            ps.setString(2, jugador.getNombre());
            ps.setString(3, jugador.getPosicion());
            ps.setInt(4, jugador.getNumero_playera());
            ps.setBoolean(5, jugador.isJugador_activo());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al insertar jugador: " + e.getMessage());
        }
    }

    // READ - Obtener todos los jugadores
    public List<Jugador> obtenerTodos() {
        List<Jugador> lista = new ArrayList<>();
        String sql = "SELECT * FROM jugador";
        try (Connection conn = ConexionDB.conectar();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                Jugador j = new Jugador(
                    rs.getInt("id"),
                    rs.getInt("id_equipo"),
                    rs.getString("nombre"),
                    rs.getString("posicion"),
                    rs.getInt("numero_playera"),
                    rs.getBoolean("jugador_activo")
                );
                lista.add(j);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener jugadores: " + e.getMessage());
        }
        return lista;
    }

    // READ - Obtener jugadores por equipo
    public List<Jugador> obtenerPorEquipo(int idEquipo) {
        List<Jugador> lista = new ArrayList<>();
        String sql = "SELECT * FROM jugador WHERE id_equipo = ?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idEquipo);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Jugador j = new Jugador(
                    rs.getInt("id"),
                    rs.getInt("id_equipo"),
                    rs.getString("nombre"),
                    rs.getString("posicion"),
                    rs.getInt("numero_playera"),
                    rs.getBoolean("jugador_activo")
                );
                lista.add(j);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener jugadores por equipo: " + e.getMessage());
        }
        return lista;
    }

    // UPDATE - Actualizar jugador
    public void actualizar(Jugador jugador) {
        String sql = "UPDATE jugador SET id_equipo=?, nombre=?, posicion=?, numero_playera=?, jugador_activo=? WHERE id=?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, jugador.getId_equipo());
            ps.setString(2, jugador.getNombre());
            ps.setString(3, jugador.getPosicion());
            ps.setInt(4, jugador.getNumero_playera());
            ps.setBoolean(5, jugador.isJugador_activo());
            ps.setInt(6, jugador.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al actualizar jugador: " + e.getMessage());
        }
    }

    // DELETE - Eliminar jugador
    public void eliminar(int id) {
        String sql = "DELETE FROM jugador WHERE id=?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al eliminar jugador: " + e.getMessage());
        }
    }
}