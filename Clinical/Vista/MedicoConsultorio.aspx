<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicoConsultorio.aspx.cs" Inherits="Clinical.MedicoConsultorio" %>

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
            return confirm("¿Realmente desea eliminar este registro?, no podrá deshacer");
        }
        $(function () {
            $('#txtNombreMedico').simpleAutoComplete('Autocomplete.aspx', {
                autoCompleteClassName: 'autocomplete',
                selectedClassName: 'sel',
                attrCallBack: 'rel',
                identifier: 'MedicosNombre'
            }, fnPersonalCallBack);

        });

        function fnPersonalCallBack(par) {
            document.getElementById("hdnMedicoID").value = par[0];
            document.getElementById("txtNombreMedico").value = par[1];
            var bt = document.getElementById("btnTest");
            bt.click();
        }
        $(function () {
            $('#txtNombreConsultorio').simpleAutoComplete('Autocomplete.aspx', {
                autoCompleteClassName: 'autocomplete',
                selectedClassName: 'sel',
                attrCallBack: 'rel',
                identifier: 'Consultorios'
            }, fnPersonalCallBack1);

        });

        function fnPersonalCallBack1(par) {
            document.getElementById("hdnConsultorioID").value = par[0];
            document.getElementById("txtNombreConsultorio").value = par[1];
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
	  <td colspan="2" valign="top" class="auto-style2"  >&nbsp; <h2> Registro Médico/Consultorios</h2></td>
        
    </tr>

    <tr>
      <td width="10" height="350" valign="top">&nbsp;</td>
      <td width="770" valign="top" colspan="3">
      <!-- Contenido Aqui -->
          <table>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Nombre Médico" ID="Label3" runat="server" />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtNombreMedico"   onkeypress="return event.keyCode!=13;" MaxLength="200" Width="520"/>
                        <ASP:RequiredFieldValidator id="rqrValidaNombreMedico" runat="server" errormessage="Debe colocar el nombre del medico" width="132px" controltovalidate="txtNombreMedico" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                         <asp:HiddenField runat ="server" ID ="hdnMedicoID"  Value="0"/>                 
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Nombre Consultorio" ID="Label5" runat="server"  />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtNombreConsultorio" onkeypress="return event.keyCode!=13;" MaxLength="300" Width="520"/>
                        <asp:HiddenField runat ="server" ID ="hdnConsultorioID"  Value="0"/>    
                        <ASP:RequiredFieldValidator id="rqrValidaConsultorio" runat="server" errormessage="Debe colocar el nombre del consultorio" width="132px" controltovalidate="txtNombreConsultorio" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                      </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Citas Maximas" ID="Label1" runat="server"  />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtCitas" onkeypress="return event.keyCode!=13;" MaxLength="12" Width="120"/>
                        <ASP:RequiredFieldValidator id="rqrValidaCitas" runat="server" errormessage="Debe colocar cantidad de citas" width="132px" controltovalidate="txtCitas" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                      </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Forma de Pago" ID="Label2" runat="server"  />
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlFormaPago" runat="server"  Width="520" AppendDataBoundItems="True"  >
                        </asp:DropDownList>
                      </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style2">
                      <asp:Button Text="Actualizar" runat="server" ID ="btnGuardar"  CssClass ="boton_formulario" OnClick="btnGuardar_Click"/>
                      <asp:Button Text="Nuevo registro" runat="server" ID ="btnNuevo" CssClass ="boton_formulario" CausesValidation="False" OnClick="btnNuevo_Click"/>
                        <asp:Button Text="TEST" runat="server" ID ="btnTest" CssClass ="boton_formulario" style="display:none" CausesValidation="False" OnClick="btnTest_Click"/>
                    </td>
                </tr>
          </table>
          <asp:GridView ID="gridDetalle" runat="server" CssClass="subtitulo" EmptyDataText="No existen Registros" 
              GridLines="Horizontal" AutoGenerateColumns="False" OnRowCommand="gridDetalle_RowCommand" >
                <HeaderStyle CssClass ="registroTitulo" Font-Size="10px" />
                <AlternatingRowStyle CssClass ="registroNormal" Font-Size="10px" />
                  <RowStyle CssClass ="registroAlternado" Font-Size="10px" />
              <Columns>
                  <asp:TemplateField HeaderText="Médico" HeaderStyle-Width="200    ">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblMedico" Text='<%# Eval("NombreMedico") %>' Font-Bold ="true" ></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Especialidad" HeaderStyle-Width="120">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblEspecialidad" Text='<%# Eval("NombreEspecialidadMedica") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                   <asp:TemplateField HeaderText="Consultorio" HeaderStyle-Width="80">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblConsultorio" Text='<%# Eval("NombreConsultorio") %>' Font-Bold ="true" ></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Estado" HeaderStyle-Width="100">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblNombreEstado" Text='<%# Eval("NombreEstado") %>' Font-Bold ="true" ></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Ciudad" HeaderStyle-Width="150">
                      <ItemTemplate>
                          <asp:Label runat="server" ID="lblCiudad" Text='<%# Eval("NombreCiudad") %>' Font-Bold ="true" ></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>

                   <asp:TemplateField HeaderText="Acciones" HeaderStyle-Width="100px">
                      <ItemTemplate>
                          <asp:ImageButton runat="server" ID="btnEliminar" AlternateText="Eliminar Detalle" CausesValidation="false" OnClientClick="return Confirmacion();" ToolTip="Eliminar Detalle" CssClass="cBotones" ImageUrl="~/Images/eliminar.gif"  CommandName="EliminarDetalle" CommandArgument='<%# Eval("MedicoConsultorioID") %>'/>
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

