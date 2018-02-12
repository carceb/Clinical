<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicoCalendario.aspx.cs" Inherits="Clinical.MedicoCalendario" %>

<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>
<%@ Register TagPrefix="uc1" TagName="UCNavigation" Src="~/Vista/UCNavigation.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>| clinical | Consultorios|</title>
	
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
            return confirm("�Realmente desea eliminar este registro?, no podr� deshacer");
        }

        $(function () {
            $('#txtNombreConsultorio').simpleAutoComplete('Autocomplete.aspx', {
                autoCompleteClassName: 'autocomplete',
                selectedClassName: 'sel',
                attrCallBack: 'rel',
                identifier: 'ConsultoriosMedicos'
            }, fnPersonalCallBack1);

        });

        function fnPersonalCallBack1(par) {
            document.getElementById("hdnConsultorioID").value = par[0];
            document.getElementById("hdnMedicoConsultorioID").value = par[3];
            document.getElementById("txtNombreConsultorio").value = par[1];
            var bt = document.getElementById("btnTest");
            bt.click();
        }
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
	  <td colspan="2" valign="top" class="auto-style2"  >&nbsp; <h2> Registro Consultorio Horario</h2></td>
        
    </tr>

    <tr>
      <td width="10" height="350" valign="top">&nbsp;</td>
      <td width="770" valign="top" colspan="3">
      <!-- Contenido Aqui -->
          <table>

                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Nombre Consultorio" ID="Label5" runat="server"  />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtNombreConsultorio" onkeypress="return event.keyCode!=13;" MaxLength="300" Width="520"/>
                        <asp:HiddenField runat ="server" ID ="hdnConsultorioID"  Value="0"/>
                        <asp:HiddenField runat ="server" ID ="hdnMedicoConsultorioID"  Value="0"/>    
                        <ASP:RequiredFieldValidator id="rqrValidaConsultorio" runat="server" errormessage="Debe colocar el nombre del consultorio" width="132px" controltovalidate="txtNombreConsultorio" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                      </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="D�a" ID="Label3" runat="server"  />
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlDia" runat="server"  Width="120" AppendDataBoundItems="True"  >
                        </asp:DropDownList>
                      </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Hora" ID="Label4" runat="server"  />
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlHora" runat="server"  Width="120" AppendDataBoundItems="True"  >
                        </asp:DropDownList>
                      </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Minutos" ID="Label6" runat="server"  />
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlMinutos" runat="server"  Width="120" AppendDataBoundItems="True"  >
                        </asp:DropDownList>
                      </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Tipo" ID="Label7" runat="server"  />
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlTipoHora" runat="server"  Width="120" AppendDataBoundItems="True"  >
                        </asp:DropDownList>
                      </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        Inicial</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlInicial" runat="server"  Width="120" >
                            <asp:ListItem>SI</asp:ListItem>
                            <asp:ListItem>NO</asp:ListItem>
                        </asp:DropDownList>
                      </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style2">
                      <asp:Button Text="Actualizar" runat="server" ID ="btnGuardar"  CssClass ="boton_formulario" OnClick="btnGuardar_Click" />
                      <asp:Button Text="Nuevo registro" runat="server" ID ="btnNuevo" CssClass ="boton_formulario" CausesValidation="False" OnClick="btnNuevo_Click" />
                        <asp:Button Text="TEST" runat="server" ID ="btnTest" CssClass ="boton_formulario"  style="display:none" CausesValidation="False" OnClick="btnTest_Click" />
                    </td>
                </tr>
          </table>
          <asp:GridView ID="gridDetalle" runat="server" CssClass="subtitulo" EmptyDataText="No existen Registros" 
              GridLines="Horizontal" AutoGenerateColumns="False" OnRowCommand="gridDetalle_RowCommand" >
                <HeaderStyle CssClass ="registroTitulo" Font-Size="10px" />
                <AlternatingRowStyle CssClass ="registroNormal" Font-Size="10px" />
                  <RowStyle CssClass ="registroAlternado" Font-Size="10px" />
              <Columns>
                  <asp:TemplateField HeaderText="Consultorio" HeaderStyle-Width="200">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblConsultorio" Text='<%# Eval("NombreConsultorio") %>' Font-Bold ="true" ></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Estado" HeaderStyle-Width="80">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblEstado" Text='<%# Eval("NombreEstado") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                   <asp:TemplateField HeaderText="Ciudad" HeaderStyle-Width="100">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblCiudad" Text='<%# Eval("NombreCiudad") %>' Font-Bold ="true" ></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Doctor" HeaderStyle-Width="120">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblDoctor" Text='<%# Eval("NombreMedico") %>' Font-Bold ="true" ></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="D�a" HeaderStyle-Width="80">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblDia" Text='<%# Eval("DiaSemana") %>' Font-Bold ="true" ></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Hora" HeaderStyle-Width="80">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblHora" Text='<%# Eval("HoraSemana") %>' Font-Bold ="true" ></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Minutos" HeaderStyle-Width="80">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblMinutos" Text='<%# Eval("MinutosSemana") %>' Font-Bold ="true" ></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Tipo" HeaderStyle-Width="80">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblTipo" Text='<%# Eval("NombreTipoHoraSemana") %>' Font-Bold ="true" ></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Inicio" HeaderStyle-Width="80">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblInicio" Text='<%# Eval("IndicaHoraInicial") %>' Font-Bold ="true" ></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>

                   <asp:TemplateField HeaderText="Acciones" HeaderStyle-Width="100px">
                      <ItemTemplate>
                          <asp:ImageButton runat="server" ID="btnEliminar" AlternateText="Eliminar Detalle" CausesValidation="false" OnClientClick="return Confirmacion();" ToolTip="Eliminar Detalle" CssClass="cBotones" ImageUrl="~/Images/eliminar.gif"  CommandName="EliminarDetalle" CommandArgument='<%# Eval("MedicoCalendarioSemanaID") %>'/>
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>
          </asp:GridView>

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

