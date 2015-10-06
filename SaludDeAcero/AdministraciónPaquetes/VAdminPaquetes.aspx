<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/SiteMaster.Master" AutoEventWireup="true" CodeBehind="VAdminPaquetes.aspx.cs" Inherits="Sisa.DiseñoPaqueta" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <%--<dx:GridViewCommandColumn ShowEditButton="true" VisibleIndex="0" />--%>
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
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <%--esto lo voy aponer dentro del div--%> 
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <h1 class="page-header">Administración de Paquetes
                </h1>
                <div class="container">
                    <ul class="nav nav-pills">
                        <li role="presentation">
                            <asp:Button ID="btnAgregarPaquete" class="btn btn-success btn-lg" runat="server" Text="Agregar Paqute" OnClick="btnAgregarPaquete_Click"  />
                            <%--<button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModalAddSocio">Agregar Socio</button>--%>

                        </li>
                        <li role="presentation">
                            <asp:Button ID="btnModificarPaquete" class="btn btn-info btn-lg" runat="server" Text="Modificar Paquete" OnClick="btnModificarPaquete_Click" />
                            <%--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalAUpdateSocio">Modificar Socio</button>--%>
                        </li>
                        <li role="presentation">
                            <asp:Button ID="btnctrlServicios" class="btn btn-info btn-lg" runat="server" Text="Control de Servicios" />
                            <%--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalEstadoSocio">Cambiar de Estado Socio</button>--%>
                        </li>
                     
                        <li role="presentation">
                            <asp:Button ID="btnEliminarPaquete" class="btn btn-danger btn-lg" runat="server" Text="Eliminar Paquete" />
                            <%--<button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#myModalDeleteSocio">Eliminar Socio</button>--%>
                        </li>
                    </ul>
                </div>
                <div class="table-responsive">
                    <h3 class="page-header">Registro de Paquetes</h3>
                    <dx:ASPxGridView ID="grdPaqutes" runat="server" KeyFieldName="" AutoGenerateColumns="False" Theme="Office2010Silver" Width="100%">
                        <Columns>
                            <%--<dx:GridViewCommandColumn ShowEditButton="true" VisibleIndex="0" />--%>
                            <dx:GridViewDataTextColumn Caption="Acciones" VisibleIndex="0" Width="5%">
                                <DataItemTemplate>
                                    <asp:LinkButton ID="linkEditar" Text="Editar" runat="server" Visible="true" ForeColor="#666666"
                                        Font-Size="Small" Font-Underline="True"></asp:LinkButton>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataColumn Caption="Id" FieldName="" VisibleIndex="0" Visible="false" />
                            <dx:GridViewDataColumn Caption="Nombre Paquete" FieldName="" VisibleIndex="0" Width="10%"/>
                            <dx:GridViewDataColumn Caption="Servicio" FieldName="" VisibleIndex="0" Width="5%" />
                            <dx:GridViewDataColumn Caption="Costo $" FieldName="" VisibleIndex="0" Width="5%" />
                            <dx:GridViewDataColumn Caption="Descripción" FieldName="" VisibleIndex="0" Width="10%" />
                            <dx:GridViewDataCheckColumn Caption="Activo" FieldName="" Visible="True" ReadOnly="false" VisibleIndex="5" Width="5%">
                                <DataItemTemplate>
                                    <asp:CheckBox ID="chkActivo" runat="server" Enabled="false" Checked='<%#Bind("ACTIVO")%>' />
                                </DataItemTemplate>
                            </dx:GridViewDataCheckColumn>
                        </Columns>
                        <SettingsBehavior ConfirmDelete="True" />
                        <SettingsText Title="Canales de comunicación" />
                        <SettingsLoadingPanel Text="" />
                        <Settings ShowTitlePanel="True" ShowFilterBar="Auto" ShowFilterRow="true" />
                        <SettingsPager NumericButtonCount="5" PageSize="5">
                            <PageSizeItemSettings Items="5" />
                        </SettingsPager>
                    </dx:ASPxGridView>
                </div>
            </div>
        </div>


        <!-- Modal Registrar Pauqete -->
        <dx:ASPxPopupControl ID="popUpEditarPaquete" runat="server" Modal="true" HeaderText="Registro de Paquetes" AllowDragging="true"
            PopupHorizontalAlign="Center" PopupVerticalAlign="WindowCenter" ShowCloseButton="true" Width="650px" Height="380px" ScrollBars="Vertical"
            PopupAction="None" CloseAction="CloseButton" Theme="Office2010Silver">
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlPaqutes" runat="server">

                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="nombrepaquete">Nombre del Paquete</label>
                                            <asp:TextBox ID="txtNombrePaquete" class="form-control" runat="server" Text="" ToolTip="Ingrese Nombre Del Paquete"></asp:TextBox>
                                        </div>
                                    </div>
                                    </div>
                                    <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="costo">Costo del Paquete</label>
                                            <asp:TextBox ID="txtCosto" class="form-control" runat="server" Text="" ToolTip="Ingrese el Costo del Paquete"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="Descripcion">Descripcón del Paquete</label>
                                            <asp:TextBox ID="txtdescripcionPaquete" class="form-control" runat="server" Text="" ToolTip="Descripcón del Paquete"></asp:TextBox>
                                        </div>
                                    </div>

                                  
                                </div>
                               
                              <%-- aqui trmina --%>
                            </div>
                            
                        </div>
                        <div class="modal-footer">
                            <asp:Button class="btn btn-default" data-dismiss="modal" ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                            <asp:Button class="btn btn-success" ID="btnGuardar" runat="server" Text="Guardar Paquete" />
                            <asp:Button class="btn btn-info" ID="btnActualizar" runat="server" Text="Gaurdar Cambios" />
                        </div>
                    </div>

                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
        <%--<div class="modal fade" id="myModalAddSocio" tabindex="-1" role="dialog" aria-labelledby="AddSocio">
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
                                <asp:TextBox ID="txtNumeroSocio" class="form-control" runat="server" Text="" ToolTip="Ingrese Nombre del Socio"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="nombreSocio">Nombre(s) Socio</label>
                                <asp:TextBox ID="txtNombreSocio" class="form-control" runat="server" Text="" ToolTip="Número de Socio"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="paternoSocio">Apellido Paterno</label>
                                <asp:TextBox ID="txtPaternoSocio" class="form-control" runat="server" Text="" ToolTip="Ingrese Apellido Paterno del Socio"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="maternoSocio">Apellido Materno</label>
                                <asp:TextBox ID="txtMaternoSocio" class="form-control" runat="server" Text="" ToolTip="Ingrese Apellido Materno del Socio"></asp:TextBox>

                            </div>
                            <div class="form-group">
                                <label for="fechaSocio">Fecha de Nacimiento</label>
                                <asp:TextBox ID="txtFechaSocio" class="form-control" runat="server" Text="" ToolTip="Ingrese Fecha de Nacimiento del Socio" TextMode="DateTime"></asp:TextBox>
                                <asp:Calendar ID="CldFechaNacimiento" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                    <TodayDayStyle BackColor="#CCCCCC" />
                                </asp:Calendar>
                            </div>
                            <div class="form-group">
                                <label for="telefonoSocio">Teléfono(s)</label>
                                <asp:TextBox ID="txtTelefonoSocio" class="form-control" runat="server" Text="" ToolTip="Ingrese Teléfono(s) del Socio"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="direccionSocio">Dirección del Socio</label>
                                <asp:TextBox ID="txtDireccionSocio" class="form-control" runat="server" Text="" ToolTip="Ingrese Dirección del Socioo"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="paqueteSocio">Paquete</label>
                                <div class="selectContainer">
                                    <asp:DropDownList class="form-control" ID="ddlPaqueteSocio" runat="server"></asp:DropDownList>

                                </div>
                                <p class="text-right"><a href="#">Ver Detalles del Paqute Seleccionado...</a></p>
                            </div>

                            <div class="container">
                                <h4 class="modal-title">Antecedentes del Socio</h4>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="direccionSocio">Médicos</label>
                                            <asp:TextBox ID="txtAntMedicos" class="form-control" runat="server" Text="" ToolTip="Ingrese los antecedentes Médicos" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="direccionSocio">Físicos</label>
                                            <asp:TextBox ID="txtAntFisicos" class="form-control" runat="server" Text="" ToolTip="Ingrese los antecedentes Físicos" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <asp:Button class="btn btn-default" data-dismiss="modal" ID="btnCancelar" runat="server" Text="Cancelar" />
                        <asp:Button class="btn btn-success" ID="btnGuardar" runat="server" Text="Guardar Socio" />
                        <asp:Button class="btn btn-info" ID="btnUpdSocio" runat="server" Text="Guardar Cambios" />
                    </div>
                </div>
            </div>
        </div>--%>
        
        

    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../Scripts/ie10-viewport-bug-workaround.js"></script>
</asp:Content>
