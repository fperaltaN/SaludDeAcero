<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/MasterPage/SiteMaster.Master" AutoEventWireup="true" CodeBehind="VAdminSocios.aspx.cs" Inherits="SaludDeAcero.AdministraciónSocios.VAdminSocios" %>

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
    <asp:ScriptManager ID="ScriptManager1"
        runat="server" />
    <asp:UpdatePanel ID="UpdateDatos" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <h1 class="page-header">Administración de Socios
                        </h1>
                        <div class="container">
                            <ul class="nav nav-pills">
                                <li role="presentation">
                                    <asp:Button ID="btnAgregarSocio" class="btn btn-success btn-lg" runat="server" Text="Agregar Socio" OnClick="btnAgregarSocio_Click" />
                                    <%--<button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModalAddSocio">Agregar Socio</button>--%>

                                </li>
                                <li role="presentation">
                                    <asp:Button ID="btnModificarSocio" class="btn btn-warning btn-lg" runat="server" Text="Modificar Socio" OnClick="btnModificarSocio_Click" />
                                    <%--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalAUpdateSocio">Modificar Socio</button>--%>
                                </li>
                                <li role="presentation">
                                    <asp:Button ID="btnEstadoSocio" class="btn btn-info btn-lg" runat="server" Text="Cambiar de Estado Socio" OnClick="btnEstadoSocio_Click" />
                                    <%--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalEstadoSocio">Cambiar de Estado Socio</button>--%>
                                </li>
                                <li role="presentation">
                                    <asp:Button ID="btnHistorialSocio" class="btn btn-primary btn-lg" runat="server" Text="Consultar Historial de Pago" OnClick="btnHistorialSocio_Click" />
                                    <%--<button type="button" class="btn btn-primary btn-lg">Consultar Historial de Pago</button>--%>
                                </li>
                                <li role="presentation">
                                    <asp:Button ID="btnCancelarSocio" class="btn btn-danger btn-lg" runat="server" Text="Eliminar Socio" OnClick="btnCancelarSocio_Click" />
                                    <%--<button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#myModalDeleteSocio">Eliminar Socio</button>--%>
                                </li>
                            </ul>
                        </div>
                        <div class="table-responsive">
                            <h3 class="page-header">Registro de Socios</h3>
                            <dx:ASPxGridView ID="grdSocios" runat="server" KeyFieldName="" AutoGenerateColumns="False" Theme="Office2010Silver" Width="100%" OnLoad="grdSocios_Load" OnRowCommand="grdSocios_RowCommand" OnHtmlRowPrepared="grdSocios_HtmlRowPrepared">
                                <Columns>
                                    <%--<dx:GridViewCommandColumn ShowEditButton="true" VisibleIndex="0" />--%>
                                    <dx:GridViewDataTextColumn Caption="Acciones" VisibleIndex="0" Width="15%">
                                        <DataItemTemplate>
                                            <asp:LinkButton ID="linkEditar" Text="Seleccionar" runat="server" Visible="true" ForeColor="#666666"
                                                Font-Size="Small" Font-Underline="True"></asp:LinkButton>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataColumn Caption="Id" FieldName="id_empleado" VisibleIndex="0" Visible="false" />
                                    <dx:GridViewDataColumn Caption="Numero" FieldName="num_empleado" VisibleIndex="0" Width="8%" />
                                    <dx:GridViewDataColumn Caption="Nombre" FieldName="nombre" VisibleIndex="0" Width="15%" />
                                    <dx:GridViewDataColumn Caption="AP Paterno" FieldName="ap_paterno" VisibleIndex="0" Width="10%" />
                                    <dx:GridViewDataColumn Caption="AP Materno" FieldName="ap_materno" VisibleIndex="0" Width="10%" />
                                    <dx:GridViewDataColumn Caption="Direccion" FieldName="direccion" VisibleIndex="0" Width="15%" />
                                    <dx:GridViewDataColumn Caption="Perfil" FieldName="Perfil" VisibleIndex="0" Width="10%" />
                                    <dx:GridViewDataCheckColumn Caption="Activo" FieldName="activo" Visible="True" ReadOnly="false" VisibleIndex="20" Width="15%">
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

                            <dx:ASPxGridViewExporter ID="grdSociosExporter" runat="server" GridViewID="grdSocios">
                            </dx:ASPxGridViewExporter>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Registrar Socio -->
            <dx:ASPxPopupControl ID="popUpRegistrar" runat="server" Modal="true" HeaderText="Registro de Socios" AllowDragging="true"
                PopupHorizontalAlign="Center" PopupVerticalAlign="WindowCenter" ShowCloseButton="true" Width="700px" Height="570px" ScrollBars="Vertical"
                PopupAction="None" CloseAction="CloseButton" Theme="Office2010Silver">
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="maternoSocio">Número Socio</label>
                                                <asp:TextBox ID="txtNumero" class="form-control" runat="server" Text="" ToolTip="Ingrese Número  del Socio"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="nombreSocio">Nombre(s) Socio</label>
                                                <asp:TextBox ID="txtNombre" class="form-control" runat="server" Text="" ToolTip="Ingrese Nombre(s) del Socio"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="maternoSocio">Apellido Paterno</label>
                                                <asp:TextBox ID="txtApPaterno" class="form-control" runat="server" Text="" ToolTip="Ingrese Apellido Paterno del Socio"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="paternoSocio">Apellido Materno</label>
                                                <asp:TextBox ID="txtApMaterno" class="form-control" runat="server" Text="" ToolTip="Ingrese Apellido Materno del Socio"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="fechaSocio">Fecha de Nacimiento</label>
                                                <dx:ASPxDateEdit ID="txtFecha" runat="server" ToolTip="Ingrese Fecha de Nacimiento del Socio" Theme="Metropolis" Width="260px" Height="33px"></dx:ASPxDateEdit>
                                                <%--<asp:TextBox ID="txtFecha" class="form-control" runat="server" Text="" ToolTip="Ingrese Fecha de Nacimiento del Socio" TextMode="DateTime"></asp:TextBox>--%>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="telefonoSocio">Teléfono(s)</label>
                                                <asp:TextBox ID="txtTelefono" class="form-control" runat="server" Text="" ToolTip="Ingrese Teléfono(s) del Socio"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="direccionSocio">Dirección del Socio</label>
                                                <asp:TextBox ID="txtDireccion" class="form-control" runat="server" Text="" ToolTip="Ingrese Dirección del Socioo"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="paqueteSocio">Paquete</label>
                                                <div class="selectContainer">
                                                    <asp:DropDownList class="form-control" ID="ddlPaquete" runat="server" DataTextField="Nombre" DataValueField="Id_Paquete"></asp:DropDownList>

                                                </div>
                                                <p class="text-right"><a href="#">Ver Detalles del Paqute Seleccionado...</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="container">
                                    <h4 class="modal-title">Antecedentes del Socio</h4>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="direccionSocio">Médicos</label>
                                                <asp:TextBox ID="txtMedicos" class="form-control" runat="server" Text="" ToolTip="Ingrese los antecedentes Médicos" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="direccionSocio">Físicos</label>
                                                <asp:TextBox ID="txtFisicos" class="form-control" runat="server" Text="" ToolTip="Ingrese los antecedentes Físicos" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <asp:Label runat="server" ID="lblEstado" Text="Estado" Font-Bold="true"></asp:Label>
                                                <div class="selectContainer">
                                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                                        <asp:ListItem>Elija una Opcion..</asp:ListItem>
                                                        <asp:ListItem>Activo</asp:ListItem>
                                                        <%--<asp:ListItem>Suspendio</asp:ListItem>--%>
                                                        <asp:ListItem>Baja Temporal</asp:ListItem>
                                                        <%--<asp:ListItem>Baja Definitiva</asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button class="btn btn-default" data-dismiss="modal" ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                                <asp:Button class="btn btn-success" ID="btnGuardar" runat="server" Text="Guardar Socio" OnClick="btnGuardar_Click" />
                                <asp:Button class="btn btn-info" ID="btnActualizar" runat="server" Text="Actualiar Cambios" OnClick="btnActualizar_Click" />
                            </div>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>

            <!-- Actualizar Estado Socio -->
            <dx:ASPxPopupControl ID="popUpEstadoSocio" runat="server" Modal="true" HeaderText="Actualizar Estado Socio" AllowDragging="true"
                PopupHorizontalAlign="Center" PopupVerticalAlign="WindowCenter" ShowCloseButton="true" Width="700px" Height="350px" ScrollBars="Vertical"
                PopupAction="None" CloseAction="CloseButton" Theme="Office2010Silver">
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                        <div>
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label for="maternoSocio">Número Socio</label>
                                                    <asp:TextBox ID="txtNumeroEstado" class="form-control" runat="server" Text="" ToolTip="Ingrese Número  del Socio"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="nombreSocio">Nombre(s) Socio</label>
                                                    <asp:TextBox ID="txtNombreEstado" class="form-control" runat="server" Text="" ToolTip="Ingrese Nombre(s) del Socio"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="maternoSocio">Apellido Paterno</label>
                                                    <asp:TextBox ID="txtApPaternoEstado" class="form-control" runat="server" Text="" ToolTip="Ingrese Apellido Paterno del Socio"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="paternoSocio">Apellido Materno</label>
                                                    <asp:TextBox ID="txtApMaternoEstado" class="form-control" runat="server" Text="" ToolTip="Ingrese Apellido Materno del Socio"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="paqueteSocio">Estado</label>
                                                    <div class="selectContainer">
                                                        <asp:DropDownList class="form-control" ID="ddlEstado" runat="server">
                                                            <asp:ListItem>Activo</asp:ListItem>
                                                            <asp:ListItem>Suspendio</asp:ListItem>
                                                            <asp:ListItem>Baja Temporal</asp:ListItem>
                                                            <asp:ListItem>Baja por un Mes</asp:ListItem>
                                                            <asp:ListItem>Baja Definitiva</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button class="btn btn-default" data-dismiss="modal" ID="btnCancelarEstado" runat="server" Text="Cancelar Edición" OnClick="btnCancelarEstado_Click" />
                                        <asp:Button class="btn btn-success" ID="btnGuardarEstado" runat="server" Text="Guardar Cambios" OnClick="btnGuardarEstado_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>

            <!-- Modal Consulta historal Pagos Socio -->
            <dx:ASPxPopupControl ID="popUpConsultaHistorial" runat="server" Modal="true" HeaderText="Consultar de Historial de Socio por Periodo " AllowDragging="true"
                PopupHorizontalAlign="Center" PopupVerticalAlign="WindowCenter" ShowCloseButton="true" Width="900px" Height="550px" ScrollBars="Vertical"
                PopupAction="None" CloseAction="CloseButton" Theme="Office2010Silver">
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlConsultaHistorialSocio" runat="server">
                        <div>
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label for="maternoSocio">Numero Socio</label>
                                                    <asp:TextBox ID="txtNumeroSocioConPago" class="form-control" runat="server" Text="" ToolTip="Ingrese Número  del Socio"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label for="Nombre">Nombre(s) Socio</label>
                                                    <asp:TextBox ID="txtNombreSocioConPago" class="form-control" runat="server" Text="" ToolTip="Ingrese Nombre del Socio"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label for="Nombre">Apellido Paterno</label>
                                                    <asp:TextBox ID="txtApeidoPaternoConPago" class="form-control" runat="server" Text="" ToolTip="Ingrese Apellido Paterno"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label for="Nombre">Apellido Materno</label>
                                                    <asp:TextBox ID="txtApeidoMaternoConPago" class="form-control" runat="server" Text="" ToolTip="Ingrese Apellido Materno"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="Inicio">Inicio</label>
                                                    <dx:ASPxDateEdit ID="FechaInicioConPago" runat="server" Theme="Metropolis" Width="260px" Height="33px"></dx:ASPxDateEdit>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="Inicio">Final</label>
                                                    <dx:ASPxDateEdit ID="FechaFinalConPago" runat="server" Theme="Metropolis" Width="260px" Height="33px"></dx:ASPxDateEdit>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button runat="server" Text="Limpiar Información" ID="btnCanConPago" class="btn btn-default" data-dismiss="modal" OnClick="btnCanConPago_Click"></asp:Button>
                                    <asp:Button runat="server" Text="Consultar Periodo" ID="btnConPago" class="btn btn-success" OnClick="btnConPago_Click"></asp:Button>
                                </div>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <fieldset>
                                                    <legend>Consulta de Pagos</legend>
                                                    <dx:ASPxGridView ID="GVConsultaPagos" runat="server" KeyFieldName="" AutoGenerateColumns="False" Theme="Office2010Silver" Width="100%">
                                                        <Columns>
                                                            <%--<dx:GridViewCommandColumn ShowEditButton="true" VisibleIndex="0" />--%>
                                                            <dx:GridViewDataTextColumn Caption="Acciones" VisibleIndex="0" Width="15%">
                                                                <DataItemTemplate>
                                                                    <asp:LinkButton ID="linkEditar" Text="Editar" runat="server" Visible="true" ForeColor="#666666"
                                                                        Font-Size="Small" Font-Underline="True"></asp:LinkButton>
                                                                </DataItemTemplate>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataColumn Caption="Id" FieldName="" VisibleIndex="0" Visible="false" />
                                                            <dx:GridViewDataColumn Caption="Fecha Pago" FieldName="" VisibleIndex="0" Width="10%" />
                                                            <dx:GridViewDataColumn Caption="Vencimineto" FieldName="" VisibleIndex="0" Width="10%" />
                                                            <dx:GridViewDataColumn Caption="Paquete" FieldName="" VisibleIndex="0" Width="10%" />
                                                            <dx:GridViewDataColumn Caption="Monto" FieldName="" VisibleIndex="0" Width="10%" />
                                                            <dx:GridViewDataColumn Caption="Efectivo" FieldName="" VisibleIndex="0" Width="10%" />
                                                            <dx:GridViewDataCheckColumn Caption="Activo" FieldName="" Visible="True" ReadOnly="false" VisibleIndex="20" Width="15%">
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
                                                    <br />
                                                    <div style="text-align: right">
                                                        <asp:Button runat="server" Text="Reimprimir Comprobante Seleccionado" ID="BtnReimprimir" class="btn-warning" OnClick="BtnReimprimir_Click"></asp:Button>

                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group">

                                                <fieldset>
                                                    <legend>Asistencias</legend>
                                                    <dx:ASPxGridView ID="GvAsistencia" runat="server" KeyFieldName="" AutoGenerateColumns="False" Theme="Office2010Silver" Width="100%">
                                                        <Columns>
                                                            <%--<dx:GridViewCommandColumn ShowEditButton="true" VisibleIndex="0" />--%>
                                                            <dx:GridViewDataTextColumn Caption="Acciones" VisibleIndex="0" Width="15%">
                                                                <DataItemTemplate>
                                                                    <asp:LinkButton ID="linkEditar" Text="Editar" runat="server" Visible="true" ForeColor="#666666"
                                                                        Font-Size="Small" Font-Underline="True"></asp:LinkButton>
                                                                </DataItemTemplate>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataColumn Caption="Id" FieldName="" VisibleIndex="0" Visible="false" />
                                                            <dx:GridViewDataColumn Caption="Identificador de Sesión" FieldName="" VisibleIndex="0" Width="10%" />
                                                            <dx:GridViewDataColumn Caption="Fecha" FieldName="" VisibleIndex="0" Width="10%" />
                                                            <dx:GridViewDataColumn Caption="Hora Inicio" FieldName="" VisibleIndex="0" Width="10%" />
                                                            <dx:GridViewDataCheckColumn Caption="Activo" FieldName="" Visible="True" ReadOnly="false" VisibleIndex="20" Width="15%">
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
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>

            <!-- Modal Elimina  Socio -->
            <dx:ASPxPopupControl ID="popUpEliminarSocio" runat="server" Modal="true" HeaderText="Eliminar Socio" AllowDragging="true"
                PopupHorizontalAlign="Center" PopupVerticalAlign="WindowCenter" ShowCloseButton="true" Width="700px" Height="280px" ScrollBars="Vertical"
                PopupAction="None" CloseAction="CloseButton" Theme="Office2010Silver">
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="numeroSocio">Número Socio</label>
                                                <asp:TextBox ID="txtNumSocioEliminar" class="form-control" runat="server" Text="" ToolTip="Ingrese Número  del Socio"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="nombreSocio">Nombre(s) Socio</label>
                                                <asp:TextBox ID="txtNomSocioEliminar" class="form-control" runat="server" Text="" ToolTip="Ingrese Nombre(s) del Socio"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="maternoSocio">Apellido Paterno</label>
                                                <asp:TextBox ID="txtApPaternoEliminar" class="form-control" runat="server" Text="" ToolTip="Ingrese Apellido Paterno del Socio"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="paternoSocio">Apellido Materno</label>
                                                <asp:TextBox ID="txtApMaternoEliminar" class="form-control" runat="server" Text="" ToolTip="Ingrese Apellido Materno del Socio"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button class="btn btn-default" data-dismiss="modal" ID="btnCancelarEliminar" runat="server" Text="Cancelar Edición" OnClick="btnCancelarEliminar_Click" />
                                    <asp:Button class="btn btn-warning" ID="btnEliminarSocio" runat="server" Text="Guardar Cambios" OnClick="btnEliminarSocio_Click" />
                                </div>
                            </div>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>

            <!-- Modal Mensaje  Usuario -->
            <dx:ASPxPopupControl ID="popUpMensajeAplicación" runat="server" Modal="true" HeaderText="Mensaje de Aplicación" AllowDragging="true"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowCloseButton="true" Width="500px" Height="190px" ScrollBars="Vertical"
                PopupAction="None" CloseAction="CloseButton" Theme="Office2010Silver">
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl4" runat="server">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="Mensaje">Estado de la Transacción:</label>
                                            <br />
                                            &nbsp;&nbsp;&nbsp;<asp:Label ID="txtMensaje" runat="server" Text="" ToolTip="Mensaje de la aplicación"></asp:Label>
                                            <br />
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button class="btn btn-default" data-dismiss="modal" ID="btnMensajeApp" runat="server" Text="Entendido" OnClick="btnMensajeApp_Click" />
                                </div>
                            </div>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>

        </ContentTemplate>
    </asp:UpdatePanel>

    <br />
    <asp:LinkButton ID="lnkBtnWord" runat="server" OnClick="lnkBtnWord_Click">[Exportar a Word]</asp:LinkButton>
    &nbsp;
                <asp:LinkButton ID="lnkBtnExcel" runat="server" OnClick="lnkBtnExcel_Click">[Exportar a Excel]</asp:LinkButton>
    &nbsp;
                <asp:LinkButton ID="lnkBtnPDF" runat="server" OnClick="lnkBtnPDF_Click">[Exportar a PDF]</asp:LinkButton>
    &nbsp;
                <asp:LinkButton ID="lnkBtnImprimir" runat="server" OnClientClick="window.print();">[Imprimir]</asp:LinkButton>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../Scripts/ie10-viewport-bug-workaround.js"></script>
</asp:Content>
