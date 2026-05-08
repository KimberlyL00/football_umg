package ClasesDAO;

import modelos.Equipo;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EquipoDAO {

    public List<Equipo> obtenerTodos() {

        List<Equipo> lista = new ArrayList<>();

        String sql = "SELECT id_equipo, nombre_equipo, id_pais, grupo FROM equipo";

        try (
            Connection conn = ConexionDB.conectar();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                Equipo e = new Equipo();

                e.setId_equipo(rs.getInt("id_equipo"));
                e.setNombre_equipo(rs.getString("nombre_equipo"));
                e.setId_pais(rs.getInt("id_pais"));
                e.setGrupo(rs.getString("grupo").charAt(0));

                lista.add(e);

            }

        } catch (SQLException ex) {

            System.out.println(ex.getMessage());

        }

        return lista;

    }

    public void insertar(Equipo e) {

        String sql = "INSERT INTO equipo (nombre_equipo, id_pais, grupo) VALUES (?, ?, ?)";

        try (
            Connection conn = ConexionDB.conectar();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setString(1, e.getNombre_equipo());
            ps.setInt(2, e.getId_pais());
            ps.setString(3, String.valueOf(e.getGrupo()));

            ps.executeUpdate();

        } catch (SQLException ex) {

            System.out.println(ex.getMessage());

        }

    }

    public void actualizar(Equipo e) {

        String sql = "UPDATE equipo SET nombre_equipo = ?, id_pais = ?, grupo = ? WHERE id_equipo = ?";

        try (
            Connection conn = ConexionDB.conectar();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setString(1, e.getNombre_equipo());
            ps.setInt(2, e.getId_pais());
            ps.setString(3, String.valueOf(e.getGrupo()));
            ps.setInt(4, e.getId_equipo());

            ps.executeUpdate();

        } catch (SQLException ex) {

            System.out.println(ex.getMessage());

        }

    }

    public void eliminar(int id_equipo) {

        try (

            Connection conn = ConexionDB.conectar()

        ) {

            PreparedStatement ps1 = conn.prepareStatement(
                "DELETE FROM alineacion WHERE id_jugador IN (SELECT id_jugador FROM jugador WHERE id_equipo = ?)"
            );

            ps1.setInt(1, id_equipo);
            ps1.executeUpdate();



            PreparedStatement ps2 = conn.prepareStatement(
                "DELETE FROM amonestacion WHERE id_jugador IN (SELECT id_jugador FROM jugador WHERE id_equipo = ?)"
            );

            ps2.setInt(1, id_equipo);
            ps2.executeUpdate();



            PreparedStatement ps3 = conn.prepareStatement(
                "DELETE FROM gol WHERE id_jugador IN (SELECT id_jugador FROM jugador WHERE id_equipo = ?)"
            );

            ps3.setInt(1, id_equipo);
            ps3.executeUpdate();



            PreparedStatement ps4 = conn.prepareStatement(
                "DELETE FROM jugador WHERE id_equipo = ?"
            );

            ps4.setInt(1, id_equipo);
            ps4.executeUpdate();



            PreparedStatement ps5 = conn.prepareStatement(
                "DELETE FROM partido WHERE id_equipo_local = ? OR id_equipo_visitante = ?"
            );

            ps5.setInt(1, id_equipo);
            ps5.setInt(2, id_equipo);
            ps5.executeUpdate();



            PreparedStatement ps6 = conn.prepareStatement(
                "DELETE FROM equipo WHERE id_equipo = ?"
            );

            ps6.setInt(1, id_equipo);
            ps6.executeUpdate();



        } catch (SQLException ex) {

            System.out.println(ex.getMessage());

        }

    }

}