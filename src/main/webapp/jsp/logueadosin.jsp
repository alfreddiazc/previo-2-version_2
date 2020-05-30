<%-- 
    Document   : logueadosin
    Created on : 30/05/2020, 12:39:31 AM
    Author     : USUARIO
--%>

<%@page import="Dto.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <link rel="stylesheet" type="text/css" href="css/card.css">
        <link rel="stylesheet" href="css/Stile.css">
        <script src="js/myScritp.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


        <title>Proyectos</title>
    </head>
    <body> 
        <% Alumno alsesion = (Alumno) request.getSession().getAttribute("alumno");
            if (alsesion != null) {
        %>

        <div class="row">
            <section class="col-md-8 ">

                <section id="team" class="pb-5">
                    <div class="container">
                        <h5 class="section-title h1">Proyectos</h5>

                        <div class="row">
                            <jsp:useBean id="f" class="Negocio.Ferias"/>
                            <c:forEach var="pro" items="${f.getProyectos()}">
                                <!-- Team member -->
                                <div class="col-xs-12 col-sm-6 col-md-4">
                                    <div class="image-flip" >
                                        <div class="mainflip flip-0">
                                            <div class="frontside">
                                                <div class="card">
                                                    <div class="card-body text-center">
                                                        <h4 class="card-title"><c:out value="${pro.nombre}"/></h4>
                                                        <p class="card-text"><c:out value="${pro.video}"/></p>
                                                        <a href="https://www.fiverr.com/share/qb8D02" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="backside">
                                                <div class="card">
                                                    <div class="card-body text-center mt-4">
                                                        <h4 class="card-title"><c:out value="${pro.evento.nombre}"/></h4>
                                                        <p class="card-text"><c:out value="${pro.resumen}"/></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </section>

            </section>

            <div class="clearfix"></div>
        </div>
        <%} else {%>

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
        <%}%>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"  crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"  crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" crossorigin="anonymous"></script>

    </body>
</html>

