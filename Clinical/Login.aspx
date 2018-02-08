<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Seguridad.Login" %>

<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>

<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>clinical | Solicitud de Cita M&eacute;dica |</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />

	    <style type="text/css">
            .auto-style1 {
                width: 3px;
            }
            .auto-style2 {
                width: 58px;
            }
            .auto-style3 {
                width: 45%;
            }
        </style>
    <link rel="stylesheet" href="../Styles/estilos.css" type="text/css"/>
    <link href="../Styles/simpleAutoComplete.css" rel="stylesheet" />
    <link href="../Styles/jquery-ui-1.8rc3.custom.css" rel="stylesheet" />
<script>



</script>
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
									<span class="symbol"><img src="images/logo.png" alt="" /></span><span class="title"></span>
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
							<li><a href="/Index.aspx">Home</a></li>
                            <li><a href="../Vista/Cita.aspx">Citas </a></li>
						</ul>
					</nav>

				<!-- Main -->
					<div id="main" >
						<div  class="inner" >
							<h1>Ingresar al Sistema</h1>
                            <p>Indique sus credenciales de acceso (Nombre de usuario y Clave) y presione &quot;Ingresar al Sistema&quot;</p>
	                            <table class="auto-style3" >
                                    <tr>
                                        <td class="auto-style1">
                                            Login
                                        </td>
                                        <td class="auto-style2">
                                            <asp:TextBox runat ="server" ID ="txtLogin" MaxLength="200" Width="189px"></asp:TextBox>
                                            <asp:HiddenField runat ="server" ID ="hdnCodigoUsuario"  Value="0"/>
                                            <ASP:RequiredFieldValidator id="chkUserID" runat="server" errormessage="Debe colocar su nombre de usuario" width="132px" controltovalidate="txtLogin" display="Dynamic" ForeColor="#CC0000"></ASP:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">
                                            Clave</td>
                                        <td class="auto-style2">
                                            <asp:TextBox runat ="server" ID ="txtClave" MaxLength="200" Width="184px" TextMode="Password"></asp:TextBox>
                                            <ASP:RequiredFieldValidator id="chkUserClave" runat="server" errormessage="Debe colocar su clave" width="132px" controltovalidate="txtClave" display="Dynamic" ForeColor="#CC0000"></ASP:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">
                                        <asp:Label ID ="lblConsultorio" runat="server" Visible="False">Consultorio</asp:Label>
                                        </td>
                                        <td class="auto-style2">
                                                <asp:DropDownList ID="ddlConsultorio" CssClass ="ol"  runat="server" AppendDataBoundItems="true"
                                                Height="66px" Width="369px" Visible="false" >       
                                                </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">
                                            &nbsp;</td>
                                        <td class="auto-style2">
                                            
                                            <asp:Button ID="btnLogin" runat="server" Text="Entrar" OnClick="btnLogin_Click" Width="163px" /> 
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">
                                        </td>
                                        <td class="auto-style2">
                                            <asp:Label ID ="lblMensaje" Visible = "False" runat="server" ForeColor="#009933" Width ="293px">Seleccione el consultorio y presione el botón "Entrar"</asp:Label>
                                        </td>
                                    </tr>
                                </table>
                               
						</div>
					</div>


				<!-- Footer -->
					<footer id="footer">
						<div class="inner">

							<ul class="copyright">
								<li>&copy; clinical. Todos los Derechos Reservados</li>
							</ul>
						</div>

					</footer>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

            <script src="js/Util.js" type="text/javascript"></script>
            <script src="js/jquery.js"></script>
            <script src="js/jquery-ui-1.8rc3.custom.min.js"></script>
</form>
	</body>
</html>