<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AdministacionDeObra.Login.Login2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link href="../Estilos/estilos_layout.css" rel="stylesheet" type="text/css" />

<head runat="server">
    <title>Administración de la Obra</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    &nbsp;<p>&nbsp;</p>
        <span class="Bienvenidos">::: Bienvenido :::</span><br />
        <br />
        <div id="cuadro_login">
            <br />
            <br />
            <div id="Containt" align="center" runat="server">
                <table align="center" width="400">
                    <tr>
                        <td valign="top" align="right" width="150">
                            <span class="texto_destacado1">
                                <asp:Label ID="lblUsuario" runat="server" Text="Usuario:" CssClass="footer"></asp:Label>
                            </span>&nbsp;
                        </td>
                        <td valign="top" align="left" width="250">
                            <asp:TextBox ID="txtUsuario" runat="server" MaxLength="50" Width="180px"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario"
                                ErrorMessage="Usuario requerido para la validación."></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="right">
                            <span class="texto_destacado1">
                                <asp:Label ID="lblPassword" runat="server" Text="Contraseña:" CssClass="footer"></asp:Label>
                            </span>&nbsp;
                        </td>
                        <td valign="top" align="left">
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                                ErrorMessage="Contraseña requerida para validaciòn."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <div align="center" style="margin-left: 40px">
                    <br />
                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login"
                        Style="height: 26px" Width="117px" />
                    <br />
                    <br />
                    <%--<asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/RecuperaContrasena.aspx" CssClass="style2">Olvide mi contraseña.</asp:HyperLink>--%>
                    <br />
                    <asp:Label ID="lblVersion" runat="server" Text="Version 0.0.0.1" CssClass="footer"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
