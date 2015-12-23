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
    <asp:ScriptManager ID="ScriptManager1"
        runat="server" />
    <asp:UpdatePanel ID="UpdateDatos" runat="server">
        <ContentTemplate>
            <%--esto lo voy aponer dentro del div--%>
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <h1 class="page-header">Administración de Paquetes
                        </h1>
                        <div class="container">
                            <ul class="nav nav-pills">
                                <li role="presentation">
                                    <asp:Button ID="btnAgregarPaquete" class="btn btn-success btn-lg" runat="server" Text="Agregar Paquete" OnClick="btnAgregarPaquete_Click" />
                                    <%--<button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModalAddSocio">Agregar Socio</button>--%>

                                </li>
                                <li role="presentation">
                                    <asp:Button ID="btnModificarPaquete" class="btn btn-info btn-lg" runat="server" Text="Modificar Paquete" OnClick="btnModificarPaquete_Click" />
                                    <%--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalAUpdateSocio">Modificar Socio</button>--%>
                                </li>
                                <li role="presentation">
                                    <asp:Button ID="btnctrlServicios" class="btn btn-primary btn-lg" runat="server" Text="Control de Servicios" OnClick="btnctrlServicios_Click" />
                                    <%--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalEstadoSocio">Cambiar de Estado Socio</button>--%>
                                </li>

                                <li role="presentation">
                                    <asp:Button ID="btnEliminarPaquete" class="btn btn-danger btn-lg" runat="server" Text="Eliminar Paquete" OnClick="btnEliminarPaquete_Click" />
                                    <%--<button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#myModalDeleteSocio">Eliminar Socio</button>--%>
                                </li>
                            </ul>
                        </div>
                        <div class="table-responsive">
                            <h3 class="page-header">Registro de Paquetes</h3>
                            <dx:ASPxGridView ID="grdPaquetes" runat="server" AutoGenerateColumns="False" Theme="Office2010Silver" Width="100%"
                                OnRowCommand="grdPaquetes_RowCommand" OnHtmlRowPrepared="grdPaquetes_HtmlRowPrepared" OnLoad="grdPaquetes_Load">
                                <Columns>
                                    <%--<dx:GridViewCommandColumn ShowEditButton="true" VisibleIndex="0" />--%>
                                    <dx:GridViewDataTextColumn Caption="Acciones" VisibleIndex="0" Width="5%">
                                        <DataItemTemplate>
                                            <asp:LinkButton ID="linkSeleccionar" Text="Seleccionar" runat="server" Visible="true" ForeColor="#666666"
                                                Font-Size="X-Small" Font-Underline="True"></asp:LinkButton>
                                            <asp:LinkButton ID="LinkCancelar" Text="Cancelar" runat="server" Visible="true" ForeColor="#666666"
                                                Font-Size="X-Small" Font-Underline="True"></asp:LinkButton>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataColumn Caption="Id" FieldName="id_paquete" VisibleIndex="0" Visible="false" />
                                    <dx:GridViewDataColumn Caption="Nombre Paquete" FieldName="nombre" VisibleIndex="0" Width="10%" />
                                    <dx:GridViewDataColumn Caption="Dias del Paquete" FieldName="diaspaquetes"  VisibleIndex="0" Width="5%" />
                                    <dx:GridViewDataColumn Caption="Costo $" FieldName="costo" VisibleIndex="0" Width="5%" />
                                    <dx:GridViewDataColumn Caption="Descripción" FieldName="descripcion" VisibleIndex="0" Width="10%" />
                                    <dx:GridViewDataCheckColumn Caption="Activo" FieldName="activo" Visible="True" ReadOnly="false" VisibleIndex="5" Width="5%">
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

                            <dx:ASPxGridViewExporter ID="grdPaquetesExporter" runat="server" GridViewID="grdPaquetes">
                            </dx:ASPxGridViewExporter>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Registrar Paquete -->
            <dx:ASPxPopupControl ID="popUpEditarPaquete" runat="server" Modal="true" HeaderText="Registro de Paquetes" AllowDragging="true"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowCloseButton="true" Width="700px" Height="320px" ScrollBars="Vertical"
                PopupAction="None" CloseAction="CloseButton" Theme="Office2010Silver">
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlPaqutes" runat="server">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="nombrepaquete">Nombre del Paquete</label>
                                                <asp:TextBox ID="txtNombrePaquete" class="form-control" runat="server" Text="" ToolTip="Ingrese Nombre Del Paquete"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="costo">Costo del Paquete</label>
                                                <asp:TextBox ID="txtCosto" class="form-control" runat="server" Text="" ToolTip="Ingrese el Costo del Paquete"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="Descripcion">Dias del Paquete</label>
                                                <asp:TextBox ID="txtDiasPaquete" class="form-control" runat="server" Text="" ToolTip="Dias del Paquete" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="Descripcion">Descripción del Paquete</label>
                                                <asp:TextBox ID="txtdescripcionPaquete" class="form-control" runat="server" Text="" ToolTip="Descripción del Paquete" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button class="btn btn-default" data-dismiss="modal" ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                                <asp:Button class="btn btn-success" ID="btnGuardar" runat="server" Text="Guardar Paquete" OnClick="btnGuardar_Click" />
                                <asp:Button class="btn btn-info" ID="btnActualizar" runat="server" Text="Guardar Cambios" OnClick="btnActualizar_Click" />
                            </div>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>


            <!-- Modal Elimina  Paquete -->
            <dx:ASPxPopupControl ID="popUpEliminarPaquete" runat="server" Modal="true" HeaderText="Eliminar Paquetes" AllowDragging="true"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowCloseButton="true"  Width="700px" Height="320px" ScrollBars="Vertical"
                PopupAction="None" CloseAction="CloseButton" Theme="Office2010Silver">
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="nombrepaquete">Nombre del Paquete</label>
                                                <asp:TextBox ID="txtNombrePaqueteEliminar" class="form-control" runat="server" Text="" ToolTip="Ingrese Nombre Del Paquete"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="costo">Costo del Paquete</label>
                                                <asp:TextBox ID="txtCostoEliminar" class="form-control" runat="server" Text="" ToolTip="Ingrese el Costo del Paquete"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="Descripcion">Descripción del Paquete</label>
                                                <asp:TextBox ID="txtdescripcionPaqueteEliminar" class="form-control" runat="server" Text="" ToolTip="Descripción del Paquete" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button class="btn btn-default" data-dismiss="modal" ID="btnCancelarEliminar" runat="server" Text="Cancelar Edición" OnClick="btnCancelarEliminar_Click" />
                                <asp:Button runat="server" Text="Eliminar Paquete" ID="btnEliminarCambios" class="btn btn-warning" OnClick="btnEliminarCambios_Click"></asp:Button>

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
                    <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
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
