package ClasesDAO;

import modelos.Partido;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PartidoDAO {

    public List<Partido> obtenerTodos() {
        List<Partido> lista = new ArrayList<>();
        String sql = "SELECT id_partido, fecha_hora, id_estadio, id_fase, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante FROM partido";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Partido p = new Partido();
                p.setId_partido(rs.getInt("id_partido"));
                p.setFecha_hora(rs.getTimestamp("fecha_hora"));
                p.setId_estadio(rs.getInt("id_estadio"));
                p.setId_fase(rs.getInt("id_fase"));
                p.setId_equipo_local(rs.getInt("id_equipo_local"));
                p.setId_equipo_visitante(rs.getInt("id_equipo_visitante"));
                p.setGoles_local(rs.getInt("goles_local"));
                p.setGoles_visitante(rs.getInt("goles_visitante"));
                lista.add(p);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar partidos: " + ex.getMessage());
        }
        return lista;
    }

    public void insertar(Partido p) {
        String sql = "INSERT INTO partido (fecha_hora, id_estadio, id_fase, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setTimestamp(1, p.getFecha_hora());
            ps.setInt(2, p.getId_estadio());
            ps.setInt(3, p.getId_fase());
            ps.setInt(4, p.getId_equipo_local());
            ps.setInt(5, p.getId_equipo_visitante());
            ps.setInt(6, p.getGoles_local());
            ps.setInt(7, p.getGoles_visitante());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al insertar partido: " + ex.getMessage());
        }
    }

    public void actualizar(Partido p) {
        String sql = "UPDATE partido SET goles_local = ?, goles_visitante = ? WHERE id_partido = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, p.getGoles_local());
            ps.setInt(2, p.getGoles_visitante());
            ps.setInt(3, p.getId_partido());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al actualizar partido: " + ex.getMessage());
        }
    }

    public void eliminar(int id_partido) {
        String sql = "DELETE FROM partido WHERE id_partido = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id_partido);
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al eliminar partido: " + ex.getMessage());
        }
    }
}