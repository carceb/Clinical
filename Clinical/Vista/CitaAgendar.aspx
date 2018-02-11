<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CitaAgendar.aspx.cs" Inherits="Clinical.CitaAgendar" %>
<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>


<!DOCTYPE HTML>
<!--
    Phantom by HTML5 UP
    html5up.net | @ajlkn
    Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
    <head>
        <title>clinical | Agendar Cita M&eacute;dica |</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="../citasassets/css/main.css" />
        <script src="../js/Util.js" type="text/javascript"></script>
        <style type="text/css">
            .auto-style1 {
                width: 51%;
            }
            .auto-style2 {
                width: 430px;
            }
        </style>
        </head>
    <body>
     <MsgBox:UCMessageBox ID="messageBox" runat="server" ></MsgBox:UCMessageBox>

<form id="form1" runat="server">
        <!-- Wrapper -->
            <div id="wrapper">

                <!-- Header -->
                    <header id="header">
                        <div class="inner">

                            <!-- Logo -->
                                <a href="Index.aspx" class="logo">
                                    <span class="symbol"><img src="../images/logo.png" alt="" /></span><span class="title"></span>
                                </a>

                            <!-- Nav -->
                                <nav>
                                    <ul>
                                        <li><a href="#menu">Menu</a></li>
                                    </ul>
                                </nav>
                        </div>
                    </header>

                <!-- Menu -->
                    <nav id="menu">
                        <h2>Menu</h2>
                        <ul>
                            <li><a href="../Index.aspx">Home</a></li>
                            <li><a href="Cita.aspx">Citas </a></li>
                            <li><a href="../Login.aspx">Entrar al sistema (M&eacute;dicos afiliados)</a></li>
                        </ul>
                    </nav>

                <!-- Main -->
                    <div id="main" >
                        <div  class="inner" >
                            <h1>Agendar Cita M&eacute;dica</h1>
                            <asp:Label runat="server" ID ="lblTitulo" Font-Size="Small" Width ="432px" Font-Bold="True" ForeColor="#CC0000">Usted seleccionó al Dr. Ingrid Yepez en su consultorio en la ciudad de Los Teques en el turno de las 2 pm. Coloque sus datos para agendar la cita</asp:Label>
                                <table class="auto-style1" >
                                    <tr>
                                        <td >
                                            <asp:Label Text="Fecha Cita" ID="Label4" runat="server" AssociatedControlID="txtFechaCita"  />
                                        </td>
                                        <td class="auto-style2">
                                            <asp:TextBox runat ="server" ID ="txtFechaCita" MaxLength="200" Width="219px" Font-Bold="True" ForeColor="Black"  ></asp:TextBox>
                                            <asp:HiddenField runat ="server" ID ="hdnFechaCita"  Value=""/>
                                            <asp:HiddenField runat ="server" ID ="hdnDiaCita"  Value=""/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td >
                                            <asp:Label Text="Cedula" ID="Label5" runat="server" AssociatedControlID="txtCedula"  />
                                        </td>
                                        <td class="auto-style2">
                                            <asp:TextBox runat ="server" ID ="txtCedula" MaxLength="200" Width="198px"></asp:TextBox>
                                            <asp:HiddenField runat ="server" ID ="hdnCodigoMedicoConsultorio"  Value="0"/>
                                            <ASP:RequiredFieldValidator id="rqrValidaCedula" runat="server" errormessage="Debe colocar su cédula de identidad" width="132px" controltovalidate="txtCedula" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label Text="Nombre" ID="Label1" runat="server" AssociatedControlID="txtNombre"  />
                                        <td class="auto-style2">
                                            <asp:TextBox runat ="server" ID ="txtNombre" MaxLength="200" Width="193px" ></asp:TextBox>
                                            <ASP:RequiredFieldValidator id="rqrValidaNombre" runat="server" errormessage="Debe colocar su nombre completo" width="132px" controltovalidate="txtNombre" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label Text="N° Celular" ID="Label2" runat="server" AssociatedControlID="txtCelular"  />
                                        <td class="auto-style2">
                                            <asp:TextBox runat ="server" ID ="txtCelular" MaxLength="200" Width="187px"></asp:TextBox>
                                            <ASP:RequiredFieldValidator id="rqrValidaCelular" runat="server" errormessage="Debe colocar su número celular" width="132px" controltovalidate="txtCelular" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label Text="Motivo cita" ID="lblMotivo" runat="server" AssociatedControlID="ddlMotivo"  />
                                        </td>
                                        <td class="auto-style2">
                                            <ASP:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" errormessage="Debe seleccionar el motivo" width="132px" controltovalidate="ddlMotivo" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                            <asp:DropDownList ID="ddlMotivo" CssClass ="ol"  runat="server" AppendDataBoundItems="true"
                                            Height="66px" Width="369px" Visible="true" >       
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                    <td>
                                            <asp:Label Text="Email" ID="Label3" runat="server" AssociatedControlID="txtEmail"  />
                                        </td>
                                    <td class="auto-style2">
                                            <asp:TextBox runat ="server" ID ="txtEmail" MaxLength="200" Width="185px"></asp:TextBox>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td>&nbsp;</td>
                                    <td class="auto-style2">
                                        <asp:Button ID="btnAgendarCita" runat="server" Text="Agendar cita" OnClick="btnAgendarCita_Click" Width="212px"/> 
                                    </td>
                                    </tr>
                                </table>
                        </div>
                    </div>


                <!-- Footer -->
                    <footer id="footer">
                        <div class="inner">

                            <ul class="copyright">
                                <li>&copy; clinical. Todos los Derechos Reservados</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
                            </ul>
                        </div>

                    </footer>

            </div>

        <!-- Scripts -->
            <script src="../citasassets/js/jquery.min.js"></script>
            <script src="../citasassets/js/skel.min.js"></script>
            <script src="../citasassets/js/util.js"></script>
            <script src="../citasassets/js/main.js"></script>

            <script src="../js/Util.js" type="text/javascript"></script>
            <script src="../js/jquery.js"></script>
            <script src="../js/jquery-ui-1.8rc3.custom.min.js"></script>

</form>
    </body>
</html>
