<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cita.aspx.cs" Inherits="Clinical.Cita" EnableEventValidation="false" %>


<!DOCTYPE HTML>
<!--
    Phantom by HTML5 UP
    html5up.net | @ajlkn
    Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
    <title>clinical | Solicitud de Cita M&eacute;dica en venezuela VZLA|</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../citasassets/css/main.css" />

    <style type="text/css">
        .auto-style3 {
            width: 116px;
            height: 92px;
        }

        .auto-style5 {
            height: 92px;
            width: 239px;
        }

        .auto-style7 {
            width: 45%;
        }
    </style>


    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("/Vista/Cita.aspx")%>'
        function CargarEstados() {
            $("#<%=ddlCiudad.ClientID%>").attr("disabled", "disabled");
        if ($('#<%=ddlEstado.ClientID%>').val() == "0") {
            $('#<%=ddlCiudad.ClientID %>').empty().append('<option selected="selected" value="0">Ciudad</option>');
            var bt = document.getElementById("btnBuscarPorEstado");
            bt.click();
        }
        else {
            var bt = document.getElementById("btnBuscarPorEstado");
            bt.click();
            $('#<%=ddlCiudad.ClientID %>').empty().append('<option selected="selected" value="0">Buscando...</option>');
            $.ajax({
                type: "POST",
                url: pageUrl + '/CargarCiudades',
                data: '{estadoID: ' + $('#<%=ddlEstado.ClientID%>').val() + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: EnCiudadesCargadas,
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
    }

    function EnCiudadesCargadas(response) {
        PopulateControl(response.d, $("#<%=ddlCiudad.ClientID %>"));
    }

    function BuscarPorCiudad() {
        var bt = document.getElementById("btnBuscarPorCiudad");
        bt.click();
    }
    </script>


    <script type="text/javascript">
        function PopulateControl(list, control) {
            if (list.length > 0) {
                control.removeAttr("disabled");
                control.empty().append('<option selected="selected" value="0">Seleccione por favor</option>');
                $.each(list, function () {
                    control.append($("<option></option>").val(this['Value']).html(this['Text']));
                });
            }
            else {
                control.empty().append('<option selected="selected" value="0">No disponible<option>');
            }
        }
    </script>

    <%--JQUERY PARRA EXPANDIR Y CONTRAER EL GRID ANIDADO--%>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $("[src*=plus]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "../images/minus.png");
        });
        $("[src*=minus]").live("click", function () {
            $(this).attr("src", "../images/plus.png");
            $(this).closest("tr").next().remove();
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <!-- Wrapper -->
        <div id="wrapper">

            <!-- Header -->
            <header id="header">
                <div class="inner">

                    <!-- Logo -->
                    <a href="Index.aspx" class="logo">
                        <span class="symbol">
                            <img src="../images/logo.png" alt="" /></span><span class="title"></span>
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
                    <li><a href="Login.aspx">Entrar al sistema (M&eacute;dicos afiliados)</a></li>
                </ul>
            </nav>

            <!-- Main -->
            <div id="main">
                <div class="inner">
                    <h1>Solicitud de Cita M&eacute;dica</h1>
                    <p>Seleccione el estado y/o la ciudad de su residencia para ubicar los m&eacute;dicos mas cerca de usted.</p>
                    <asp:Label ID="lblCitaAgendada" runat="server" Font-Size="XX-Large" ForeColor="Red" />
                    <asp:Button ID="btnBuscarPorEstado" runat="server" Text="Buscar por estado" Style="display: none" OnClick="btnBuscarPorEstado_Click" />
                    <asp:Button ID="btnBuscarPorCiudad" runat="server" Text="Buscar por ciudad" Style="display: none" OnClick="btnBuscarPorCiudad_Click" />
                    <table class="auto-style7">
                        <tr>
                            <td class="auto-style3">Estado
                            </td>
                            <td class="auto-style5">
                                <asp:DropDownList ID="ddlEstado" CssClass="ol" runat="server" AppendDataBoundItems="true"
                                    onchange="CargarEstados();" Height="66px" Width="369px">
                                    <asp:ListItem Text="Seleccione el estado" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <%--INVISIBLE POR AHORA EL COMBO DE CIUDADES--%>
                    <asp:DropDownList ID="ddlCiudad" runat="server" AppendDataBoundItems="true" Style="display: none" onchange="BuscarPorCiudad();" Height="53px" Width="364px">
                        <asp:ListItem Text="Seleccione la ciudad" Value="0"></asp:ListItem>
                    </asp:DropDownList>


                    <%--GRID ANIDADO PADRE--%>
                    <asp:Label runat="server" ID="lblExplica" Visible="false" Text="---------> Haga clic en el + para expandir" ForeColor="Red"></asp:Label><asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" CssClass="Grid"
                        DataKeyNames="MedicoID" OnRowDataBound="OnRowDataBound" OnRowCreated="gvCustomers_RowCreated" Width="686px">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <img alt="" style="cursor: pointer" src="../images/plus.png" />
                                    <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                                        <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" CssClass="ChildGrid">
                                            <%--GRID ANIDADO HIJO--%>
                                            <Columns>
                                                <asp:TemplateField HeaderText="Cita" HeaderStyle-Width="20">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="btnCita" Text="Agendar Cita" ForeColor="Blue" AlternateText="Agendar cita" ToolTip="Agendar cita" CssClass="cBotones" CommandName="AgendarCita" CommandArgument='<%# Eval("MedicoCalendarioSemanaID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField ItemStyle-Width="100" DataField="Detalle" HeaderText="Horario" />
                                                <asp:BoundField ItemStyle-Width="300" HeaderText="" />
                                                <%--                                                         <asp:BoundField ItemStyle-Width="150" DataField="NombreCiudad" HeaderText="Ciudad" />
                                                            <asp:BoundField ItemStyle-Width="50" DataField="DiaSemana" HeaderText="Dia" />
                                                            <asp:BoundField ItemStyle-Width="50" DataField="HoraSemana" HeaderText="Hora" />
                                                            <asp:BoundField ItemStyle-Width="50" DataField="MinutosSemana" HeaderText="Min" />
                                                            <asp:BoundField ItemStyle-Width="50" DataField="NombreTipoHoraSemana" HeaderText="" />
                                                            <asp:BoundField ItemStyle-Width="200" DataField="DireccionConsultorio" HeaderText="Dirección" />
                                                            <asp:BoundField ItemStyle-Width="100" DataField="TelefonoConsultorio" HeaderText="Teléfono" />--%>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField ItemStyle-Width="50" ItemStyle-Wrap="true" DataField="NombreMedico" HeaderText="Doctor" />
                            <asp:BoundField ItemStyle-Width="50" ItemStyle-Wrap="true" DataField="NombreEspecialidadMedica" HeaderText="Especialidad" />
                            <asp:BoundField ItemStyle-Width="80" ItemStyle-Wrap="true" DataField="DescripcionEspecialidad" HeaderText="Descripción" />
                            <asp:BoundField ItemStyle-Width="400" HeaderText="" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>


            <!-- Footer -->
            <footer id="footer">
                <div class="inner">

                    <ul class="copyright">
                        <li>&copy; clinical. Todos los Derechos Reservados</li>
                        <li></li>
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
