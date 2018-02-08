<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CitaCola.aspx.cs" Inherits="Clinical.CitaCola" %>

<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>
<%@ Register TagPrefix="uc1" TagName="UCNavigation" Src="~/Vista/UCNavigation.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>| clinical | Cola de Citas|</title>
	
	<link rel="stylesheet" href="../Styles/estilo.css" type="text/css"/>
    <link rel="stylesheet" href="../Styles/estilos.css" type="text/css"/>
	<script src="../js/Util.js" type="text/javascript"></script>
    <script src="../js/jquery.js"></script>
    <script src="../js/jquery-ui-1.8rc3.custom.min.js"></script>
    <link href="../Styles/simpleAutoComplete.css" rel="stylesheet" />
    <link href="../Styles/jquery-ui-1.8rc3.custom.css" rel="stylesheet" />


  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"><style type="text/css">BODY {
	FONT-SIZE: 8.5pt
}
TD {
	FONT-SIZE: 8.5pt
}
TH {
	FONT-SIZE: 8.5pt
}
BODY {
	BACKGROUND-IMAGE: url(../Images/fondo_3.png); BACKGROUND-COLOR: #ffffff
}
        .auto-style2 {
            height: 21px;
        }
                                                                              .auto-style5 {
                                                                                  width: 770px;
                                                                              }
                                                                              .auto-style6 {
                                                                                  height: 160px;
                                                                                 }
  </style>
    <script type ="text/javascript"> 

        function Confirmacion() {
            return confirm("¿Realmente desea eliminar esta cita?, no podrá deshacer");
        }
    </script>
    <script type ="text/javascript">

        $(function () {

            //Array para dar formato en español
            $.datepicker.regional['es'] =
            {
                closeText: 'Cerrar',
                prevText: 'Previo',
                nextText: 'Próximo',

                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
                'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                monthStatus: 'Ver otro mes', yearStatus: 'Ver otro año',
                dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sáb'],
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
                dateFormat: 'dd/mm/yy', firstDay: 0,
                initStatus: 'Selecciona la fecha', isRTL: false
            };
            $.datepicker.setDefaults($.datepicker.regional['es']);

            $("#txtFechaCita").datepicker({
                dateFormat: 'dd/mm/yy', showOn: 'button', buttonImage: '../images/Calendar_scheduleHS.png', buttonImageOnly: true, changeMonth: true,
                changeYear: true, gotoCurrent: true
            });
        });
    </script>
