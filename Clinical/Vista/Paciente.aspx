<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Paciente.aspx.cs" Inherits="Clinical.Paciente" EnableEventValidation ="false" %>
<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>
<%@ Register TagPrefix="uc2" TagName="UCNavegacion" Src="~/Vista/UCNavegacion.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">



<!DOCTYPE HTML>

<html>
    <head>
        <title>| clinical | Cola de Citas|</title>
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


    <script type="text/javascript">


        function Confirmacion() {

            return confirm("¿Realmente desea eliminar este registro?, no podrá deshacer");
        }

    </script>

    <script type="text/javascript">

        $(function () {
            $('#txtCedula').simpleAutoComplete('Autocomplete.aspx', {
                autoCompleteClassName: 'autocomplete',
                selectedClassName: 'sel',
                attrCallBack: 'rel',
                identifier: 'Paciente'
            }, fnPersonalCallBack);

        });

        function fnPersonalCallBack(par) {
            document.getElementById("hdnPacienteID").value = par[0];
            document.getElementById("ddlGenero").value = par[3];
            document.getElementById("txtCedula").value = par[4];
            var fechaSinHora = par[5];
            document.getElementById("txtFechaNacimiento").value = fechaSinHora.replace("12:00:00 a.m.", "");
            document.getElementById("txtNombre").value = par[1];
            document.getElementById("txtTelefono").value = par[7];
            document.getElementById("txtDireccion").value = par[6];
            document.getElementById("ddlAseguradora").value = par[9];
            document.getElementById("ddlTipoSangre").value = par[10];
            document.getElementById("ddlEstado").value = par[12];
            document.getElementById("hdnCodigoCiudad").value = par[13];
            CargarEstados();

            var bt = document.getElementById("btnCiudad");
            bt.click();
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

            $("#txtFechaNacimiento").datepicker({
                dateFormat: 'dd/mm/yy', showOn: 'button', buttonImage: '../images/Calendar_scheduleHS.png', buttonImageOnly: true, changeMonth: true,
                changeYear: true, gotoCurrent: true, yearRange: "1900:2020"
            });
        });
    </script>

    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("/Vista/Paciente.aspx")%>'
        function CargarEstados() {
            $("#<%=ddlCiudad.ClientID%>").attr("disabled", "disabled");
        if ($('#<%=ddlEstado.ClientID%>').val() == "0") {
            $('#<%=ddlCiudad.ClientID %>').empty().append('<option selected="selected" value="0">Ciudad</option>');
        }
        else {
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


    </script>
    <script type = "text/javascript">
    function PopulateControl(list, control) {
        if (list.length > 0) {
            control.removeAttr("disabled");
            control.empty().append('<option selected="selected" value="0">Favor selecccione</option>');
            $.each(list, function() {
                control.append($("<option></option>").val(this['Value']).html(this['Text']));
            });
        }
        else {
            control.empty().append('<option selected="selected" value="0">Not available<option>');
        }
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
                                    <a class="logo"><strong>Recepción de Equipos</strong></a>
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
                                                <asp:TextBox runat="server" ID="txtCedula"   onkeypress="return event.keyCode!=13;" MaxLength="12"  placeholder ="Cedula"/>
                                                <ASP:RequiredFieldValidator id="rqrValidaCedula" runat="server" errormessage="Debe colocar la cedula" width="132px" controltovalidate="txtCedula" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                                <asp:HiddenField runat ="server" ID ="hdnPacienteID"  Value="0"/>    
                                            </div>
                                            <div class="6u 12u$(xsmall)"> 
                                                <asp:TextBox runat="server" ID="txtFechaNacimiento"  MaxLength="200"  placeholder ="Fecha de Nacimiento"/>
                                                <ASP:RequiredFieldValidator id="rqrValidaNacimiento" runat="server" errormessage="Debe colocar la fecha de nacimiento" width="132px" controltovalidate="txtFechaNacimiento" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtNombre"   onkeypress="return event.keyCode!=13;" MaxLength="150"   placeholder ="Nombre del Paciente"/>
                                                <ASP:RequiredFieldValidator id="rqrvalidaNombre" runat="server" errormessage="Debe colocar el nombre" width="132px" controltovalidate="txtNombre" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtTelefono"   onkeypress="return event.keyCode!=13;" MaxLength="150"  placeholder ="Telefono del Paciente"/>
                                                <ASP:RequiredFieldValidator id="rqrValidaTelefono" runat="server" errormessage="Debe colocar el número de teléfono" width="132px" controltovalidate="txtTelefono" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>

                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <div class="select-wrapper">
                                                    <asp:DropDownList ID="ddlEstado" CssClass="ol" runat="server" AppendDataBoundItems="true"
                                                        onchange="CargarEstados();">
                                                        <asp:ListItem Text="Seleccione el estado" Value="0"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                 <div class="select-wrapper">
                                                    <asp:DropDownList ID="ddlCiudad" runat="server" AppendDataBoundItems="true" onchange="CargarCiudaddes();">
                                                        <asp:ListItem Text="Seleccione la ciudad" Value="0"></asp:ListItem>
                                                    </asp:DropDownList>
                                                  <asp:HiddenField runat ="server" ID ="hdnCodigoCiudad"  Value="0"/>  
                                                </div>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtDireccion"  TextMode="MultiLine" Rows="2"  onkeypress="return event.keyCode!=13;" placeholder ="Dirección del Paciente"/>
                                                <ASP:RequiredFieldValidator id="rqrValidaDireccion" runat="server" errormessage="Debe colocar la dirección" width="132px" controltovalidate="txtDireccion" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <div class="select-wrapper">
                                                    <asp:DropDownList ID="ddlAseguradora" runat="server"  AppendDataBoundItems="True" >
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <div class="select-wrapper">
                                                    <asp:DropDownList ID="ddlTipoSangre" runat="server"   AppendDataBoundItems="True" >
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="12u$">
                                                <ul class="actions">
                                                    <li><asp:Button Text="Actualizar" runat="server" ID ="btnGuardar"  CssClass ="special" OnClick="btnGuardar_Click"/></li>
                                                    <li><asp:Button Text="Nuevo registro" runat="server" ID ="btnNuevo"  OnClick="btnNuevo_Click"/></li>
                                                    <li><asp:Button Text="Ciudad" runat="server" ID ="btnCiudad" Style="display: none" OnClick="btnCiudad_Click"/></li>
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


