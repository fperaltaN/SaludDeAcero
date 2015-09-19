<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VAdminSocio.aspx.cs" Inherits="SaludDeAcero.AdministraciónSocios.VAdminSocio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head runat="server">
    <title>SISA - Salud De Acero</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%-- <link rel="icon" href="../../favicon.ico">--%>
    <!-- Bootstrap core CSS -->
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="../Content/jumbotron.css" rel="stylesheet" />
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <script src="../Scripts/ie-emulation-modes-warning.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <%--<[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <[endif]>--%>
</head>

<body>
    <header class="navbar navbar-inverse navbar-fixed-top" id="top" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#bs-navbar" aria-controls="bs-navbar" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand active">Salud de Acero</a>
            </div>
            <nav id="bs-navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">Inicio</a>
                    </li>
                    <li>
                        <a href="#">Servicios</a>
                    </li>
                    <li>
                        <a href="#">Paquetes</a>
                    </li>
                    <li>
                        <a href="#">Socios</a>
                    </li>
                    <li>
                        <a href="#">Pagos</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Nombre de Usuario <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Opciones</a></li>
                            <li><a href="#">Configuración</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Otras cosas</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Cerrar Sesión</a></li>
                </ul>
            </nav>
            <%--</div>--%>
    </header>

    <div class="container">
        <div class="row">
            <div id="navigation" class="col-md-2">
                <div class="container-fluid">
                    <div class="col-xs-4 col-md-2">
                         <div style="position:fixed; top:150px; " class="navigation">
                              <h1>Navigation</h1>
                         </div>
                    </div> <!-- /col-md-2 navigation -->
                </div>
            </div>
            <div class="col-md-9">
                <h1 class="page-header">Administración de Socios</h1>
                <div class="container">
                    <ul class="nav nav-pills">
                        <li role="presentation">
                            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModalAddSocio">Agregar Socio</button></li>
                        <li role="presentation">
                            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalAUpdateSocio">Modificar Socio</button></li>
                        <li role="presentation">
                            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalEstadoSocio">Cambiar de Estado Socio</button></li>
                        <li role="presentation">
                            <button type="button" class="btn btn-primary btn-lg">Consultar Historial de Pago</button></li>
                        <li role="presentation">
                            <button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#myModalDeleteSocio">Eliminar Socio</button></li>
                    </ul>
                </div>

                <div class="table-responsive">
                    <h3 class="page-header">Registro de Socios</h3>
                    <table class="table table-hover">
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>

                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td class="active">...</td>
                            <td class="success">...</td>
                            <td class="warning">...</td>
                            <td class="danger">...</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>


        <!-- Modal Registrar Socio -->
        <div class="modal fade" id="myModalAddSocio" tabindex="-1" role="dialog" aria-labelledby="AddSocio">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalTitleAddSocio">Registro de Nuevo Socio</h4>
                    </div>
                    <div class="modal-body">
                        <form id="formAddSocio">
                            <div class="form-group">
                                <label for="numeroSocio">Número de Socio</label>
                                <input type="text" class="form-control" id="numeroSocio" placeholder="Número de Socio" disabled />
                            </div>
                            <div class="form-group">
                                <label for="nombreSocio">Nombre(s) Socio</label>
                                <input type="text" class="form-control" id="nombreSocio" placeholder="Ingrese Nombre del Socio" />
                            </div>
                            <div class="form-group">
                                <label for="paternoSocio">Apellido Paterno</label>
                                <input type="text" class="form-control" id="paternoSocio" placeholder="Ingrese Apellido Paterno del Socio" />
                            </div>
                            <div class="form-group">
                                <label for="maternoSocio">Apellido Materno</label>
                                <input type="text" class="form-control" id="maternoSocio" placeholder="Ingrese Apellido Materno del Socio" />
                            </div>
                            <div class="form-group">
                                <label for="fechaSocio">Fecha de Naciemiento</label>
                                ver complemento para calendario js
                                    <input type="text" class="form-control" id="fechaSocio" placeholder="Número de Socio" />
                            </div>
                            <div class="form-group">
                                <label for="telefonoSocio">Teléfono(s)</label>
                                <input type="text" class="form-control" id="telefonoSocio" placeholder="Ingrese Teléfono(s) del Socio" />
                            </div>
                            <div class="form-group">
                                <label for="direccionSocio">Dirección del Socio</label>
                                <textarea id="direccionSocio" class="form-control" placeholder="Ingrese Dirección del Socio" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="paqueteSocio">Paquete</label>
                                <div class="selectContainer">
                                    <select class="form-control" name="paquete" id="paqueteSocio">
                                        <option value="">Elegir un Paquete</option>
                                        <option value="s">Cargar por Programación</option>
                                        <option value="m">Medium (M)</option>
                                        <option value="l">Large (L)</option>
                                        <option value="xl">Extra large (XL)</option>
                                    </select>
                                </div>
                                <p class="text-right"><a href="#">Ver Detalles del Paqute Seleccionado...</a></p>
                            </div>

                            <div class="container">
                                <h4 class="modal-title">Antecedentes del Socio</h4>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="direccionSocio">Médicos</label>
                                            <textarea class="form-control" placeholder="Ingrese los antecedentes Médicos" rows="5"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="direccionSocio">Físicos</label>
                                            <textarea class="form-control" placeholder="Ingrese los antecedentes Físicos" rows="5"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-success">Guardar Socio</button>
                    </div>
                </div>
            </div>
        </div>

         <!-- Modal Modificar Socio -->
        <div class="modal fade" id="myModalAUpdateSocio" tabindex="-1" role="dialog" aria-labelledby="AddSocio">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalTitleUpdateSocio">Modificar Información de Socio</h4>
                    </div>
                    <div class="modal-body">
                        <form id="formUpdateSocio">
                            <div class="form-group">
                                <label for="numeroSocioUpd">Número de Socio</label>
                                <input type="text" class="form-control" id="numeroSocioUpd" placeholder="Número de Socio" disabled />
                            </div>
                            <div class="form-group">
                                <label for="nombreSocioUpd">Nombre(s) Socio</label>
                                <input type="text" class="form-control" id="nombreSocioUpd" placeholder="Ingrese Nombre del Socio" />
                            </div>
                            <div class="form-group">
                                <label for="paternoSocioUpd">Apellido Paterno</label>
                                <input type="text" class="form-control" id="paternoSocioUpd" placeholder="Ingrese Apellido Paterno del Socio" />
                            </div>
                            <div class="form-group">
                                <label for="maternoSocioUpd">Apellido Materno</label>
                                <input type="text" class="form-control" id="maternoSocioUpd" placeholder="Ingrese Apellido Materno del Socio" />
                            </div>
                            <div class="form-group">
                                <label for="fechaSocioUpd">Fecha de Naciemiento</label>
                                ver complemento para calendario js
                                    <input type="text" class="form-control" id="fechaSocioUpd" placeholder="Número de Socio" />
                            </div>
                            <div class="form-group">
                                <label for="telefonoSocioUpd">Teléfono(s)</label>
                                <input type="text" class="form-control" id="telefonoSocioUpd" placeholder="Ingrese Teléfono(s) del Socio" />
                            </div>
                            <div class="form-group">
                                <label for="direccionSocioUpd">Dirección del Socio</label>
                                <textarea id="direccionSocioUpd" class="form-control" placeholder="Ingrese Dirección del Socio" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="paqueteSocio">Paquete</label>
                                <div class="selectContainer">
                                    <select class="form-control" name="paquete" id="paqueteSocioUpd">
                                        <option value="">Elegir un Paquete</option>
                                        <option value="s">Cargar por Programación</option>
                                        <option value="m">Medium (M)</option>
                                        <option value="l">Large (L)</option>
                                        <option value="xl">Extra large (XL)</option>
                                    </select>
                                </div>
                                <p class="text-right"><a href="#">Ver Detalles del Paqute Seleccionado...</a></p>
                            </div>

                            <div class="container">
                                <h4 class="modal-title">Antecedentes del Socio</h4>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="direccionSocio">Médicos</label>
                                            <textarea class="form-control" placeholder="Ingrese los antecedentes Médicos" rows="5"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="direccionSocio">Físicos</label>
                                            <textarea class="form-control" placeholder="Ingrese los antecedentes Físicos" rows="5"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-success">Guardar Cambios</button>
                    </div>
                </div>
            </div>
        </div>

         <!-- Modal Cambiar Estado Socio -->
        <div class="modal fade" id="myModalEstadoSocio" tabindex="-1" role="dialog" aria-labelledby="AddSocio">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalTitleEstadoSocio">Cambiar Estado del Socio</h4>
                    </div>
                    <div class="modal-body">
                        <form id="formEstadoSocio">
                            <div class="form-group">
                                <label for="numeroSocio">Número de Socio</label>
                                <input type="text" class="form-control" id="numeroSocioEstado" placeholder="Número de Socio" disabled />
                            </div>
                            <div class="form-group">
                                <label for="nombreSocio">Nombre(s) Socio</label>
                                <input type="text" class="form-control" id="nombreSocioEstado" placeholder="Ingrese Nombre del Socio" disabled/>
                            </div>
                            <div class="form-group">
                                <label for="paternoSocio">Apellido Paterno</label>
                                <input type="text" class="form-control" id="paternoSocioEstado" placeholder="Ingrese Apellido Paterno del Socio" disabled/>
                            </div>
                            <div class="form-group">
                                <label for="maternoSocio">Apellido Materno</label>
                                <input type="text" class="form-control" id="maternoSocioEstado" placeholder="Ingrese Apellido Materno del Socio" disabled/>
                            </div>
                            <div class="form-group">
                                <label for="estadoSocio">Estado</label>
                                <div class="selectContainer">
                                    <select class="form-control" name="estado" id="estadoSocio">
                                        <option value="">Elegir un Estado</option>
                                        <option value="s">Cargar por Programación o fijos </option>
                                        <option value="m">Medium (M)</option>
                                        <option value="l">Large (L)</option>
                                        <option value="xl">Extra large (XL)</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-success">Guardar Estado Socio</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Cambiar Estado Socio -->
        <div class="modal fade" id="myModalDeleteSocio" tabindex="-1" role="dialog" aria-labelledby="AddSocio">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h3 class="modal-title" id="myModalTitleDeleteSocio">Confirmación de Eliminación de Socio</h3>
                    </div>
                    <div class="modal-body">
                        <form id="formDeleteSocio">
                            <div class="form-group">
                                <label for="numeroSocio">Número de Socio</label>
                                <input type="text" class="form-control" id="numeroSocioDelete" placeholder="Número de Socio" disabled />
                            </div>
                            <div class="form-group">
                                <label for="nombreSocio">Nombre(s) Socio</label>
                                <input type="text" class="form-control" id="nombreSocioDelete" placeholder="Ingrese Nombre del Socio" disabled/>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <h4 class="modal-title">Confirmación</h4>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-success">Eliminar Socio</button>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="../Scripts/bootstrap.min.js"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="../Scripts/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