</head>
  
  <body>
 <MsgBox:UCMessageBox ID="messageBox" runat="server" ></MsgBox:UCMessageBox>
  <form id="form1" runat="server">
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr>
      <td colspan="4" class="auto-style6"><img src="../Images/clinical_top3.jpeg" width="1000" height="260"></td>
    </tr>
    <tr>
      <td width="200" rowspan="2" align="left" valign="top" bgcolor="#d7d7d7">
        <uc1:UCNavigation id="UserControl2" runat="server"></uc1:UCNavigation>
      </td>
	  <td colspan="2" valign="top" class="auto-style2"  >&nbsp; <h2> Citas del día</h2></td>
        
    </tr>

    <tr>
      <td width="10" height="350" valign="top">&nbsp;</td>
      <td width="770" valign="top" colspan="3">
      <!-- Contenido Aqui -->

          <table>
              <tr class="auto-style2" >
                  <td  width="1000" >
                      <asp:Button Text="Actualizar lista" runat="server" ID ="btnGuardaLista"  CssClass ="boton_formulario" CausesValidation="False" OnClick="btnGuardaLista_Click"/>
                  </td>
                  <td>
                      <asp:TextBox ID="txtFechaCita" runat="server"></asp:TextBox>
                      <asp:Button Text="Buscar citas" runat="server" ID ="btnBuscar"  CssClass ="boton_formulario" CausesValidation="False" OnClick="btnBuscar_Click"/>
                  </td>
              </tr>
          </table>
          <asp:GridView ID="gridDetalle" runat="server" CssClass="subtitulo" EmptyDataText="No existen Registros" 
              GridLines="Horizontal" AutoGenerateColumns="False" OnRowCommand="gridDetalle_RowCommand" >
                <HeaderStyle CssClass ="registroTitulo" Font-Size="10px" />
                <AlternatingRowStyle CssClass ="registroNormal" Font-Size="10px" />
                  <RowStyle CssClass ="registroAlternado" Font-Size="10px" />
              <Columns>
                  <asp:TemplateField HeaderText="CodV" HeaderStyle-Width="0" Visible="false">
                      <ItemTemplate>
                          <asp:TextBox runat="server" ID="txtCitaID" Visible ="false"   Width="0" ForeColor ="Red" Text='<%# Eval("CitaID") %>' ></asp:TextBox>
                      </ItemTemplate>
				<HeaderStyle Width="0px"></HeaderStyle>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Médico" HeaderStyle-Width="100    ">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblMedico" Text='<%# Eval("NombreMedico") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusCitaID ").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Especialidad" HeaderStyle-Width="120">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblEspecialidad" Text='<%# Eval("NombreEspecialidadMedica") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusCitaID").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                   <asp:TemplateField HeaderText="Cédula Paciente" HeaderStyle-Width="80">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblCedula" Text='<%# Eval("CedulaPacienteCita") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusCitaID").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Nombre Paciente" HeaderStyle-Width="100">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblNombrePaciente" Text='<%# Eval("NombrePacienteCita") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusCitaID").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Télefono" HeaderStyle-Width="150">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblTelefono" Text='<%# Eval("CelularPacienteCita") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusCitaID").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                   <asp:TemplateField HeaderText="Motivo Cita" HeaderStyle-Width="120">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblMotivo" Text='<%# Eval("NombreCitaMotivo") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                   <asp:TemplateField HeaderText="Descripción padecimiento" HeaderStyle-Width="120">
                      <ItemTemplate>
                          <asp:TextBox runat="server" ID="txtDescripcionPadecimiento" TextMode="MultiLine" Rows ="2" Text='<%# Eval("DescripcionPadecimiento") %>'></asp:TextBox>
                      </ItemTemplate>
                  </asp:TemplateField>
                 <asp:TemplateField HeaderText="Asignar Estatus" HeaderStyle-Width="150">
                      <ItemTemplate>
                          <asp:DropDownList runat="server" ID="ddlEstatus"
                                DataSourceID="SqlDataSource4" 
                                DataTextField ="NombreEstatusCita"
                                DataValueField ="EstatusCitaID"
                                SelectedValue ='<%# Bind("EstatusCitaID") %>'
                                Width="150">
                          </asp:DropDownList>
                        <asp:SqlDataSource 
                            ID="SqlDataSource4" 
                            runat="server" ConnectionString="<%$ ConnectionStrings:CallCenterConnectionString %>" 
                            SelectCommand="SELECT *  FROM [EstatusCita] ">
                        </asp:SqlDataSource>
                      </ItemTemplate>
                  </asp:TemplateField>

                   <asp:TemplateField HeaderText="Acciones" HeaderStyle-Width="100px">
                      <ItemTemplate>
                          <asp:ImageButton runat="server" ID="btnEliminar" AlternateText="Eliminar Detalle" CausesValidation="false" OnClientClick="return Confirmacion();" ToolTip="Eliminar Detalle" CssClass="cBotones" ImageUrl="~/Images/eliminar.gif"  CommandName="EliminarDetalle" CommandArgument='<%# Eval("CitaID") %>'/>
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>
          </asp:GridView>
      </td>

    </tr>
    <tr>
      <td width="200" height="30" bgcolor="#d2d2c6">&nbsp;</td>
      <td width="10" bgcolor="#d2d2c6">&nbsp;</td>
      <td bgcolor="#d2d2c6" align="center" style="font-size: small" class="auto-style5" >clinical Usuario: <%:Session["NombreCompletoUsuario"]%> Consultorio: <%:Session["NombreEmpresa"]%>
      <td width="20" bgcolor="#d2d2c6">&nbsp;</td>
    </tr>
  </table>
   
  
    </form>
</body>
</html>

