<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/SiteMaster.Master" AutoEventWireup="true" CodeBehind="VAdminEmpleados.aspx.cs" Inherits="SaludDeAcero.Administración.VAdminEmpleados" %>

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
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <h1 class="page-header">Administración de Empleados
                </h1>
                <div class="container">
                    <ul class="nav nav-pills">
                        <li role="presentation">
                            <asp:Button ID="btnAgregarEmpleado" class="btn btn-success btn-lg" runat="server" Text="Agregar Empleado" OnClick="btnAgregarEmpleado_Click" />
                        </li>
                        <li role="presentation">
                            <asp:Button ID="btnModificarEmpleado" class="btn btn-info btn-lg" runat="server" Text="Modificar Empleado" OnClick="btnModificarEmpleado_Click" />
                        </li>
                        <li role="presentation">
                            <asp:Button ID="btnConsultarHistorialEmpleado" class="btn btn-primary btn-lg" runat="server" Text="Consultar Historial Asistencias" OnClick="btnConsultarHistorialEmpleado_Click" />
                        </li>
                        <li role="presentation">
                            <asp:Button ID="btnBorrarEmpleado" class="btn btn-danger btn-lg" runat="server" Text="Eliminar Empleado" OnClick="btnBorrarEmpleado_Click" />
                        </li>
                    </ul>
                </div>
                <div class="table-responsive">
                    <h3 class="page-header">Registro de Empleados</h3>
                    <dx:ASPxGridView ID="grdEmpleados" runat="server" KeyFieldName="" AutoGenerateColumns="false" Theme="Office2010Silver" Width="100%">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Acciones" VisibleIndex="0" Width="15%">
                                <DataItemTemplate>
                                    <asp:LinkButton ID="linkEditar" Text="Editar" runat="server" Visible="true" ForeColor="#666666"
                                        Font-Size="Small" Font-Underline="True"></asp:LinkButton>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataColumn Caption="Id" FieldName="" VisibleIndex="0" Visible="false" />
                            <dx:GridViewDataColumn Caption="NOMBRE COMPLETO" FieldName="" VisibleIndex="0" Width="70%" />
                            <dx:GridViewDataCheckColumn Caption="Activo" FieldName="" Visible="True" ReadOnly="false" VisibleIndex="20" Width="15%">
                                <DataItemTemplate>
                                    <asp:CheckBox ID="chkActivo" runat="server" Enabled="false" Checked='<%#Bind("ACTIVO")%>' />
                                </DataItemTemplate>
                            </dx:GridViewDataCheckColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <br />
                        <asp:LinkButton ID="lnkBtnWord" runat="server" OnClick="lnkBtnWord_Click">[Exportar a Word]</asp:LinkButton>
                        &nbsp;
                <asp:LinkButton ID="lnkBtnExcel" runat="server" OnClick="lnkBtnExcel_Click">[Exportar a Excel]</asp:LinkButton>
                        &nbsp;
                <asp:LinkButton ID="lnkBtnPDF" runat="server" OnClick="lnkBtnPDF_Click">[Exportar a PDF]</asp:LinkButton>
                        &nbsp;
                <asp:LinkButton ID="lnkBtnImprimir" runat="server" OnClientClick="window.print();">[Imprimir]</asp:LinkButton>

                        <dx:ASPxGridViewExporter ID="grdEmpleadosExporter" runat="server" GridViewID="grdEmpleados">
                        </dx:ASPxGridViewExporter>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Registrar Empleado -->
    <dx:ASPxPopupControl ID="popUpEditarAgregarEmpleado" runat="server" Modal="true" HeaderText="Agregar Empleado" AllowDragging="true"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowCloseButton="true" Width="550px" Height="440px" ScrollBars="Vertical"
        PopupAction="None" CloseAction="CloseButton" Theme="Office2010Silver">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlEmpleado" runat="server">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="maternoSocio">Numero Empleado</label>
                                        <asp:TextBox ID="txtNumero" class="form-control" runat="server" Text="" ToolTip="Ingrese Número  del Empleado"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="NombreEmpleado">Nombre(s) Empleado</label>
                                        <asp:TextBox ID="txtNombre" class="form-control" runat="server" Text="" ToolTip="Ingrese Nombre(s) del Empleado"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="ApPaterno">Apellido Paterno</label>
                                        <asp:TextBox ID="txtApPaterno" class="form-control" runat="server" Text="" ToolTip="Ingrese Apellido Paterno del Empleado"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="maternoSocio">Apellido Materno</label>
                                        <asp:TextBox ID="txtApMaterno" class="form-control" runat="server" Text="" ToolTip="Ingrese Apellido Paterno del Empleado"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label for="Domicilio">Dirección</label>
                                        <asp:TextBox ID="TxtDireccion" class="form-control" runat="server" Text="" ToolTip="Ingrese el Domicilio del Empleado"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="lblEstado" Text="Estado"></asp:Label>
                                        <div class="selectContainer">
                                            <asp:DropDownList class="form-control" ID="ddlEstado" runat="server">
                                                <asp:ListItem>Activo</asp:ListItem>
                                                <asp:ListItem>Suspendio</asp:ListItem>
                                                <asp:ListItem>Baja Temporal</asp:ListItem>
                                                <asp:ListItem>Baja Definitiva</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="tipoUsuario">Tipo de Usuario</label>
                                        <div class="selectContainer">
                                            <asp:DropDownList class="form-control" ID="ddlTipoUsuario" runat="server"></asp:DropDownList>
                                            <%-- <asp:RequiredFieldValidator ID="ValidatorTipoUsuario" runat="server" ErrorMessage="*Seleccionar un tipo de usuario" ControlToValidate="ddlTipoUsuario"></asp:RequiredFieldValidator>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button class="btn btn-default" data-dismiss="modal" ID="btnCancelar" runat="server" Text="Cancelar Edición" OnClick="btnCancelar_Click" />
                            <asp:Button class="btn btn-success" ID="btnGuardar" runat="server" Text="Guardar Cambios" />
                            <asp:Button class="btn btn-info" ID="btnActualizar" runat="server" Text="Actualizar Cambios" OnClick="btnActualizar_Click" />
                        </div>
                    </div>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <!-- Modal Registrar Empleado -->
    <dx:ASPxPopupControl ID="popupcontrolConsultaAsistencias" runat="server" Modal="true" HeaderText="Consultar de Historial de Asistencias " AllowDragging="true"
        PopupHorizontalAlign="Center" PopupVerticalAlign="WindowCenter" ShowCloseButton="true" Width="800px" Height="350px" ScrollBars="Vertical"
        PopupAction="None" CloseAction="CloseButton" Theme="Office2010Silver">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlAsistencias" runat="server">
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
                                                    <asp:LinkButton ID="LinkSeleccionarAsistencia" Text="Editar" runat="server" Visible="true" ForeColor="#666666"
                                                        Font-Size="Small" Font-Underline="True"></asp:LinkButton>
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataColumn Caption="Id" FieldName="" VisibleIndex="0" Visible="false" />
                                            <dx:GridViewDataColumn Caption="Nombre Empleado" FieldName="" VisibleIndex="0" Width="10%" />
                                            <dx:GridViewDataColumn Caption="Fecha" FieldName="" VisibleIndex="0" Width="10%" />
                                            <dx:GridViewDataColumn Caption="Hora Etrada" FieldName="" VisibleIndex="0" Width="10%" />
                                            <dx:GridViewDataColumn Caption="Hora Salida" FieldName="" VisibleIndex="0" Width="10%" />
                                            <dx:GridViewDataCheckColumn Caption="Activo" FieldName="" Visible="True" ReadOnly="false" VisibleIndex="20" Width="15%">
                                                <DataItemTemplate>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false" Checked='<%#Bind("ACTIVO")%>' />
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

    <!-- Modal Elimina  Usuario -->
    <dx:ASPxPopupControl ID="popUpEliminarEmpleado" runat="server" Modal="true" HeaderText="Eliminar Empleado" AllowDragging="true"
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
                                        <label for="numeroSocio">Numero Empleado</label>
                                        <asp:TextBox ID="TxtBnumEmpleado" class="form-control" runat="server" Text="" ToolTip="Ingrese Número  del Empleado"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="NombreEmpleado">Nombre(s) Empleado</label>
                                        <asp:TextBox ID="TxtBNombre" class="form-control" runat="server" Text="" ToolTip="Ingrese Nombre(s) del Empleado"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="ApPaterno">Apellido Paterno</label>
                                        <asp:TextBox ID="TxtBapPaterno" class="form-control" runat="server" Text="" ToolTip="Ingrese Apellido Paterno del Empleado"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="maternoSocio">Apellido Materno</label>
                                        <asp:TextBox ID="TxtBapMaterno" class="form-control" runat="server" Text="" ToolTip="Ingrese Apellido Paterno del Empleado"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button class="btn btn-default" data-dismiss="modal" ID="btnCancelarEliminar" runat="server" Text="Cancelar Edición" OnClick="btnCancelarEliminar_Click" />
                            <asp:Button class="btn btn-warning" ID="btnEliminarSocio" runat="server" Text="Guardar Cambios" />
                        </div>
                    </div>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

</asp:Content>
