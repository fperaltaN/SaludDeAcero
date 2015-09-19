<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Socios.aspx.cs" Inherits="SaludDeAcero.Catalogos.Socios" %>
    <form id="form1" runat="server">
        <div class="auto-style9">
  
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
    <asp:label id="LblTituloSocio" runat="server" text="Información Personal Socios" ></asp:label>
   
        </div>
    <Table ID="TblSocio" runat="server" style="width:500px">
        <tr>
            <td>              
                <ContentTemplate>
                    <fieldset>
                        <legend>
                            <asp:Label ID="Socio" runat="server" Text="Datos"></asp:Label>
                        </legend>
                        <table style="width:500px">
                            <tr>
                                <th style="text-align: justify" class="auto-style6">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp; 
                                    <asp:Label Id="LblNumSocio" runat="server" Text="Num. Socio"></asp:Label>
                                </th>
                                <th class="auto-style7" >
                                    <asp:TextBox ID="TxtNumSocio" runat="server"></asp:TextBox>
                                </th>  
                      
                            </tr>
                            <tr>
                                <th style="text-align: left" class="auto-style6">
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   <asp:Label Id="LblNombre" runat="server" Text="Nombre" style="text-align: left"></asp:Label>
                                </th>
                                <th class="auto-style7">
                                    <asp:TextBox ID="TxtNombre" runat="server"></asp:TextBox>
                                </th>
                            </tr>
                            <tr>
                                <th style="text-align: left" class="auto-style3">
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   <asp:Label Id="LblApPaterno" runat="server" Text="Apellido Paterno"></asp:Label>
                                </th>
                                <th class="auto-style5">
                                    <asp:TextBox ID="TxtApPaterno" runat="server"></asp:TextBox>
                                </th>
                            </tr>
                            <tr>
                                <th style="text-align: left" class="auto-style3">
                                   
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   
                                   <asp:Label Id="LblApMaterno" runat="server" Text="Apellido Materno"></asp:Label>
                                </th>
                                <th class="auto-style5">
                                    <asp:TextBox ID="TxtApMaterno" runat="server"></asp:TextBox>
                                </th>
                            </tr>
                            <tr>
                                <th style="text-align: left" class="auto-style3">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label Id="LblFechaNacimeinto" runat="server" Text="Fecha Nacimiento"></asp:Label>
                                </th>
                                <th class="auto-style5">
                                    <asp:TextBox ID="TxtFechaNacimiento" runat="server"></asp:TextBox>
                                </th>
                            </tr>
                            <tr>
                                <th style="text-align: left" class="auto-style3">
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   <asp:Label Id="LblTel" runat="server" Text="Telefono"></asp:Label>
                                </th>
                                <th class="auto-style5">
                                    <asp:TextBox ID="TxtTel" runat="server"></asp:TextBox>
                                </th>
                            </tr>
                            <tr>
                                <th style="text-align: left" class="auto-style3">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   <asp:Label Id="LblDirección" runat="server" Text="Dirección" style="text-align: left"></asp:Label>
                                </th>
                                <th class="auto-style5">
                                    <asp:TextBox ID="TxtDirección" runat="server"></asp:TextBox>
                                </th>
                            </tr>
                            <tr>
                                <th style="text-align: left" class="auto-style3" >                                   
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                   
                                   <asp:Label Id="LblPaquete" runat="server" Text="Paquete"></asp:Label>
                                </th>
                                <th class="auto-style5">
                                    <asp:DropDownList ID="DDLPaquete" runat="server" Height="16px" Width="136px">
                                    </asp:DropDownList>
                                </th>

                            </tr>
                                    
                            
                            <tr>
                                <th style="text-align: left" class="auto-style3">                                   
                                    &nbsp;</th>
                                <th class="auto-style5">
                                    &nbsp;</th>

                            </tr>
                                    
                            
                            <tr>
                                <th style="text-align: left" class="auto-style3">                                   
                                    &nbsp;</th>
                                <th class="auto-style5">
                                    &nbsp;</th>

                            </tr>
                                    
                            
                        </table>
                    </fieldset>
                </ContentTemplate>
            </td>
        </tr>
            </Table>

        <table ID="TblHM" runat="server" style="width:500px">
            <tr>
                <td>
                    <ContentTemplate>
                        <fieldset>
                            <legend>
                         <asp:Label ID="HistorialMedico" runat="server" Text="Antecedentes Socio"></asp:Label>
                            
                              </legend>
                          <table runat="server" style="width:500px">
                              <tr>
                                  <td class="auto-style9">
                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      <asp:Label runat="server" Text=" Medicos" style="text-align: center"></asp:Label>
                                  </td>
                                  <td class="auto-style9">
                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      <asp:Label runat="server" Text="Físicos"></asp:Label>
                                  </td>
                              </tr>
                              <tr>
                                  <td>

                                      <textarea id="TextArea1" cols="20" name="S1" style="width:200px; height: 100px;"></textarea></td>
                                  <td>


                                      <asp:TextBox ID="TextBox1" runat="server" style="width:200px;height:100px" OnTextChanged="TextBox1_TextChanged" ></asp:TextBox>
                                  </td>
                              </tr>
                              <tr>
                                  <td>

                                      &nbsp;</td>
                                  <td>

                                      &nbsp;</td>
                              </tr>
                              <tr>
                                  <td class="auto-style8">

                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                     <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" />
                                  </td>
                                  <td class="auto-style8">

                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                      <asp:Button ID="BtnAgregarSocio" runat="server" Text="Agregar Socio" />
                                  </td>
                              </tr>
                          </table>
                          </asp:Table>
                        </fieldset>
                    </ContentTemplate>
                </td>
            </tr>


        </table>





</form>






