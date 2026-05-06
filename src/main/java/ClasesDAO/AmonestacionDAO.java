package ClasesDAO;

import modelos.Amonestacion;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AmonestacionDAO {

    public List<Amonestacion> obtenerTodos() {
        List<Amonestacion> lista = new ArrayList<>();
        String sql = "SELECT id_partido, id_jugador, minuto, color_tarjeta FROM amonestacion";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Amonestacion a = new Amonestacion();
                a.setId_partido(rs.getInt("id_partido"));
                a.setId_jugador(rs.getInt("id_jugador"));
                a.setMinuto(rs.getInt("minuto"));
                a.setColor_tarjeta(rs.getString("color_tarjeta"));
                lista.add(a);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar amonestaciones: " + ex.getMessage());
        }
        return lista;
    }

    public void insertar(Amonestacion a) {
        String sql = "INSERT INTO amonestacion (id_partido, id_jugador, minuto, color_tarjeta) VALUES (?, ?, ?, ?)";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, a.getId_partido());
            ps.setInt(2, a.getId_jugador());
            ps.setInt(3, a.getMinuto());
            ps.setString(4, a.getColor_tarjeta());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al insertar amonestacion: " + ex.getMessage());
        }
    }

    public void eliminar(int id_partido, int id_jugador, int minuto) {
        String sql = "DELETE FROM amonestacion WHERE id_partido = ? AND id_jugador = ? AND minuto = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id_partido);
            ps.setInt(2, id_jugador);
            ps.setInt(3, minuto);
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al eliminar amonestacion: " + ex.getMessage());
        }
    }
}