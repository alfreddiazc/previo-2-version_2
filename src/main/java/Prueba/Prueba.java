/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Prueba;

import Dao.AsignaturaJpaController;
import Dto.Alumno;
import Dto.Asignatura;
import Dto.Categoria;
import Dto.Evento;
import Dto.Proyecto;
import Dto.Tipo;
import Negocio.Ferias;
import java.util.Date;
import java.util.List;

/**
 *
 * @author USUARIO
 */
public class Prueba {

    public static void main(String[] args) {

        Ferias f = new Ferias();
//   Prueba que registra un proyecto
        Proyecto pr=new Proyecto(5,"covid19", "diagnostico", "https://www.youtube.com/watch?v=e4I4x2RwLsY");
        pr.setAsignatura(new Asignatura("1155605", "Base de datos"));
        pr.setCategoria(new Categoria(1, "Innovacion"));
        pr.setTipo(new Tipo(1, "Proyecto de Aula"));
        pr.setEvento(new Evento(3, "Feria-2020-2", new Date()));
//        f.RegistrarProyecto(pr);
//        
//   Prueba que registra un alumno
         Alumno al=new Alumno("1150707", "alfred", "alfred@alfred.com", "1234");
//         f.RegistrarAlumno(al);
//   Prueba que registra un Evento
//          Evento ev=new Evento(10, "Feria-2020-2",new Date());
//          f.RegistrarEvento(ev);
//   prueba que un alumno a un proyecto
//          List<Proyecto> lpp=f.AsignarAlumnoP(pr, al);
//           Proyecto pp=f.findProyecto(5);
//           for (Proyecto proyecto : lpp) {
//            if(proyecto.getNombre().equals(pp.getNombre())){
//                for(Alumno alu : proyecto.getAlumnoList()){
//                    if(alu.getEmail().equals(al.getEmail())){
//                        System.out.println("alumno registrado en proyecto");
//                    }
//                }
//            }
//               System.out.println("no");
//        }
//    prueba de actualizar un proyecto
//              f.ActualizarProy(pr);
//    Prueba de que devuelve los proyectos por un estudiante.
//        Alumno a=new Alumno("1150101","Pepito Perez", "pepito@gmail.com", "1234");
//        List<Proyecto> lp=f.participa(a);
//        System.out.println("lp "+lp.toString());
//        for (Proyecto proyecto : lp) {
//            System.out.println("c ");
//            System.out.println("nombre p:  "+proyecto.getNombre());
//        }
 // asigna y actualiza un proyecto con un alumno
       Proyecto p=new Proyecto();
       p.setNombre("covid");
       Alumno a=new Alumno();
       a.setCodigo("1150707");
       f.asignarAlumnoaProy(p, a);
    }
}
