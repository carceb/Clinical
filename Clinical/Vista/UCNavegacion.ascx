<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCNavegacion.ascx.cs" Inherits="Clinical.Vista.UCNavegacion" %>

<!DOCTYPE HTML>

<html>

	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->


				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->


							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="Principal.aspx">Inicio</a></li>
										<li>
											<span class="opener">Atención médica</span>
											<ul>
												<li><ASP:HyperLink runat="server" ID ="lnkCitas"  navigateurl ="~/Vista/CitaCola.aspx"  Text ="Citas"></ASP:HyperLink></li>
												<li><ASP:HyperLink runat="server" ID ="lnkPacientes"  navigateurl ="~/Vista/Paciente.aspx"  Text ="Pacientes"></ASP:HyperLink></li>
												<li><ASP:HyperLink runat="server" ID ="lnkConsultaDoctor"  navigateurl ="~/Vista/AtencionDoctorSeleccion.aspx"  Text ="Consulta medica"></ASP:HyperLink></li>
											</ul>
										</li>

										<li>
											<span class="opener">Reportes</span>
											<ul>
												<li><ASP:HyperLink runat="server" ID ="lnkPacientesAtendidos"  navigateurl ="~/Vista/VisitantesAtendidos.aspx" Text ="Pacientes Atendidos"></ASP:HyperLink></li>
											</ul>
										</li>
										<li>
											<span class="opener">Opciones especiales</span>
											<ul>

											</ul>
										</li>
										<li>
											<span class="opener">Seguridad</span>
											<ul>
												<li><ASP:HyperLink runat="server" ID ="lnkSeguridad"  navigateurl="~/Vista/Seguridad.aspx" Text ="Agregar / Modificar Usuario"></ASP:HyperLink></li>
												<li><ASP:HyperLink runat="server" ID ="lnkCambiarClave"  navigateurl="~/Vista/SeguridadCambiarClave.aspx" Text ="Cambiar Clave"></ASP:HyperLink></li>
											</ul>
										</li>
										<li><a href="Logout.aspx">Salir</a></li>
									</ul>
								</nav>

							<!-- Section -->


							<!-- Section -->
							<!-- Footer -->
								<footer id="footer">
									<p><%:Session["NombreCompletoUsuario"]%> <%:Session["NombreEmpresa"]%></p>
									<p class="copyright">&copy; Cellper. Todos los derechos reservados.</p>
								</footer>

						</div>
					</div>

			</div>

		<!-- Scripts -->
 

	</body>
</html>