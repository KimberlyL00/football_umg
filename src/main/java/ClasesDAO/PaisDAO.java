package ClasesDAO;

import modelos.Pais;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaisDAO {

    public List<Pais> obtenerTodos() {
        List<Pais> lista = new ArrayList<>();
        String sql = "SELECT id_pais, nombre FROM pais";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Pais p = new Pais();
                p.setId_pais(rs.getInt("id_pais"));
                p.setNombre(rs.getString("nombre"));
                lista.add(p);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar paises: " + ex.getMessage());
        }
        return lista;
    }

    public void insertar(Pais p) {
        String sql = "INSERT INTO pais (nombre) VALUES (?)";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, p.getNombre());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al insertar pais: " + ex.getMessage());
        }
    }

    public void actualizar(Pais p) {
        String sql = "UPDATE pais SET nombre = ? WHERE id_pais = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, p.getNombre());
            ps.setInt(2, p.getId_pais());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al actualizar pais: " + ex.getMessage());
        }
    }

public void eliminar(int id_pais) {

    String sql = "DELETE FROM pais WHERE id_pais = ?";

    try (
        Connection conn = ConexionDB.conectar();
        PreparedStatement ps = conn.prepareStatement(sql)
    ) {

        ps.setInt(1, id_pais);

        ps.executeUpdate();

    } catch (SQLException ex) {

        System.out.println("Error al eliminar pais: " + ex.getMessage());

    }

}

}