package ClasesDAO;

import modelos.Jugador;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JugadorDAO {

    public List<Jugador> obtenerTodos() {
        List<Jugador> lista = new ArrayList<>();
        String sql = "SELECT id, id_equipo, nombre, posicion, numero_playera, jugador_activo FROM jugador ORDER BY id";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Jugador j = new Jugador();
                j.setId(rs.getInt("id"));
                j.setId_equipo(rs.getInt("id_equipo"));
                j.setNombre(rs.getString("nombre"));
                j.setPosicion(rs.getString("posicion"));
                j.setNumero_playera(rs.getInt("numero_playera"));
                j.setJugador_activo(rs.getBoolean("jugador_activo"));
                lista.add(j);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar jugadores: " + e.getMessage());
        }
        return lista;
    }

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

    public void eliminar(int id) {
        String sql = "DELETE FROM jugador WHERE id = ?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar jugador: " + e.getMessage());
        }
    }
}