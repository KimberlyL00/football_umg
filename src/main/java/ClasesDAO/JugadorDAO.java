package ClasesDAO;

import modelos.Jugador;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JugadorDAO {

    public List<Jugador> obtenerTodos() {
        List<Jugador> lista = new ArrayList<>();
        String sql = "SELECT id_jugador, nombre_completo, numero_camiseta, id_equipo, id_posicion FROM jugador";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Jugador j = new Jugador();
                j.setId_jugador(rs.getInt("id_jugador"));
                j.setNombre_completo(rs.getString("nombre_completo"));
                j.setNumero_camiseta(rs.getInt("numero_camiseta"));
                j.setId_equipo(rs.getInt("id_equipo"));
                j.setId_posicion(rs.getInt("id_posicion"));
                lista.add(j);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar jugadores: " + ex.getMessage());
        }
        return lista;
    }

    public void insertar(Jugador j) {
        String sql = "INSERT INTO jugador (nombre_completo, numero_camiseta, id_equipo, id_posicion) VALUES (?, ?, ?, ?)";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, j.getNombre_completo());
            ps.setInt(2, j.getNumero_camiseta());
            ps.setInt(3, j.getId_equipo());
            ps.setInt(4, j.getId_posicion());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al insertar jugador: " + ex.getMessage());
        }
    }

    public void actualizar(Jugador j) {
        String sql = "UPDATE jugador SET nombre_completo = ?, numero_camiseta = ?, id_equipo = ?, id_posicion = ? WHERE id_jugador = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, j.getNombre_completo());
            ps.setInt(2, j.getNumero_camiseta());
            ps.setInt(3, j.getId_equipo());
            ps.setInt(4, j.getId_posicion());
            ps.setInt(5, j.getId_jugador());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al actualizar jugador: " + ex.getMessage());
        }
    }

    public void eliminar(int id_jugador) {
        String sql = "DELETE FROM jugador WHERE id_jugador = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id_jugador);
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al eliminar jugador: " + ex.getMessage());
        }
    }
}
