<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/SiteMaster.Master" AutoEventWireup="true" CodeBehind="VAdminInventario.aspx.cs" Inherits="Sisa.AdministraciónInvetario.VAdminInventario" %>

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
                        <h1 class="page-header">&nbsp;Articulos</h1>
                        <div class="container">
                            <ul class="nav nav-pills">
                                <li role="presentation">
                                    <asp:Button ID="btnAgregarProducto" class="btn btn-success btn-lg" runat="server" Text="Agregar Producto" OnClick="btnAgregarProducto_Click" />
                                </li>
                                <li role="presentation">
                                    <asp:Button ID="btnModificarProducto" class="btn btn-info btn-lg" runat="server" Text="Modificar Producto" OnClick="btnModificarProducto_Click" />
                                </li>
                                <li>
                                    <asp:Button ID="btnEliminarProducto" class="btn btn-danger btn-lg" runat="server" Text="Eliminar Producto" OnClick="btnEliminarProducto_Click" />
                                </li>
                                <li>
                                    <asp:Button runat="server" Text="Ventas" ID="btnVentasProducto" class="btn btn-warning btn-lg" OnClick="btnVentasProducto_Click"></asp:Button>
                                </li>
                            </ul>
                        </div>
                        <div class="table-responsive">
                            <h3 class="page-header">Registro de Productos</h3>
                            <dx:ASPxGridView ID="grdProductos" runat="server" KeyFieldName="" AutoGenerateColumns="false" Theme="Office2010Silver" Width="100%" OnRowCommand="grdProductos_RowCommand" OnLoad="grdProductos_Load" OnHtmlRowPrepared="grdProductos_HtmlRowPrepared">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Seleccionar" VisibleIndex="0" Width="15%">
                                        <DataItemTemplate>
                                            <asp:LinkButton ID="linkSeleccionar" Text="Seleccionar" runat="server" Visible="true" ForeColor="#666666"
                                                Font-Size="X-Small" Font-Underline="True"></asp:LinkButton>
                                            <asp:LinkButton ID="LinkCancelar" Text="Cancelar" runat="server" Visible="true" ForeColor="#666666"
                                                Font-Size="X-Small" Font-Underline="True"></asp:LinkButton>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataColumn Caption="Id" FieldName="" VisibleIndex="0" Visible="false" />
                                    <dx:GridViewDataColumn Caption="Nombre producto" FieldName="nombre" VisibleIndex="0" Width="10%" />
                                    <dx:GridViewDataColumn Caption="Descripción" FieldName="descripcion" VisibleIndex="0" Width="20%" />
                                    <dx:GridViewDataColumn Caption="Costo $" FieldName="costo" VisibleIndex="0" Width="10%" />
                                    <dx:GridViewDataColumn Caption="Existencia" FieldName="existencia" VisibleIndex="0" Width="10%" />
                                    <dx:GridViewDataCheckColumn Caption="Activo" FieldName="" Visible="True" ReadOnly="false" VisibleIndex="20" Width="15%">
                                        <DataItemTemplate>
                                            <asp:CheckBox ID="chkActivo" runat="server" Enabled="false" Checked='<%#Bind("ACTIVO")%>' />
                                        </DataItemTemplate>
                                    </dx:GridViewDataCheckColumn>
                                </Columns>
                            </dx:ASPxGridView>

                            <dx:ASPxGridViewExporter ID="grdProductosExporter" runat="server" GridViewID="grdProductos">
                            </dx:ASPxGridViewExporter>
                        </div>

                    </div>
                </div>

                <%--Agrega o Edita el produto--%>
                <dx:ASPxPopupControl ID="PopupControlInvetarioEntrada" runat="server" Modal="true" HeaderText="Inventario Entradas" AllowDragging="true"
                    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowCloseButton="true" Width="660px" Height="410px" ScrollBars="Vertical"
                    PopupAction="None" CloseAction="CloseButton" Theme="Office2010Silver">
                    <ContentCollection>
                        <dx:PopupControlContentControl ID="PopupControlConsultaHistorialSocio" runat="server">
                            <div>
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="nombre">Nombre</label>
                                                        <asp:TextBox runat="server" ToolTip="Ingrese el nombre producto" ID="txtNombre" class="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="dclave">Clave</label>
                                                        <asp:TextBox runat="server" ToolTip="Ingrese una descripción del producto" ID="TxtClave" class="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="descripcion">Descripción</label>
                                                        <asp:TextBox runat="server" ToolTip="Ingrese una descripción del producto" ID="TxtDescripcion" class="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="Costo">Costo Unitario</label>
                                                        <asp:TextBox runat="server" ToolTip="Ingrese Costo del producto" ID="Txtcosto" class="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="cantidad">Cantidad</label>
                                                        <asp:TextBox runat="server" ToolTip="Ingrese la catidad de productos" ID="Txtcantidad" class="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
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
                                        <div class="modal-footer">
                                            <asp:Button class="btn btn-default" data-dismiss="modal" ID="btnCancelar" runat="server" Text="Cancelar Edición" OnClick="btnCancelar_Click" />
                                            <asp:Button class="btn btn-success" ID="btnGuardar" runat="server" Text="Guardar Cambios" OnClick="btnGuardar_Click" />
                                            <asp:Button class="btn btn-info" ID="btnActualizar" runat="server" Text="Actualizar Cambios" OnClick="btnActualizar_Click" />
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>


                <%--eliminar prdoducto--%>
                <dx:ASPxPopupControl ID="popEliminarProducto" runat="server" Modal="true" HeaderText="Eliminar producto" AllowDragging="true"
                    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowCloseButton="true" Width="650px" Height="300px" ScrollBars="Vertical"
                    PopupAction="None" CloseAction="CloseButton" Theme="Office2010Silver">
                    <ContentCollection>
                        <dx:PopupControlContentControl ID="PopupControlEliminarProducto" runat="server">
                            <div>
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label for="nombre">Nombre</label>
                                                        <asp:TextBox runat="server" ToolTip="Ingrese el nombre producto" ID="TxteNombre" class="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label for="Costo">Costo Unitario</label>
                                                        <asp:TextBox runat="server" ToolTip="Ingrese Costo del producto" ID="TxteCosto" class="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label for="cantidad">Cantidad</label>
                                                        <asp:TextBox runat="server" ToolTip="Ingrese la catidad de productos" ID="TxteCantidad" class="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <label for="descripcion">Descripción</label>
                                                        <asp:TextBox runat="server" ToolTip="Ingrese una descripción del producto" ID="TxteDescripcion" class="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button class="btn btn-default" data-dismiss="modal" ID="BtnCancelarEliminacion" runat="server" Text="Cancelar Edición" OnClick="BtnCancelarEliminacion_Click" />
                                            <asp:Button runat="server" Text="Guardar Cambios" ID="BtnEliminar" class="btn btn-warning" OnClick="BtnEliminar_Click"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>

                <%--inicia Pop de Ventas--%>
                <dx:ASPxPopupControl ID="popVenta" runat="server" Modal="true" HeaderText="Venta de productos Salud de Acero " AllowDragging="true"
                    PopupHorizontalAlign="Center" PopupVerticalAlign="WindowCenter" ShowCloseButton="true" Width="900px" Height="550px" ScrollBars="Vertical"
                    PopupAction="None" CloseAction="CloseButton" Theme="Office2010Silver">
                    <ContentCollection>
                        <dx:PopupControlContentControl ID="PopupControlVenta" runat="server">
                            <div>
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="producto">Seleccione Producto</label>
                                                        <div class="selectContainer">
                                                            <asp:DropDownList class="form-control" ID="ddlProducto" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProducto_SelectedIndexChanged"></asp:DropDownList>
                                                            <%-- <asp:RequiredFieldValidator ID="ValidatorTipoUsuario" runat="server" ErrorMessage="*Seleccionar un tipo de usuario" ControlToValidate="ddlTipoUsuario"></asp:RequiredFieldValidator>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label for="Descripcion">Nombre</label>
                                                        <asp:TextBox ID="txtVentaNombre" class="form-control" runat="server" Text="" ToolTip="Ingrese Nombre del Socio"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label for="Inicio">Fecha venta</label>
                                                        <asp:TextBox ID="TxtFechaVenta" class="form-control" runat="server" Text="" ToolTip="Ingrese Número  del Socio"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="nombre">Descripcion</label>
                                                        <asp:TextBox ID="TxtVentaDescripcion" class="form-control" runat="server" Text="" ToolTip="Ingrese Número  del Socio"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">


                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label for="Nombre">Costo</label>
                                                        <asp:TextBox ID="txtVentaCosto" class="form-control" runat="server" Text="" ToolTip="Ingrese Apellido Paterno"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label for="Cantidad">Cantidad</label>
                                                        <asp:TextBox ID="txtVentaCantidad" class="form-control" runat="server" Text="" ToolTip="Ingrese Nombre del Socio"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <label for="Total">Total</label>
                                                        <asp:TextBox ID="txtTotalVenta" class="form-control" runat="server" Text="" ToolTip="Ingrese Nombre del Socio"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button runat="server" Text="Limpiar Información" ID="btnLimpiain" class="btn btn-default" data-dismiss="modal"></asp:Button>
                                            <asp:Button runat="server" Text="Realizar Venta" ID="btnagregar" class="btn btn-success"></asp:Button>
                                        </div>
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <div class="form-group">
                                                        <fieldset>
                                                            <legend>Información productos</legend>
                                                            <dx:ASPxGridView ID="GVListaProductos" runat="server" KeyFieldName="" AutoGenerateColumns="False" Theme="Office2010Silver" Width="100%">
                                                                <Columns>
                                                                    <%--<dx:GridViewCommandColumn ShowEditButton="true" VisibleIndex="0" />--%>
                                                                    <dx:GridViewDataTextColumn Caption="Acciones" VisibleIndex="0" Width="15%">
                                                                        <DataItemTemplate>
                                                                            <asp:LinkButton ID="linkEditar" Text="Editar" runat="server" Visible="true" ForeColor="#666666"
                                                                                Font-Size="Small" Font-Underline="True"></asp:LinkButton>
                                                                        </DataItemTemplate>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataColumn Caption="Id" FieldName="" VisibleIndex="0" Visible="false" />
                                                                    <dx:GridViewDataColumn Caption="Producto" FieldName="" VisibleIndex="0" Width="10%" />
                                                                    <dx:GridViewDataColumn Caption="Descripción" FieldName="" VisibleIndex="0" Width="10%" />
                                                                    <dx:GridViewDataColumn Caption="Cantidad" FieldName="" VisibleIndex="0" Width="10%" />
                                                                    <dx:GridViewDataColumn Caption="Costo" FieldName="" VisibleIndex="0" Width="10%" />

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
                                                                <%--<asp:Button runat="server" Text="Realizar Venta" ID="Btnrealizar Venta" class="btn-warning"></asp:Button>--%>
                                                                <asp:Button ID="btnRealizarVenta" runat="server" Text="Realizar Venta" CssClass="btn-warning" />
                                                            </div>
                                                        </fieldset>
                                                    </div>
                                                </div>
                                            </div>
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
            </div>

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

