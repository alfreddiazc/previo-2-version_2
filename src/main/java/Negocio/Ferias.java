/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import Dao.AlumnoJpaController;
import Dao.CategoriaJpaController;
import Dao.Conexion;
import Dao.EventoJpaController;
import Dao.ProyectoJpaController;
import Dto.Alumno;
import Dto.Categoria;
import Dto.Evento;
import Dto.Proyecto;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author USUARIO
 */
public class Ferias {
    
    Conexion con;
    ProyectoJpaController pjc;
    AlumnoJpaController ajc;
    EventoJpaController ejc;
    List<Proyecto> pl=null;
    List<Alumno> al=null;
    List<Evento> el=null;
    
    public Ferias(){
        con=Conexion.getConexion();
    }
    
    public boolean RegistrarProyecto(Proyecto p){
        pjc=new ProyectoJpaController(con.getBd());
        pl=pjc.findProyectoEntities();
        for (Proyecto proyecto : pl) {
            if(proyecto.getId().equals(p.getId()) || proyecto.getNombre().equals(p.getNombre())){
                return false;
            }
        }
        pjc.create(p);
        return true;
    }
     public boolean RegistrarAlumno(Alumno a){
        ajc=new AlumnoJpaController(con.getBd());
        al=ajc.findAlumnoEntities();
        for (Alumno alumno : al) {
            if(alumno.getCodigo().equals(a.getCodigo()) || alumno.getEmail().equals(a.getEmail())){
                return false;
            }
        }
        try {
            ajc.create(a);
        } catch (Exception ex) {
            Logger.getLogger(Ferias.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }
      public boolean RegistrarEvento(Evento e){
        ejc=new EventoJpaController(con.getBd());
        el=ejc.findEventoEntities();
        for (Evento evento : el) {
            if(evento.getId().equals(e.getId()) || evento.getNombre().equals(e.getNombre())){
                return false;
            }
        }
        ejc.create(e);
        return true;
    }

      public void asignarAlumnoaProy(Proyecto p,Alumno a){
          Proyecto pr=this.findProyecto(p.getNombre());
          al=pr.getAlumnoList();
          al.add(a);
      }
      public List<Proyecto> AsignarAlumnoP(Proyecto pr,Alumno a){
             pl=this.getProyectos();
             for (Proyecto proyecto : pl) {
                 if(proyecto.getNombre().equals(pr.getNombre())){
                     al=proyecto.getAlumnoList();
                     al.add(a);
                     return pl;
                 }
                 
             }
             return null;
         }
      public Proyecto findProyecto(String n){
          pjc=new ProyectoJpaController(con.getBd());
          pl=pjc.findProyectoEntities();
          for (Proyecto proyecto : pl) {
            if(proyecto.getNombre().equals(n)){
                return proyecto;
            }
        }
         return null;
      }
      public Proyecto findProyecto(int id){
         pjc=new ProyectoJpaController(con.getBd());
         Proyecto p=pjc.findProyecto(id);
         return p;
      }
      
      public boolean findAlumnoBo(String n){
        ajc=new AlumnoJpaController(con.getBd());
        al=ajc.findAlumnoEntities();
        for (Alumno alumno : al) {
            if(alumno.getEmail().equals(n)){
                return true;
            }
        }
          return false;
      }
      public Alumno findAlumno(String n){
        ajc=new AlumnoJpaController(con.getBd());
        al=ajc.findAlumnoEntities();
        for (Alumno alumno : al) {
            if(alumno.getEmail().equals(n)){
                return alumno;
            }
        }
          return null;
      }
       public Alumno findAlumnoCod(String cod){
         ajc=new AlumnoJpaController(con.getBd());
         Alumno a=ajc.findAlumno(cod);
         return a;
      }
       public void ActualizarProy(Proyecto p){
           pjc=new ProyectoJpaController(con.getBd());
        try {
            pjc.edit(p);
        } catch (Exception ex) {
            Logger.getLogger(Ferias.class.getName()).log(Level.SEVERE, null, ex);
        }
       }
       public List<Proyecto> getProyectos(){
           pjc=new ProyectoJpaController(con.getBd());
           return pjc.findProyectoEntities();
       }
         public List<Alumno> getAlumnos(){
           ajc=new AlumnoJpaController(con.getBd());
           return ajc.findAlumnoEntities();
       }
         public List<Evento> getEventos(){
             ejc=new  EventoJpaController(con.getBd());
             return ejc.findEventoEntities();
         }
         
         public boolean login(String email,String clave){
             al=this.getAlumnos();
             for(Alumno a : al){
                 if(a.getEmail().equals(email) && a.getClave().equals(clave)){
                     return true;
                 }
             }
             return false;
         }
         public List<Proyecto> participa(Alumno a){
             pl=this.getProyectos();
             for (Proyecto proyecto : pl) {
                 al=proyecto.getAlumnoList();
                 for (Alumno al: al) {
                     if(al.getEmail().equals(a.getEmail()) || al.getCodigo().equals(a.getCodigo())){
                         return al.getProyectoList();
                     }
                 }
             }
             return null;
         }
    
    
    
}
