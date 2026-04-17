package ClasesDAO;

import modelos.Partido;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PartidoDAO {

    public List<Partido> obtenerTodos() {
        List<Partido> lista = new ArrayList<>();
        String sql = "SELECT id, id_equipo_local, id_equipo_visitante, id_estadio, goles_local, goles_visitante, fase, fecha FROM partido ORDER BY fecha DESC";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Partido p = new Partido();
                p.setId(rs.getInt("id"));
                p.setId_equipo_local(rs.getInt("id_equipo_local"));
                p.setId_equipo_visitante(rs.getInt("id_equipo_visitante"));
                p.setId_estadio(rs.getInt("id_estadio"));
                p.setGoles_local(rs.getInt("goles_local"));
                p.setGoles_visitante(rs.getInt("goles_visitante"));
                p.setFase(rs.getString("fase"));
                p.setFecha(rs.getTimestamp("fecha"));
                lista.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar partidos: " + e.getMessage());
        }
        return lista;
    }

    public void insertar(Partido p) {
        String sql = "INSERT INTO partido (id_equipo_local, id_equipo_visitante, id_estadio, fase, fecha) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, p.getId_equipo_local());
            ps.setInt(2, p.getId_equipo_visitante());
            ps.setInt(3, p.getId_estadio());
            ps.setString(4, p.getFase());
            ps.setTimestamp(5, new java.sql.Timestamp(p.getFecha().getTime()));
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar partido: " + e.getMessage());
        }
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM partido WHERE id = ?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar partido: " + e.getMessage());
        }
    }
}