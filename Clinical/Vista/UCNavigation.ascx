<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCNavigation.ascx.cs" Inherits="Teach.UCNavigation" %>
<style type="text/css">
    .auto-style1 {
        height: 20px;
    }
</style>
<table width="200" border="0" cellspacing="1" cellpadding="0">
    <tr>
      <td height="10" colspan="4"><img src="../Images/1.gif" width="198" height="15" /></td>
    </tr>
    <tr id="divLogin" runat="server">
      <td height="20">&nbsp;</td>
      <td bgcolor="#d2d2c6">&nbsp;</td>
      <td height="20" bgcolor = "#949494"><asp:HyperLink CssClass="izq" ID="lnkCRM" NavigateUrl="Login.aspx" runat="server">Home</asp:HyperLink></td>
      <td height="20">&nbsp;</td>
    </tr>
    
    <tr id="divlnkHome">
      <td height="20">&nbsp;</td>
      <td bgcolor="#d2d2c6">&nbsp;</td>
      <td height="20" bgcolor="#949494"><ASP:HyperLink CssClass="izq" id="lnkHome"
				 navigateurl="Main.aspx" runat="server">Home</ASP:HyperLink></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr id="divlblVentas" >
      <td height="20" style="HEIGHT: 21px">&nbsp;</td>
      <td width="4" bgcolor="#d2d2c6" style="HEIGHT: 21px">&nbsp;</td>
      <td height="20" bgcolor="#949494" class="titleBlanco" style="HEIGHT: 21px">
        <ASP:Label id="lblVentas" runat="server">Atención médica:</ASP:Label></td>
      <td height="20" style="HEIGHT: 21px">&nbsp;</td>
    </tr>
    <tr id="divlnkAtencionCallCenter" >
      <td height="20">&nbsp;</td>
      <td width="4" bgcolor="#949494">&nbsp;</td>
      <td height="20" bgcolor="#949494">&nbsp;&nbsp;&nbsp;&nbsp;<ASP:HyperLink id="lnkAtencionCallCenter" runat="server" cssclass="izq2" navigateurl="CitaCola.aspx">Citas</ASP:HyperLink></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr id="divlnkHistoriaMedica" >
      <td height="20">&nbsp;</td>
      <td width="4" bgcolor="#949494">&nbsp;</td>
      <td height="20" bgcolor="#949494">&nbsp;&nbsp;&nbsp;&nbsp;<ASP:HyperLink id="lnkHistoriaMedica" runat="server" cssclass="izq2" navigateurl="AtencionVisita.aspx">História médica</ASP:HyperLink></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr id="divlnkAtencionDoctor" >
      <td height="20">&nbsp;</td>
      <td width="4" bgcolor="#949494">&nbsp;</td>
      <td height="20" bgcolor="#949494">&nbsp;&nbsp;&nbsp;&nbsp;<ASP:HyperLink id="lnkAtencionDoctor" runat="server" cssclass="izq2" navigateurl="AtencionDoctor.aspx">Atención Doctor</ASP:HyperLink></td>
      <td height="20">&nbsp;</td>
    </tr>


    <tr id="divlblProductos" >
      <td height="20">&nbsp;</td>
      <td width="4" bgcolor="#d2d2c6">&nbsp;</td>
      <td height="20" bgcolor="#949494" class="titleBlanco">
        <ASP:Label id="lblConsultas" runat="server">Consultas:</ASP:Label></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr id="divlnkAddProducto" >
      <td height="20">&nbsp;</td>
      <td width="4" bgcolor="#949494">&nbsp;</td>
      <td height="20" bgcolor="#949494">&nbsp;&nbsp;&nbsp;&nbsp;
        <ASP:HyperLink id="lnkAddProducto" runat="server" cssclass="izq2" navigateurl="VisitantesAtendidos.aspx">Pacientes Atendidos</ASP:HyperLink></td>
      <td height="20">&nbsp;</td>
    </tr>


   <%-- MENU OPCIONES--%>
    <tr id="divlblOpciones" >
      <td height="20">&nbsp;</td>
      <td width="4" bgcolor="#d2d2c6">&nbsp;</td>
      <td height="20" bgcolor="#949494" class="titleBlanco">
        <ASP:Label id="lblOpciones" runat="server">Opciones Especiales:</ASP:Label></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr id="divlnkMedicos" >
      <td height="20">&nbsp;</td>
      <td width="4" bgcolor="#949494">&nbsp;</td>
      <td height="20" bgcolor="#949494">&nbsp;&nbsp;&nbsp;&nbsp;
        <ASP:HyperLink id="lnkMedicos" runat="server" cssclass="izq2" navigateurl="Medicos.aspx">Médicos</ASP:HyperLink></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr id="divlnkConsultorio" >
      <td height="20">&nbsp;</td>
      <td width="4" bgcolor="#949494">&nbsp;</td>
      <td height="20" bgcolor="#949494">&nbsp;&nbsp;&nbsp;&nbsp;
        <ASP:HyperLink id="lnkConsultorio" runat="server" cssclass="izq2" navigateurl="Consultorio.aspx">Consultorios</ASP:HyperLink></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr id="divlnkConsultorioMedico" >
      <td height="20">&nbsp;</td>
      <td width="4" bgcolor="#949494">&nbsp;</td>
      <td height="20" bgcolor="#949494">&nbsp;&nbsp;&nbsp;&nbsp;
        <ASP:HyperLink id="lnkConsultorioMedico" runat="server" cssclass="izq2" navigateurl="MedicoConsultorio.aspx">Médico/Consultorio</ASP:HyperLink></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr id="divlnkCalendario" >
      <td height="20">&nbsp;</td>
      <td width="4" bgcolor="#949494">&nbsp;</td>
      <td height="20" bgcolor="#949494">&nbsp;&nbsp;&nbsp;&nbsp;
        <ASP:HyperLink id="lnkCalendario" runat="server" cssclass="izq2" navigateurl="MedicoCalendario.aspx">Médico Calendario</ASP:HyperLink></td>
      <td height="20">&nbsp;</td>
    </tr>
    
   <%-- ************************************************************************************************************************************--%>


    <tr id="divlnkSeguridad" >
      <td height="20">&nbsp;</td>
      <td width="4" bgcolor="#d2d2c6">&nbsp;</td>
      <td height="20" bgcolor="#949494" classname="izq"><ASP:HyperLink id="lnkSeguridad" class="izq"
       runat="server" navigateurl="Seguridad.aspx" cssclass="izq">Seguridad</ASP:HyperLink></td>
      <td height="20">&nbsp;</td>
    </tr>

    <tr id="divlnkChangePassword" >
      <td height="20">&nbsp;</td>
      <td width="4" bgcolor="#d2d2c6">&nbsp;</td>
      <td height="20" bgcolor="#949494" classname="izq"><ASP:HyperLink id="lnkChangePassword" class="izq"
                       runat="server" navigateurl="SeguridadCambiarClave.aspx" cssclass="izq">Cambiar Clave</ASP:HyperLink></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr id="divlnkLogout" >
      <td width="10" height="20" style="HEIGHT: 20px">&nbsp;</td>
      <td width="4" bgcolor="#d2d2c6" style="HEIGHT: 20px">&nbsp;</td>
      <td height="20" bgcolor="#949494" style="HEIGHT: 20px">
        <p>
          <ASP:HyperLink id="lnkLogout" runat="server" cssclass="izq2" navigateurl="LogOut.aspx">Salir del Sistema</ASP:HyperLink>
        </p></td>
      <td width="10" height="20" style="HEIGHT: 20px">&nbsp;</td>
    </tr>
    <tr style="background:green" runat="server" id="trTipoSitio" visible="false">
      <td width="10">&nbsp;</td>
      <td width="4">&nbsp;</td>
      <td>TESTING...</td>
      <td width="10">&nbsp;</td>
    </tr>
  </table>
  <script language="javascript" type="text/javascript">
      function ocultarEnlaces(b) {
          var cad = 'none';
          if (b) {
              cad = '';
          }

          document.getElementById('divlnkHome').style.display = cad;
          document.getElementById('divlblVentas').style.display = cad;
          document.getElementById('divlnkAtencionCallCenter').style.display = cad;
          document.getElementById('divlnkHistoriaMedica').style.display = cad;
          document.getElementById('divlnkAtencionDoctor').style.display = cad;

          document.getElementById('divlblProductos').style.display = cad;
          document.getElementById('divlnkAddProducto').style.display = cad;

          document.getElementById('divlblOpciones').style.display = cad;
          document.getElementById('divlnkMedicos').style.display = cad;
          document.getElementById('divlnkConsultorio').style.display = cad;
          document.getElementById('divlnkConsultorioMedico').style.display = cad;
          document.getElementById('divlnkCalendario').style.display = cad;

          
          document.getElementById('divlnkSeguridad').style.display = cad;
          document.getElementById('divlnkChangePassword').style.display = cad;
          document.getElementById('divlnkLogout').style.display = cad;

      }
  </script>
<p></p>
