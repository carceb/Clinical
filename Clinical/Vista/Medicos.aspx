<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Medicos.aspx.cs" Inherits="Clinical.Medicos" %>


<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>
<%@ Register TagPrefix="uc1" TagName="UCNavigation" Src="~/Vista/UCNavigation.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>| clinical | Médicos|</title>
	
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
            $('#txtCedula').simpleAutoComplete('Autocomplete.aspx', {
                autoCompleteClassName: 'autocomplete',
                selectedClassName: 'sel',
                attrCallBack: 'rel',
                identifier: 'Medicos'
            }, fnPersonalCallBack);

        });

        function fnPersonalCallBack(par) {
            document.getElementById("hdnMedicoID").value = par[0];
            document.getElementById("txtCedula").value = par[11];
            document.getElementById("txtNombre").value = par[1];
            document.getElementById("ddlGenero").value = par[3];;
            document.getElementById("txtRIF").value = par[4];;
            document.getElementById("txtMSAS").value = par[5];;
            document.getElementById("txtColegio").value = par[6];;
            document.getElementById("ddlEspecialidad").value = par[7];;
            document.getElementById("txtDescripcion").value = par[8];;
            document.getElementById("txtTelefonos").value = par[9];;
            document.getElementById("txtEmail").value = par[10];;
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
	  <td colspan="2" valign="top" class="auto-style2"  >&nbsp; <h2> Registro de Doctores</h2></td>
        
    </tr>

    <tr>
      <td width="10" height="350" valign="top">&nbsp;</td>
      <td width="770" valign="top" colspan="3">
      <!-- Contenido Aqui -->
          <table>

                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Genero" ID="Label2" runat="server"  />
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlGenero" runat="server"  Width="120">
                            <asp:ListItem Selected="True">F</asp:ListItem>
                            <asp:ListItem>M</asp:ListItem>
                        </asp:DropDownList>
                      </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Cédula" ID="Label3" runat="server" />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtCedula"   onkeypress="return event.keyCode!=13;" MaxLength="12" Width="150"/>
                        <ASP:RequiredFieldValidator id="rqrValidaCedula" runat="server" errormessage="Debe colocar la cedula del visitante" width="132px" controltovalidate="txtCedula" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                         <asp:HiddenField runat ="server" ID ="hdnMedicoID"  Value="0"/>                 
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Nombre doctor" ID="Label5" runat="server" AssociatedControlID="txtNombre" />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtNombre" onkeypress="return event.keyCode!=13;" MaxLength="200" Width="520px"/>
 
                        <ASP:RequiredFieldValidator id="rqrValidaNombre" runat="server" errormessage="Debe colocar el nombre del doctor" width="132px" controltovalidate="txtNombre" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                      </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="RIF" ID="Label1" runat="server" />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtRIF"   onkeypress="return event.keyCode!=13;" MaxLength="12" Width="120"/>
                        <ASP:RequiredFieldValidator id="rqrvalidaRIF" runat="server" errormessage="Debe colocar el RIF" width="132px" controltovalidate="txtRIF" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="MSAS" ID="Label4" runat="server" />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtMSAS"   onkeypress="return event.keyCode!=13;" MaxLength="20" Width="120"/>
                        <ASP:RequiredFieldValidator id="rqrvalidaMSAS" runat="server" errormessage="Debe colocar el MSAS" width="132px" controltovalidate="txtMSAS" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Colegio" ID="Label6" runat="server" />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtColegio"   onkeypress="return event.keyCode!=13;" MaxLength="20" Width="120"/>
                        <ASP:RequiredFieldValidator id="rqrvalidaColegio" runat="server" errormessage="Debe colocar el MSAS" width="132px" controltovalidate="txtColegio" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Especialidad medica" ID="Label7" runat="server" />
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlEspecialidad" runat="server"  Width="520" AppendDataBoundItems="True" >
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Descrición especialidad" ID="Label8" runat="server" />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtDescripcion"   onkeypress="return event.keyCode!=13;" TextMode="MultiLine" Rows="2" MaxLength="300" Width="520px" />
                        <ASP:RequiredFieldValidator id="rqrvalidaDescripcion" runat="server" errormessage="Debe colocar la descripción de la espcialidad" width="132px" controltovalidate="txtDescripcion" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="Télefonos" ID="Label9" runat="server" />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtTelefonos"   onkeypress="return event.keyCode!=13;" MaxLength="300" Width="520px" />
                        <ASP:RequiredFieldValidator id="rqrvalidaTelefonos" runat="server" errormessage="Debe colocar el numero de telefono" width="132px" controltovalidate="txtDescripcion" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label Text="EMail" ID="Label10" runat="server" />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox runat="server" ID="txtEmail"   onkeypress="return event.keyCode!=13;" MaxLength="300" Width="520px" />
                        <ASP:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" errormessage="Debe colocar el EMail" width="132px" controltovalidate="txtEmail" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style2">
                      <asp:Button Text="Actualizar" runat="server" ID ="btnGuardar"  CssClass ="boton_formulario" OnClick="btnGuardar_Click"/>
                      <asp:Button Text="Nuevo registro" runat="server" ID ="btnNuevo" CssClass ="boton_formulario" OnClick="btnNuevo_Click"/>
                    </td>
                </tr>
          </table>

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

