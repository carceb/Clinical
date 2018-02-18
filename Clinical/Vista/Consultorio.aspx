<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consultorio.aspx.cs" Inherits="Clinical.Consultorio" %>

<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>
<%@ Register TagPrefix="uc2" TagName="UCNavegacion" Src="~/Vista/UCNavegacion.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<!DOCTYPE HTML>

<html>
    <head>
        <title>| clinical | Registro Consultorios|</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<%--        SCRIPTS--%>
      
        <link rel="stylesheet"  href="../Styles/jquery-ui-1.8rc3.custom.css"  />
        <script src="../assets/js/jquery.min.js" type ="text/javascript"></script>
        <link rel="stylesheet" href="../assets/css/main.css" />
        <link rel="stylesheet" href="../Styles/simpleAutoComplete.css"  />
        <script src="../js/Util.js" type="text/javascript"></script>
<%--        <script src="../js/jquery.js"></script>--%>
        <script  src="../js/jquery-ui-1.8rc3.custom.min.js" type ="text/javascript"></script>
        <script src="../assets/js/jquery.min.js" type ="text/javascript"></script>
        <script src="../assets/js/skel.min.js" type ="text/javascript"></script>
        <script src="../assets/js/util.js" type ="text/javascript"></script>
        <script src="../assets/js/main.js" type ="text/javascript"></script>      
<%--------------------------%>

    <script type ="text/javascript"> 

        function Confirmacion() {
            return confirm("¿Realmente desea eliminar este registro?, no podrá deshacer");
        }

        $(function () {
            $('#txtNombreConsultorio').simpleAutoComplete('Autocomplete.aspx', {
                autoCompleteClassName: 'autocomplete',
                selectedClassName: 'sel',
                attrCallBack: 'rel',
                identifier: 'Consultorios'
            }, fnPersonalCallBack);

        });

        function fnPersonalCallBack(par) {
            document.getElementById("hdnConsultorioID").value = par[0];
            document.getElementById("hdnCodigoCiudad").value = par[8];
            document.getElementById("txtNombreConsultorio").value = par[1];
            document.getElementById("txtRif").value = par[3];
            document.getElementById("txtDireccion").value = par[4];
            document.getElementById("txtTelefonos").value = par[5];
            document.getElementById("txtEmail").value = par[6];
            document.getElementById("ddlEstado").value = par[7];
            document.getElementById("ddlEmpresa").value = par[9];
            var bt = document.getElementById("btnTest");
            bt.click();
 
        }
    </script>
</head>
  

    <body>
        <MsgBox:UCMessageBox ID="messageBox" runat="server" ></MsgBox:UCMessageBox>
        <!-- Wrapper -->
            <div id="wrapper">

                <!-- Main -->
                    <div id="main">
                        <div class="inner">
                            <!-- Header -->
                                <header id="header">
                                    <a class="logo"><strong>Registro Consultorio</strong></a>
                                    <ul class="icons">

                                    </ul>
                                </header>
                            <!-- Content -->
                            <form runat ="server" id ="principal">
                                <section>
                                    <p></p>
                                        <div class="row uniform">
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtNombreConsultorio"   onkeypress="return event.keyCode!=13;" MaxLength="200" placeholder ="Nombre Consultorio"/>
                                                <ASP:RequiredFieldValidator id="rqrValidaNombreConsultorio" runat="server" errormessage="Debe colocar el nombre del consultorio" width="132px" controltovalidate="txtNombreConsultorio" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                                <asp:HiddenField runat ="server" ID ="hdnConsultorioID"  Value="0"/>    
                                            </div>
                                            <div class="6u 12u$(xsmall)"> 
                                                <asp:TextBox runat="server" ID="txtRif" onkeypress="return event.keyCode!=13;" MaxLength="12" placeholder ="RIF"/>
                                                <ASP:RequiredFieldValidator id="rqrValidaRif" runat="server" errormessage="Debe colocar el nombre del doctor" width="132px" controltovalidate="txtRif" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtDireccion"   onkeypress="return event.keyCode!=13;" TextMode="MultiLine" Rows="2" MaxLength="500" placeholder ="Dirección"/>
                                                <ASP:RequiredFieldValidator id="rqrvalidaDireccion" runat="server" errormessage="Debe colocar el RIF" width="132px" controltovalidate="txtDireccion" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>

                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <div class="select-wrapper">
                                                    <asp:DropDownList ID="ddlEstado" runat="server"   AutoPostBack = "true" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged" >
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                 <div class="select-wrapper">
                                                    <asp:DropDownList ID="ddlCiudad" runat="server"  AppendDataBoundItems="True"  >
                                                    </asp:DropDownList>
                                                    <asp:HiddenField runat ="server" ID ="hdnCodigoCiudad"  Value="0"/>   
                                                </div>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtTelefonos"   onkeypress="return event.keyCode!=13;" MaxLength="300" placeholder ="Telefonos" />
                                                <ASP:RequiredFieldValidator id="rqrvalidaTelefonos" runat="server" errormessage="Debe colocar el numero de telefono" width="132px" controltovalidate="txtTelefonos" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtEmail"   onkeypress="return event.keyCode!=13;" MaxLength="300" placeholder ="EMail" />
                                                <ASP:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" errormessage="Debe colocar el EMail" width="132px" controltovalidate="txtEmail" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <div class="select-wrapper">
                                                    <asp:DropDownList ID="ddlEmpresa" runat="server"   AutoPostBack = "false" AppendDataBoundItems="True"  >
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="12u$">
                                                <ul class="actions">
                                                    <li><asp:Button Text="Actualizar" runat="server" ID ="btnGuardar" CssClass ="special" OnClick="btnGuardar_Click"/></li>
                                                    <li><asp:Button Text="Nuevo registro" runat="server" ID ="btnNuevo" CausesValidation="False" OnClick="btnNuevo_Click"/></li>
                                                    <li><asp:Button Text="TEST" runat="server" ID ="btnTest" style="display:none" CssClass ="boton_formulario" OnClick="btnTest_Click" CausesValidation="False"/></li>
                                                </ul>
                                            </div>
                                        </div>
                                </section>
                           </form>
                        </div>
                    </div>                  
                <!-- Sidebar -->
<%--					<div id="sidebar">
                        <div class="inner">--%>
                            <!-- Menu -->
                                <uc2:UCNavegacion  runat ="server" ID ="ControlMenu"/>
<%--						</div>
                    </div>--%>
            </div>

<%------------------------------------------------------------------------------------------------------------------%>
    </body>
</html>