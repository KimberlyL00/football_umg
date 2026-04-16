package ClasesDAO;

import modelos.Partido;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PartidoDAO {

    public void insertar(Partido partido) {
        String sql = "INSERT INTO partido (id_equipo_local, id_equipo_visitante, id_estadio, goles_local, goles_visitante, fase) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, partido.getId_equipo_local());
            ps.setInt(2, partido.getId_equipo_visitante());
            ps.setInt(3, partido.getId_estadio());
            ps.setInt(4, partido.getGoles_local());
            ps.setInt(5, partido.getGoles_visitante());
            ps.setString(6, partido.getFase());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar partido: " + e.getMessage());
        }
    }

    public List<Partido> obtenerTodos() {
        List<Partido> lista = new ArrayList<>();
        String sql = "SELECT * FROM partido";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Partido p = new Partido(
                    rs.getInt("id"),
                    rs.getInt("id_equipo_local"),
                    rs.getInt("id_equipo_visitante"),
                    rs.getInt("id_estadio"),
                    rs.getInt("goles_local"),
                    rs.getInt("goles_visitante"),
                    rs.getString("fase"),
                    rs.getTimestamp("fecha")
                );
                lista.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener partidos: " + e.getMessage());
        }
        return lista;
    }

    public void actualizar(Partido partido) {
        String sql = "UPDATE partido SET id_equipo_local=?, id_equipo_visitante=?, id_estadio=?, goles_local=?, goles_visitante=?, fase=? WHERE id=?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, partido.getId_equipo_local());
            ps.setInt(2, partido.getId_equipo_visitante());
            ps.setInt(3, partido.getId_estadio());
            ps.setInt(4, partido.getGoles_local());
            ps.setInt(5, partido.getGoles_visitante());
            ps.setString(6, partido.getFase());
            ps.setInt(7, partido.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al actualizar partido: " + e.getMessage());
        }
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM partido WHERE id=?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar partido: " + e.getMessage());
        }
    }
}