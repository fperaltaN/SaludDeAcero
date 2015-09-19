<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Empleado.aspx.cs" Inherits="SaludDeAcero.Catalogos.Empleado" %>

<!DOCTYPE html>
  <head>
      <style type="text/css">
          .auto-style1 {
              text-align: justify;
          }
      </style>
</head>
  <form id="form1" runat="server">
  <asp:label id="LblTituloEmpleado" runat="server" text="Información Personal Empleado" ></asp:label>
     <Table ID="TblEmpleado" runat="server" style="width:500px">
         <tr>
            <td>             
                <ContentTemplate>
                    <fieldset>
                        <legend>
                            <asp:Label ID="DatosEmpleado" runat="server" Text="Datos"></asp:Label>
                        </legend>
                         <Table runat="server" style="width:500px">
                              <tr>
                                  <td>
                                  </td>
                                  <td>
                                  </td>
                               </tr>
                             
                               <tr>
                                  <td>
                                     <asp:Label ID="LblNombre" runat="server" Text="Nombre"></asp:Label>
                                  </td>
                                  <td>
                                     <asp:TextBox ID="TxtNombre" runat="server"></asp:TextBox>
                                   </td>
                                </tr>
                             <tr>
                                  <td>
                                  <asp:Label ID="LblApPaterno" runat="server" Text="Apellido Paterno"></asp:Label>
                                  </td>
                                  <td>
                                     <asp:TextBox ID="TxtApPaterno" runat="server"></asp:TextBox>
                                  </td>
                            </tr>
                              <tr>
                                  <td>
                                     <asp:Label ID="LblMaterno" runat="server" Text="Apellido Materno"></asp:Label>
                                  </td>
                                  <td>
                                     <asp:TextBox ID="TxtApMaterno" runat="server"></asp:TextBox>
                                  </td>
                            </tr>

                              <tr>
                                  <td>

                                  <asp:Label ID="LblTelefono" runat="server" Text="Telefono"></asp:Label>

                                  </td>
                                  <td>
                                     <asp:TextBox ID="TxtTelefono" runat="server"></asp:TextBox>
                                  </td>
                            </tr>

                              <tr>
                                  <td>

                                  <asp:Label ID="LblNomUsuario" runat="server" Text="Nombre Usuario"></asp:Label>

                                  </td>
                                  <td>
                                     <asp:TextBox ID="TxtTelefono0" runat="server"></asp:TextBox>
                                  </td>
                            </tr>

                              <tr>
                                  <td>

                                  <asp:Label ID="LblContraseña" runat="server" Text="Contraseña"></asp:Label>

                                  </td>
                                  <td>
                                     <asp:TextBox ID="TxtContraseña" runat="server"></asp:TextBox>
                                  </td>
                            </tr>

                              <tr>
                                  <td>

                                  <asp:Label ID="LblConfirmarContraseña" runat="server" Text="ConfirmarContraseña"></asp:Label>

                                  </td>
                                  <td>
                                     <asp:TextBox ID="TxtConfirmarContraseña" runat="server"></asp:TextBox>
                                  </td>
                              </tr>

                              <tr>
                                  <td>

                                  <asp:Label ID="LblTipoUsuario" runat="server" Text="Tipo Usuario"></asp:Label>

                                  </td>
                                  <td>
                                     <asp:TextBox ID="TxtTipoUsuario" runat="server"></asp:TextBox>
                                  </td>
                            </tr>

                              <tr>
                                  <td>
                                     </td>
                                  <td>
                                     </td>
                              </tr>
                               <tr>
                                   <td>

                                   </td>
                                   <td>

                                   </td>
                               </tr>
                              <tr>
                                  <td>
                                      <asp:Button ID="Button1" runat="server" Text="Cancelar" />
                                  </td>
                                  <td>
                                      <asp:Button ID="Button2" runat="server" Text="Guardar Empleado" />
                                  </td>
                            </tr>
                         </Table>
                      </fieldset>
                  </ContentTemplate>
              </td>
      </tr>
     </Table>
  </form>





