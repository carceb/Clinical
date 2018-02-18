<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Medicos.aspx.cs" Inherits="Clinical.Medicos" %>
<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>
<%@ Register TagPrefix="uc2" TagName="UCNavegacion" Src="~/Vista/UCNavegacion.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<!DOCTYPE HTML>

<html>
    <head>
        <title>| clinical | Medicos|</title>
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
            document.getElementById("ddlGenero").value = par[3];
            document.getElementById("txtRIF").value = par[4];
            document.getElementById("txtMSAS").value = par[5];
            document.getElementById("txtColegio").value = par[6];;
            document.getElementById("ddlEspecialidad").value = par[7];
            document.getElementById("txtDescripcion").value = par[8];
            document.getElementById("txtTelefonos").value = par[9];
            document.getElementById("txtEmail").value = par[10];
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
                                    <a class="logo"><strong>Medicos</strong></a>
                                    <ul class="icons">

                                    </ul>
                                </header>
                            <!-- Content -->
                            <form runat ="server" id ="principal">
                                <section>
                                    <p></p>
                                        <div class="row uniform">
                                            <div class="6u 12u$(xsmall)">
                                                <div class="select-wrapper">
                                                    <asp:DropDownList ID="ddlGenero" runat="server">
                                                        <asp:ListItem Selected="True">F</asp:ListItem>
                                                        <asp:ListItem>M</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtCedula"   onkeypress="return event.keyCode!=13;" MaxLength="12" placeholder ="Cedula"/>
                                                <ASP:RequiredFieldValidator id="rqrValidaCedula" runat="server" errormessage="Debe colocar la cedula del visitante" width="132px" controltovalidate="txtCedula" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                                 <asp:HiddenField runat ="server" ID ="hdnMedicoID"  Value="0"/>     
                                            </div>
                                            <div class="6u 12u$(xsmall)"> 
                                                 <asp:TextBox runat="server" ID="txtNombre" onkeypress="return event.keyCode!=13;" MaxLength="200" placeholder ="Nombre doctor"/>
                                                <ASP:RequiredFieldValidator id="rqrValidaNombre" runat="server" errormessage="Debe colocar el nombre del doctor" width="132px" controltovalidate="txtNombre" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtRIF"   onkeypress="return event.keyCode!=13;" MaxLength="12" placeholder ="RIF"/>
                                                <ASP:RequiredFieldValidator id="rqrvalidaRIF" runat="server" errormessage="Debe colocar el RIF" width="132px" controltovalidate="txtRIF" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtMSAS"   onkeypress="return event.keyCode!=13;" MaxLength="20" placeholder ="MSAS"/>
                                                 <ASP:RequiredFieldValidator id="rqrvalidaMSAS" runat="server" errormessage="Debe colocar el MSAS" width="132px" controltovalidate="txtMSAS" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtColegio"   onkeypress="return event.keyCode!=13;" MaxLength="20" placeholder ="Colegio medicos"/>
                                                <ASP:RequiredFieldValidator id="rqrvalidaColegio" runat="server" errormessage="Debe colocar el MSAS" width="132px" controltovalidate="txtColegio" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <div class="select-wrapper">
                                                    <asp:DropDownList ID="ddlEspecialidad" runat="server" AppendDataBoundItems="True" >
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtDescripcion"   onkeypress="return event.keyCode!=13;" TextMode="MultiLine" Rows="2" MaxLength="300" placeholder="Descripción especialidad medica" />
                                                <ASP:RequiredFieldValidator id="rqrvalidaDescripcion" runat="server" errormessage="Debe colocar la descripción de la espcialidad" width="132px" controltovalidate="txtDescripcion" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtTelefonos"   onkeypress="return event.keyCode!=13;" MaxLength="300" placeholder="Telefonos" />
                                                <ASP:RequiredFieldValidator id="rqrvalidaTelefonos" runat="server" errormessage="Debe colocar el numero de telefono" width="132px" controltovalidate="txtDescripcion" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                               <asp:TextBox runat="server" ID="txtEmail"   onkeypress="return event.keyCode!=13;" MaxLength="300" placeholder ="EMail" />
                                                <ASP:RequiredFieldValidator id="rqrvalidaEmail" runat="server" errormessage="Debe colocar el EMail" width="132px" controltovalidate="txtEmail" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                            </div>
                                            <div class="12u$">
                                                <ul class="actions">
                                                    <li><asp:Button Text="Actualizar" runat="server" ID ="btnGuardar"  CssClass ="special" OnClick="btnGuardar_Click"/></li>
                                                    <li><asp:Button Text="Nuevo registro" runat="server" ID ="btnNuevo" CssClass ="boton_formulario" OnClick="btnNuevo_Click"/></li>
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
