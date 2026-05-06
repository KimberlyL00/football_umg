package ClasesDAO;

import modelos.Alineacion;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlineacionDAO {

    public List<Alineacion> obtenerTodos() {
        List<Alineacion> lista = new ArrayList<>();
        String sql = "SELECT id_partido, id_jugador, es_titular, minutos_jugados FROM alineacion";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Alineacion a = new Alineacion();
                a.setId_partido(rs.getInt("id_partido"));
                a.setId_jugador(rs.getInt("id_jugador"));
                a.setEs_titular(rs.getBoolean("es_titular"));
                a.setMinutos_jugados(rs.getInt("minutos_jugados"));
                lista.add(a);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar alineaciones: " + ex.getMessage());
        }
        return lista;
    }

    public void insertar(Alineacion a) {
        String sql = "INSERT INTO alineacion (id_partido, id_jugador, es_titular, minutos_jugados) VALUES (?, ?, ?, ?)";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, a.getId_partido());
            ps.setInt(2, a.getId_jugador());
            ps.setBoolean(3, a.isEs_titular());
            ps.setInt(4, a.getMinutos_jugados());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al insertar alineacion: " + ex.getMessage());
        }
    }

    public void actualizar(Alineacion a) {
        String sql = "UPDATE alineacion SET es_titular = ?, minutos_jugados = ? WHERE id_partido = ? AND id_jugador = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setBoolean(1, a.isEs_titular());
            ps.setInt(2, a.getMinutos_jugados());
            ps.setInt(3, a.getId_partido());
            ps.setInt(4, a.getId_jugador());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al actualizar alineacion: " + ex.getMessage());
        }
    }

    public void eliminar(int id_partido, int id_jugador) {
        String sql = "DELETE FROM alineacion WHERE id_partido = ? AND id_jugador = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id_partido);
            ps.setInt(2, id_jugador);
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al eliminar alineacion: " + ex.getMessage());
        }
    }
}
