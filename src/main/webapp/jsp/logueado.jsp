<%-- 
    Document   : logueado
    Created on : 30/05/2020, 12:39:11 AM
    Author     : USUARIO
--%>

<%@page import="Dto.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="Negocio.Ferias" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Ferias de Proyectos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
        <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel="stylesheet" href="../css/Stile.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css/card.css">
    </head>
    <body>
        <% Alumno alsesion = (Alumno) request.getSession().getAttribute("alumno");

            if (alsesion != null) {

        %>


        <c:set var = "alumno"  value = "${alumno}"/>
        <jsp:useBean id="feria" class="Negocio.Ferias"></jsp:useBean>
            <section id="team" class="pb-5">
                <div class="container">
                    <h5 class="section-title h1">PROYECTOS DE <c:out value="${alumno.nombre}"/> </h5>
                <div class="row">
                    <div class="container ">
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#exampleModal4">Registrar Proyecto</button>
                            <a type="button" class="btn btn-secondary" href="cerrarSesion">Cerrar sesion</a>
                        </div>
                    </div>
                    <div class="modal fade" id="exampleModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModal4Label"
                         aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModal4Label">Registrar nuevo Proyecto</h5>

                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form action="${pageContext.request.contextPath}/registrarProyectoCotroller" method="POST">
                                    <div class="modal-body">

                                        <div class="form-group">
                                            <label for="formGroupExampleInput">Nombre</label>
                                            <input name="nom" type="text" class="form-control" id="formGroupExampleInput" placeholder="...">
                                        </div>
                                        <div class="form-group">
                                            <label for="formGroupExampleInput">Resumen</label>
                                            <input name="res" type="text" class="form-control" id="formGroupExampleInput" placeholder="...">
                                        </div>
                                        <div class="form-group">
                                            <label for="formGroupExampleInput">Video</label>
                                            <input name="vid" type="text" class="form-control" id="formGroupExampleInput" placeholder="...">
                                        </div>
                                        <div class="form-group">
                                            <label for="formGroupExampleInput2">Asignaturas </label> <br>

                                            <select name="asignatura">
                                                <c:forEach var="a" items="${feria.getAsignaturas()}">
                                                    <option value="<c:out value="${a.codigo}"/>"><c:out value="${a.nombre}"/></option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="formGroupExampleInput2">Categoria </label> <br>

                                            <select name="categoria">
                                                <c:forEach var="ca" items="${feria.getCategoria()}">
                                                    <option value="<c:out value="${ca.id}"/>"><c:out value="${ca.descripcion}"/></option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="formGroupExampleInput2">Tipo </label> <br>

                                            <select name="tipo">
                                                <c:forEach var="tipo" items="${feria.getTipo()}">
                                                    <option value="<c:out value="${tipo.id}"/>"><c:out value="${tipo.descripcion}"/></option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="formGroupExampleInput2">Evento </label> <br>

                                            <select name="evento">
                                                <c:forEach var="even" items="${feria.getEventos()}">
                                                    <option value="<c:out value="${even.id}"/>"><c:out value="${even.nombre}"/></option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input name="alumnocod" value="<c:out value="${alumno.codigo}"/>" hidden="true">  
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Registrar Proyecto</button>
                                        </div>
                                    </div>    
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">

                    <c:forEach var="lp" items="${listProyect}">   
                        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                            <div class="card h-100">
                                <a href="<c:out value="${lp.video}"/>">Ver video </a>
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="#">Proyecto  <c:out value="${lp.nombre}"/></a>
                                    </h4>
                                    <p class="card-text"> <c:out value="${lp.resumen}"/></p>
                                </div>
                            </div>
                        </div>

                    </c:forEach> 
                </div>
                <!-- /.row -->

                <!-- Pagination -->
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Anterior</span>
                        </a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#">1</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#">2</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#">3</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Siguiente</span>
                        </a>
                    </li>
                </ul>

            </div>
        </section>
        <%           } else {  %>

        <div class="modal-dialog text-center">
            <div class="col-sm-12 main-section">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="col-12 user-img">
                            <img src="../img/user.png"/>
                            <h3>Estudiante</h3>
                        </div>
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModal3Label">Iniciar sesion</h5>
                        </div>
                        <form action="../loginController" method="POST">
                            <div class="modal-body">

                                <div class="form-group" id="user-group">
                                    <label for="formGroupExampleInput">Correo Electronico</label>
                                    <input name="email" type="text" class="form-control" id="formGroupExampleInput" placeholder="...">
                                </div>
                                <div class="form-group" id="contrasena-group">
                                    <label for="formGroupExampleInput2">Contraseña</label>
                                    <input name="clave" type="password" class="form-control" id="formGroupExampleInput2" placeholder="****">
                                </div>

                            </div>

                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Iniciar sesion</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal" data-toggle="modal" data-target="#exampleModal4">Registrar Alumno</button>

                            </div>
                        </form>
                    </div>
                </div></div>
        </div>
        <div class="modal fade" id="exampleModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModal4Label"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModal4Label">Registro de Alumno</h5>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="../registrarController" method="POST">
                        <div class="modal-body">

                            <div class="form-group">
                                <label for="formGroupExampleInput">Nombre</label>
                                <input name="nom" type="text" class="form-control" id="formGroupExampleInput" placeholder="...">
                            </div>
                            <div class="form-group">
                                <label for="formGroupExampleInput2">Email</label>
                                <input name="ema" type="email" class="form-control" id="formGroupExampleInput2"
                                       placeholder="ejemplo@ejemplo.com">
                            </div>
                            <div class="form-group">
                                <label for="formGroupExampleInput2">Contraseña</label>
                                <input name="cla" type="password" class="form-control" id="formGroupExampleInput2" placeholder="****">
                            </div>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Registrar Alumno</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%   }
        %>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>


    </body>
</html>
