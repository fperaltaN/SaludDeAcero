<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/SiteMaster.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="SaludDeAcero.MasterPage._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 641px;
            height: 90px;
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <table style="width: 100%;">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server" />
                <asp:Timer ID="Timer1" Interval="2000" runat="server" />

                <asp:UpdatePanel ID="up1" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:AdRotator ID="ARImagenes" runat="server" Width="600px" Height="400px" Style="z-index: 101; left: 216px; position: absolute; top: 80px" AdvertisementFile="Anuncios.xml"></asp:AdRotator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>

    </table>

</asp:Content>

