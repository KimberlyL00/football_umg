package ClasesDAO;

import modelos.Equipo;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EquipoDAO {

    public List<Equipo> obtenerTodos() {
        List<Equipo> lista = new ArrayList<>();
        String sql = "SELECT * FROM equipo"; // Nombre exacto de tu tabla
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Equipo e = new Equipo();
                e.setId(rs.getInt("id"));
                e.setNombre(rs.getString("nombre"));
                e.setPais(rs.getString("pais"));
                lista.add(e);
            }
        } catch (SQLException e) {
            System.out.println("Error en DAO: " + e.getMessage());
        }
        return lista;
    }
}