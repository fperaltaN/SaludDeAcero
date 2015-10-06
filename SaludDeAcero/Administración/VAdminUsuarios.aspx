<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/SiteMaster.Master" AutoEventWireup="true" CodeBehind="VAdminUsuarios.aspx.cs" Inherits="Sisa.AdministracionUsuarios" %>

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
                            <%--<button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModalAddSocio">Agregar Socio</button>--%>

                        </li>
                        <li role="presentation">
                            <asp:Button ID="btnModificarEmplaedo" class="btn btn-info btn-lg" runat="server" Text="Modificar Empleado" OnClick="btnModificarEmplaedo_Click"  />
                            <%--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalAUpdateSocio">Modificar Socio</button>--%>
                        </li>
                        <li role="presentation">
                            <asp:Button ID="btnEliminarEmpleado" class="btn btn-danger btn-lg" runat="server" Text="Eliminar Empleado" OnClick="btnEliminarEmpleado_Click" />
                            <%--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalEstadoSocio">Cambiar de Estado Socio</button>--%>
                        </li>
                    </ul>
                </div>
                <div class="table-responsive">
                    <h3 class="page-header">Registro de Empleados</h3>
                    <dx:ASPxGridView ID="grdEmpleados" runat="server" KeyFieldName="" AutoGenerateColumns="False" Theme="Office2010Silver" Width="100%">
                        <Columns>
                            <%--<dx:GridViewCommandColumn ShowEditButton="true" VisibleIndex="0" />--%>
                            <dx:GridViewDataTextColumn Caption="Acciones" VisibleIndex="0" Width="15%">
                                <DataItemTemplate>
                                    <asp:LinkButton ID="linkEditar" Text="Editar" runat="server" Visible="true" ForeColor="#666666"
                                        Font-Size="Small" Font-Underline="True"></asp:LinkButton>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataColumn Caption="Id" FieldName="" VisibleIndex="0" Visible="false" />
                            <dx:GridViewDataColumn Caption="Nombre Emplado" FieldName="" VisibleIndex="0" Width="30%" />
                            <dx:GridViewDataColumn Caption="Telefono" FieldName="" VisibleIndex="0" Width="10%" />
                            <dx:GridViewDataColumn Caption="Tipo Empleado" FieldName="" VisibleIndex="0" Width="10%" />
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
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Registrar Empleado -->
    <dx:ASPxPopupControl ID="popUpEditarEmpleado" runat="server" Modal="true" HeaderText="Registro de Empleados" AllowDragging="true"
        PopupHorizontalAlign="Center" PopupVerticalAlign="WindowCenter"  ShowCloseButton="true" Width="700px" Height="500px" ScrollBars="Vertical"
        PopupAction="None" CloseAction="CloseButton" Theme="Office2010Silver">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlEmpleados" runat="server">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label for="NumEmpleado">Nombre(s) Empleado</label>
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
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="TelefonoEmpleado">Telefono</label>
                                        <asp:TextBox ID="txtTelefonoEmpleado" class="form-control" runat="server" Text="" ToolTip="Ingrese Número Teléfonico del Empleado"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="tipoUsuario">Tipo de Usuario</label>
                                        <div class="selectContainer">
                                            <asp:DropDownList class="form-control" ID="ddlTipoUsuario" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label for="NombreUsuario">Nombre de Usuario</label>
                                        <asp:TextBox ID="txtNombreUsuario" class="form-control" runat="server" Text="" ToolTip="Ingrese Nombre Usuario"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="ContraseñaEmpleado">Contraseña de Acceso</label>
                                        <asp:TextBox ID="txtContraseñaAcceso" TextMode="Password" class="form-control" runat="server" Text="" ToolTip="Ingrese Contraseña de Acceso"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="ConfirmarContraseña">Confirmar Contraseña</label>
                                        <asp:TextBox ID="txtConfContraseña" TextMode="Password" class="form-control" runat="server" Text="" ToolTip="Confirma Contraseña"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button class="btn btn-default" data-dismiss="modal" ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                        <asp:Button class="btn btn-success" ID="btnGuardar" runat="server" Text="Guardar Empleado" OnClick="btnGuardar_Click" />
                        <asp:Button class="btn btn-info" ID="btnActualizar" runat="server" Text="Actualizar Cambios" OnClick="btnActualizar_Click" />
                    </div>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <!-- Modal Elimina  Socio -->
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
                                        <label for="numeroSocio">Nombre Usuario</label>
                                        <asp:TextBox ID="txtNomUsuarioEliminar" class="form-control" runat="server" Text="" ToolTip="Ingrese Número  del Socio"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="nombreSocio">Nombre(s) Usuario</label>
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
                            <asp:Button class="btn btn-warning" ID="btnEliminarSocio" runat="server" Text="Guardar Cambios" />
                        </div>
                    </div>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../Scripts/ie10-viewport-bug-workaround.js"></script>
</asp:Content>
