package ClasesDAO;

import modelos.Gol;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GolDAO {

    public List<Gol> obtenerTodos() {
        List<Gol> lista = new ArrayList<>();
        String sql = "SELECT id_partido, id_jugador, minuto, tipo_gol FROM gol";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Gol g = new Gol();
                g.setId_partido(rs.getInt("id_partido"));
                g.setId_jugador(rs.getInt("id_jugador"));
                g.setMinuto(rs.getInt("minuto"));
                g.setTipo_gol(rs.getString("tipo_gol"));
                lista.add(g);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar goles: " + ex.getMessage());
        }
        return lista;
    }

    public void insertar(Gol g) {
        String sql = "INSERT INTO gol (id_partido, id_jugador, minuto, tipo_gol) VALUES (?, ?, ?, ?)";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, g.getId_partido());
            ps.setInt(2, g.getId_jugador());
            ps.setInt(3, g.getMinuto());
            ps.setString(4, g.getTipo_gol());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al insertar gol: " + ex.getMessage());
        }
    }

    // El eliminar usa la llave compuesta completa
    public void eliminar(int id_partido, int id_jugador, int minuto) {
        String sql = "DELETE FROM gol WHERE id_partido = ? AND id_jugador = ? AND minuto = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id_partido);
            ps.setInt(2, id_jugador);
            ps.setInt(3, minuto);
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al eliminar gol: " + ex.getMessage());
        }
    }
}