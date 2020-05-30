/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import Dao.AlumnoJpaController;
import Dao.AsignaturaJpaController;
import Dao.CategoriaJpaController;
import Dao.Conexion;
import Dao.EventoJpaController;
import Dao.ProyectoJpaController;
import Dao.TipoJpaController;
import Dto.Alumno;
import Dto.Asignatura;
import Dto.Categoria;
import Dto.Evento;
import Dto.Proyecto;
import Dto.Tipo;
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
    List<Proyecto> newProyectos;
    
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
          Alumno alu=this.findAlumnoCod(a.getCodigo());
          pr.getAlumnoList().add(alu);
          alu.getProyectoList().add(pr);
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
       public Asignatura findAsignaturaById(String codigo){
           AsignaturaJpaController asijc=new AsignaturaJpaController(con.getBd());
           return asijc.findAsignatura(codigo);
       }
       public Categoria findCategoriaById(String id){
           CategoriaJpaController cajc=new  CategoriaJpaController(con.getBd());
           int i=Integer.parseInt(id);
           return cajc.findCategoria(i);
           
       }
       public Tipo findTipoById(String id){
           TipoJpaController tjc=new TipoJpaController(con.getBd());
           int i=Integer.parseInt(id);
           return tjc.findTipo(i);
       }
       public Evento findEventoById(String id){
           EventoJpaController tjc=new EventoJpaController(con.getBd());
           int i=Integer.parseInt(id);
           return tjc.findEvento(i);
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
         public List<Asignatura> getAsignaturas(){
             AsignaturaJpaController asjc=new AsignaturaJpaController(con.getBd());
             return asjc.findAsignaturaEntities();
         }
         public List<Categoria> getCategoria(){
             CategoriaJpaController csjc=new CategoriaJpaController(con.getBd());
             return csjc.findCategoriaEntities();
         }
         public List<Tipo> getTipo(){
             TipoJpaController tsjc=new TipoJpaController(con.getBd());
             return tsjc.findTipoEntities();
         }
         public List<Proyecto> participa2(Alumno a){
             Alumno al=this.findAlumno(a.getEmail());
             return al.getProyectoList();
         }
        
}
