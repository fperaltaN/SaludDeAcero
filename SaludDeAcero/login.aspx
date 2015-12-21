<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SaludDeAcero.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SISA - Salud De Acero</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    

    <%-- <link rel="icon" href="../../favicon.ico">--%>
    <!-- Bootstrap core CSS -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="Content/jumbotron.css" rel="stylesheet" />
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <script src="Scripts/ie-emulation-modes-warning.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <%--<[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <[endif]>--%>
</head>
<body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Salud De Acero</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <form class="navbar-form navbar-right" runat="server">
                    <div class="form-group">
                        <asp:TextBox ID="txtUser" class="form-control" runat="server" Text="" ToolTip="Introduce tu Usuario.."></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPass" class="form-control" runat="server" Text="" ToolTip="Introduce tu password.." TextMode="Password"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnIniciarSession" runat="server" class="btn btn-success" Text="Iniciar Session" OnClick="btnIniciarSession_Click" />
                </form>
            </div>
            <!--/.navbar-collapse -->
        </div>
    </nav>
    <br />

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <div class="container">
            <h1>Hola, Bienvenido!</h1>
        </div>
    </div>
    <%--<iframe id="doc"  runat = "server"  width="100%" height="100%"    > 
    </iframe>--%>
    <div class="jumbotron">
        <div class="container">
            <p>&nbsp;&nbsp;&nbsp;En Salud de  Acero mantenemos un fuerte compromiso tanto con nuestros clientes como con la sociedad que nos rodea. La filosofía considera la actividad física como un medio para mantener un buen estado de salud en cualquier edad o condición.</p>

            <p><a class="btn btn-primary btn-lg" href="#" role="button">Aprende mas acerca de nosotros&raquo;</a></p>
        </div>
    </div>

    <div class="container">
        <!-- Example row of columns -->
        <div class="row">
            <div class="col-md-4">
                <h2>Ponte en forma </h2>
                <p>&nbsp; Contamos con diferentes planes, hechos especialmente para ponerte en forma y pensados de acuerdo a tus necesidades. &nbsp;</p>
                <p><a class="btn btn-default" href="#" role="button">Ve mas detalles &raquo;</a></p>
            </div>
            <!-- Example row of columns -->

            <div class="col-md-4">
                <h2>Solicita una sesión gratis</h2>
                <p>&nbsp; Te estamos esperando, nuestros  entrenadores altamente capacitados, la primer vista corre por nuestra cuenta&nbsp;</p>
                <p><a class="btn btn-default" href="#" role="button">Contactanos &raquo;</a></p>
            </div>
            <div class="col-md-4">
                <h2>Echale una miradita</h2>
                <p>&nbsp; Ven y conoce nuestras instalaciones, contamos con instalaciones de lujo para las actividades de nuestros socios</p>
                <p><a class="btn btn-default" href="#" role="button">Ve mas detalles &raquo;</a></p>
            </div>

        </div>


        <hr>

        <footer>

            <a href="#">
                <img src="Imagenes/facebook.png" alt="facebook" /></a>
            <a href="#">
                <img src="imagenes/flickr.png" alt="flickr" /></a>
            <a href="#">
                <img src="imagenes/myspace.png" alt="myspace" /></a>
            <a href="#">
                <img src="imagenes/twitter.png" alt="twitter" /></a>
            <a href="#">
                <img src="imagenes/youtube.png" alt="youtube" /></a>


            <p>&copy; Salud de Acero  2015</p>
    </div>
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="Scripts/ie10-viewport-bug-workaround.js"></script>
    
</body>
</html>
