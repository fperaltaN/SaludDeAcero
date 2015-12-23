<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ControlPagos.aspx.cs" Inherits="Sisa.ControlPagos" %>

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
                <h1 class="page-header">Administración de Pagos</h1>
                <%--  aki inicia informacion de pago--%>
                <div>
                    <div class="modal-content">
                        <h4 class="modal-title">Consulta</h4>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="maternoSocio">Numero Socio</label>
                                            <asp:TextBox ID="txtNumero" class="form-control" runat="server" Text="" ToolTip="Ingrese Número  del Socio"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ValidatorNumero" runat="server" ErrorMessage="*Campo obligatorio" ControlToValidate="txtNumero"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="NombreSocio">Nombre(s) Socio</label>
                                            <asp:TextBox ID="txtNombre" class="form-control" runat="server" Text="" ToolTip="Ingrese Nombre(s) del Socio"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ValidatorNombre" runat="server" ErrorMessage="*Campo obligatorio" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="paquete">Paquete</label>
                                            <asp:TextBox ID="txtPaquete" class="form-control" runat="server" Text="" ToolTip="Paquete"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ValidatorPaquete" runat="server" ErrorMessage="*Campo obligatorio" ControlToValidate="txtPaquete"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="dias">Dias Restantes</label>
                                            <asp:TextBox ID="TxtDiasRestantes" class="form-control" runat="server" Text="" ToolTip="Dias Restantes"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ValidatorRestantes" runat="server" ErrorMessage="*Campo obligatorio" ControlToValidate="txtDiasRestantes"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <h4 class="modal-title">Plan Pago</h4>
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="FechaVence">Fecha Vencimiento</label>
                                            <dx:ASPxDateEdit ID="Fecha" runat="server"></dx:ASPxDateEdit>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="FechaVence">Visitas Registradas</label>
                                            <asp:TextBox ID="TxtVisitas" class="form-control" runat="server" Text="" ToolTip="Visitas Registradas"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="Adeudos">Adeudos</label>
                                            <asp:TextBox ID="TxtAdeudos" class="form-control" runat="server" Text="" ToolTip="Adeudos"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="Paquete">Paquete</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="DDLPaquete"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="Paquete">Dias a Pagar</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="DDLDiasPagar"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="total">Totar a Pagar</label>
                                            <asp:TextBox ID="TxtTotalPagar" class="form-control" runat="server" Text="" ToolTip="Total de Pago"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="total">Totar a Recibido</label>
                                            <asp:TextBox ID="TxtRecibido" class="form-control" runat="server" Text="" ToolTip="Total Recibido"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <%--  <div class="modal-footer">
                        <asp:Button class="btn btn-success" ID="btnpago" runat="server" Text="Registrar Pago" />
                    </div>--%>
                    <div class="container">
                        <ul class="nav nav-pills">
                            <li role="presentation">
                                <asp:Button ID="btnBuscarSocio" class="btn btn-success btn-lg" runat="server" Text="Buscar Socio" OnClick="btnBuscarSocio_Click" />
                                <%--<button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModalAddSocio">Agregar Socio</button>--%>
                            </li>
                            <li role="presentation">
                                <asp:Button ID="btnVerReportePagos" class="btn btn-info btn-lg" runat="server" Text="Ver Reporte Pagos" OnClick="btnVerReportePagos_Click" />
                                <%--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalAUpdateSocio">Modificar Socio</button>--%>
                            </li>
                            <li role="presentation">
                                <asp:Button ID="btnRegistroPago" class="btn btn-danger btn-lg" runat="server" Text="Registrar Pago" />
                                <%--<button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#myModalDeleteSocio">Eliminar Socio</button>--%>
                            </li>
                        </ul>
                    </div>
                </div>
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
            </div>
        </div>
    </div>
</asp:Content>
