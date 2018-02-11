<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AtencionDoctorSeleccion.aspx.cs" Inherits="Clinical.AtencionDoctorSeleccion" %>

<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>
<%@ Register TagPrefix="uc2" TagName="UCNavegacion" Src="~/Vista/UCNavegacion.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">



<!DOCTYPE HTML>

<html>
	<head>
		<title>| clinical | Seleccionar Médico|</title>
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
									<a class="logo"><strong>Seleccionar Médico</strong></a>
									<ul class="icons">

									</ul>
								</header>

							<!-- Content -->
							 <form runat ="server" id ="principal">
								<section>
										<p></p>
										<div class="row uniform">
											<div class="12u$">
												<ul class="actions">
													<li>
														 <asp:DropDownList ID="ddlDoctor" runat="server" Width="300" ></asp:DropDownList>
													</li>
													<li>
														<asp:Button Text="Entrar" runat="server" ID ="btnEntrar"  CssClass ="boton_formulario" OnClick="btnEntrar_Click"/>
													</li>
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
		<!-- Scripts -->

<%--        SE COLOCARON EN EL HEADER --%>

	</body>
</html>