<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/SiteMaster.Master" AutoEventWireup="true" CodeBehind="VAdminControlPagos.aspx.cs" Inherits="Sisa.ControlPagos" %>

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
                        <h1 class="page-header">Administración de Pagos</h1>
                        <div class="container">
                            <ul class="nav nav-pills">
                                <li role="presentation">
                                    <asp:Button ID="btnAgregarPago" class="btn btn-success btn-lg" runat="server" Text="Registrar Pago" OnClick="btnAgregarPago_Click" />
                                    <%--<button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModalAddSocio">Agregar Socio</button>--%>
                                </li>
                                <li role="presentation">
                                    <asp:Button ID="btnModificarPago" class="btn btn-info btn-lg" runat="server" Text="Ver Reporte Pagos" OnClick="btnModificarPago_Click" />
                                    <%--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalAUpdateSocio">Modificar Socio</button>--%>
                                </li>
                                <li role="presentation">
                                    <asp:Button ID="btnEliminarPago" class="btn btn-danger btn-lg" runat="server" Text="Elimina Pago" OnClick="btnEliminarPago_Click" />
                                    <%--<button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#myModalDeleteSocio">Eliminar Socio</button>--%>
                                </li>
                            </ul>
                        </div>
                        <div class="table-responsive">
                            <h3 class="page-header">Registro de Productos</h3>
                            <dx:ASPxGridView ID="grdPagos" runat="server" KeyFieldName="" AutoGenerateColumns="false" Theme="Office2010Silver" Width="100%" OnRowCommand="grdPagos_RowCommand" OnLoad="grdPagos_Load" OnHtmlRowPrepared="grdPagos_HtmlRowPrepared">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Seleccionar" VisibleIndex="0" Width="15%">
                                        <DataItemTemplate>
                                            <asp:LinkButton ID="linkSeleccionar" Text="Seleccionar" runat="server" Visible="true" ForeColor="#666666"
                                                Font-Size="X-Small" Font-Underline="True"></asp:LinkButton>
                                            <asp:LinkButton ID="LinkCancelar" Text="Cancelar" runat="server" Visible="true" ForeColor="#666666"
                                                Font-Size="X-Small" Font-Underline="True"></asp:LinkButton>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataColumn Caption="Pago" FieldName="id_pago" VisibleIndex="0" Visible="true" Width="5%" />
                                    <dx:GridViewDataColumn Caption="Socio" FieldName="Socio" VisibleIndex="0" Width="15%" />
                                    <dx:GridViewDataColumn Caption="Registro_Pago" FieldName="Registro_Pago" VisibleIndex="0" Width="15%" />                                    
                                    <dx:GridViewDataColumn Caption="Paquete" FieldName="paquete" VisibleIndex="0" Width="25%" />
                                    <dx:GridViewDataColumn Caption="Importe" FieldName="importe" VisibleIndex="0" Width="10%" />
                                    <dx:GridViewDataCheckColumn Caption="Activo" FieldName="activo" Visible="True" ReadOnly="false" VisibleIndex="10" Width="10%">
                                        <DataItemTemplate>
                                            <asp:CheckBox ID="chkActivo" runat="server" Enabled="false" Checked='<%#Bind("ACTIVO")%>' />
                                        </DataItemTemplate>
                                    </dx:GridViewDataCheckColumn>
                                </Columns>
                                <SettingsBehavior ConfirmDelete="True" />
                                <SettingsText Title="Administración de Control de Pagos" />
                                <SettingsLoadingPanel Text="Cargando..." />
                                <Settings ShowTitlePanel="True" ShowFilterBar="Auto" ShowFilterRow="true" VerticalScrollableHeight="300"  VerticalScrollBarMode ="Visible"/>
                                <SettingsPager NumericButtonCount="10" PageSize="10">
                                     <PageSizeItemSettings Visible="true" ShowAllItem="true" />
                                </SettingsPager>
                            </dx:ASPxGridView>

                            <dx:ASPxGridViewExporter ID="grdPagosExporter" runat="server" GridViewID="grdProductos">
                            </dx:ASPxGridViewExporter>
                        </div>

                    </div>
                </div>
            </div>

            <%--  aki inicia informacion de pago --%>
            <!-- Modal Registrar Socio -->
            <dx:ASPxPopupControl ID="popUpRegistrar" runat="server" Modal="true" HeaderText="Registro de Pagos" AllowDragging="true"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowCloseButton="true" Width="700px" Height="570px" ScrollBars="Vertical"
                PopupAction="None" CloseAction="CloseButton" Theme="Office2010Silver">
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="txtNumero">Número Socio</label>
                                                 <div class="selectContainer">
                                                    <asp:DropDownList class="form-control" ID="ddlNumero" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlNumero_SelectedIndexChanged"></asp:DropDownList>
                                                </div>                                               
                                            </div>
                                        </div>
                                        <div class="col-md-3">
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
                                                <label for="paqueteSocio">Paquete</label>
                                                <div class="selectContainer">
                                                    <asp:DropDownList class="form-control" ID="ddlPaquete" runat="server" DataTextField="Nombre" DataValueField="Id_Paquete"></asp:DropDownList>

                                                </div>
                                                <p class="text-right"><a href="#">Ver Detalles del Paquete Seleccionado...</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="FechaVence">Fecha Vencimiento</label>
                                                <dx:ASPxDateEdit ID="txtFecha" runat="server" Theme="Metropolis" Width="260px" Height="33px"></dx:ASPxDateEdit>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="Adeudos">Adeudos</label>
                                                <asp:TextBox ID="txtAdeudos" class="form-control" runat="server" Text="" ToolTip="Adeudos"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="total">Totar a Pagar</label>
                                                <asp:TextBox ID="txtTotalPagar" class="form-control" runat="server" Text="" ToolTip="Total de Pago"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="total">Total Recibido</label>
                                                <asp:TextBox ID="txtTotalRecibido" class="form-control" runat="server" Text="" ToolTip="Total Recibido"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <asp:Label runat="server" ID="lblEstado" Text="Estado" Font-Bold="true"></asp:Label>
                                                <div class="selectContainer">
                                                    <asp:DropDownList class="form-control" ID="ddlEstado" runat="server">
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
                                <asp:Button class="btn btn-success" ID="btnGuardar" runat="server" Text="Guardar Pago" OnClick="btnGuardar_Click" />
                                <asp:Button class="btn btn-info" ID="btnActualizar" runat="server" Text="Actualiar Cambios" OnClick="btnActualizar_Click" />
                            </div>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>


            <dx:ASPxPopupControl ID="popupcontrolConsultaPagos" runat="server" Modal="true" HeaderText="Consultar de Historial de Pagos " AllowDragging="true"
                PopupHorizontalAlign="Center" PopupVerticalAlign="WindowCenter" ShowCloseButton="true" Width="800px" Height="350px" ScrollBars="Vertical"
                PopupAction="None" CloseAction="CloseButton" Theme="Office2010Silver">
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlPagos" runat="server">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <fieldset>
                                            <legend>Consulta de Pagos</legend>
                                            <dx:ASPxGridView ID="GvPagos" runat="server" KeyFieldName="" AutoGenerateColumns="False" Theme="Office2010Silver" Width="100%">
                                                <Columns>
                                                    <%--<dx:GridViewCommandColumn ShowEditButton="true" VisibleIndex="0" />--%>
                                                    <dx:GridViewDataTextColumn Caption="Acciones" VisibleIndex="0" Width="10%">
                                                        <DataItemTemplate>
                                                            <asp:LinkButton ID="linkEditar" Text="Editar" runat="server" Visible="true" ForeColor="#666666"
                                                                Font-Size="Small" Font-Underline="True"></asp:LinkButton>
                                                        </DataItemTemplate>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataColumn Caption="Id" FieldName="" VisibleIndex="0" Visible="false" />
                                                    <dx:GridViewDataColumn Caption="Folio" FieldName="" VisibleIndex="0" Width="10%" />
                                                    <dx:GridViewDataColumn Caption="Numero Socio" FieldName="" VisibleIndex="0" Width="10%" />
                                                    <dx:GridViewDataColumn Caption="Fecha" FieldName="" VisibleIndex="0" Width="10%" />
                                                    <dx:GridViewDataColumn Caption="Concepto" FieldName="" VisibleIndex="0" Width="10%" />
                                                    <dx:GridViewDataColumn Caption="Monto" FieldName="" VisibleIndex="0" Width="10%" />
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
