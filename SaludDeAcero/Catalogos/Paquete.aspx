<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Paquete.aspx.cs" Inherits="SaludDeAcero.Catalogos.Paquete" %>

<head>
    <style type="text/css">
        .auto-style1 {
            width: 173px;
            height: 94px;
        }
    </style>
</head>

<form id="form1" runat="server">
    <div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Text="Información Paquete"></asp:Label>
    </div>
<table runat="server" style="width:500px">
    <tr>
        <td>
            <contentTemplate>
                <fieldset>
                    <legend>
                        <asp:Label ID="LblDatos" runat="server" Text="Datos"></asp:Label>
                    </legend>
                        <Table ID="Tblinformacion" runat="server" Style="width:500px">
                          <tr>
                              <td>

                                  &nbsp;</td>
                              <td>

                              </td>
                          </tr>
                          <tr>
                              <td>

                                  <asp:Label ID="LblNombrePaquete" runat="server" Text="Nombre del Paquete"></asp:Label>

                              </td>
                              <td>

                                  <asp:TextBox ID="TxtNombrePaquete" runat="server"></asp:TextBox>

                              </td>
                          </tr>
                          <tr>
                              <td>

                                  <asp:Label ID="LblCosto" runat="server" Text="Costo $:"></asp:Label>

                              </td>
                              <td>

                                  <asp:TextBox ID="TxtCosto" runat="server"></asp:TextBox>

                              </td>
                          </tr>
                          <tr>
                              <td>

                                  <asp:Label ID="LblDescripcion" runat="server" Text="Descripción:"></asp:Label>

                              </td>
                              <td>

                                  <textarea id="TextArea1" class="auto-style1" name="S1"></textarea></td>
                          </tr>
                        
                          
                          
                          <tr>
                              <td>

                                  &nbsp;</td>
                              <td>

                                  &nbsp;</td>
                          </tr>
                        
                          
                          
                          <tr>
                              <td>

                                  &nbsp;</td>
                              <td>

                                  &nbsp;</td>
                          </tr>

                        </Table>
                </fieldset>
            </contentTemplate>
        </td>
    </tr>


</table>

    <table runat="server" style="width:500px">
        <tr>
            <td>
                <ContenTemplate>
                    <fieldset>
                    <legend>
                        <asp:Label runat="server" Text="Servicios Del Paquete"></asp:Label>
                    </legend>
                      <Table runat="server" style="width:500px">
                          <tr>
                              <td>

                              </td>
                          </tr>
                      </Table>
                    </fieldset>
                </ContenTemplate>
            </td>
        </tr>


    </table>


  



</form>



