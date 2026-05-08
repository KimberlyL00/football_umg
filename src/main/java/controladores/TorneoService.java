package controladores;

import java.util.ArrayList;
import java.util.HashMap;

public class TorneoService {

    private HashMap<Integer, Posicion> posiciones = new HashMap<>();
    private ArrayList<Posicion> grupoA = new ArrayList<>();

    public void agregarEquipo(int id, String nombre, String grupo) {

        Posicion p = new Posicion();
        p.setIdEquipo(id);
        p.setNombreEquipo(nombre);

        posiciones.put(id, p);

        if (grupo.equals("A")) {
            grupoA.add(p);
        }
    }

    public void procesarPartido(int idLocal, int idVisitante, int gl, int gv) {

        Posicion local = posiciones.get(idLocal);
        Posicion visita = posiciones.get(idVisitante);

        if (local == null || visita == null) return;

        local.setPj(local.getPj() + 1);
        visita.setPj(visita.getPj() + 1);

        local.setGf(local.getGf() + gl);
        local.setGc(local.getGc() + gv);

        visita.setGf(visita.getGf() + gv);
        visita.setGc(visita.getGc() + gl);

        if (gl > gv) {

            local.setPg(local.getPg() + 1);
            visita.setPp(visita.getPp() + 1);
            local.setPuntos(local.getPuntos() + 3);

        } else if (gl < gv) {

            visita.setPg(visita.getPg() + 1);
            local.setPp(local.getPp() + 1);
            visita.setPuntos(visita.getPuntos() + 3);

        } else {

            local.setPe(local.getPe() + 1);
            visita.setPe(visita.getPe() + 1);

            local.setPuntos(local.getPuntos() + 1);
            visita.setPuntos(visita.getPuntos() + 1);
        }
    }

    public void ordenarGrupo(ArrayList<Posicion> grupo) {

        grupo.sort((a, b) -> {

            if (b.getPuntos() != a.getPuntos())
                return b.getPuntos() - a.getPuntos();

            int dgA = a.getGf() - a.getGc();
            int dgB = b.getGf() - b.getGc();

            if (dgB != dgA)
                return dgB - dgA;

            return b.getGf() - a.getGf();
        });
    }

    public ArrayList<Posicion> getGrupoA() {
        return grupoA;
    }

    public void resetTorneo() {
        posiciones.clear();
        grupoA.clear();
    }

    public ArrayList<Posicion> getPosiciones() {
        return new ArrayList<>(posiciones.values());
    }
}