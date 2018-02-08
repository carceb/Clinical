<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CitaResultado.aspx.cs" Inherits="Clinical.CitaResultado" %>

<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>


<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>clinical | Agendar Cita M&eacute;dica |</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../assets/css/main.css" />
        <script src="../js/Util.js" type="text/javascript"></script>
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
									<span class="symbol"><img src="../images/logo.png" alt="" /></span><span class="title"></span>
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
                            <li><a href="Cita.aspx">Citas </a></li>
                            <li><a href="../Login.aspx">Entrar al sistema (M&eacute;dicos afiliados)</a></li>
						</ul>
					</nav>

				<!-- Main -->
					<div id="main" >
						<div  class="inner" >
							<h1>Resultado Cita M&eacute;dica</h1>
                            <asp:Label runat="server" ID ="lblTitulo" Font-Size="Large" Width ="381px" Font-Bold="True" ForeColor="#CC0000">Resultado de la cita</asp:Label>

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
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>

            <script src="../js/Util.js" type="text/javascript"></script>
            <script src="../js/jquery.js"></script>
            <script src="../js/jquery-ui-1.8rc3.custom.min.js"></script>

</form>
	</body>
</html>
