<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CitaCola.aspx.cs" Inherits="Clinical.CitaCola" %>
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

			$("#txtFechaCita").datepicker({
				dateFormat: 'dd/mm/yy', showOn: 'button', buttonImage: '../images/Calendar_scheduleHS.png', buttonImageOnly: true, changeMonth: true,
				changeYear: true, gotoCurrent: true
			});
		});
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
									<a class="logo"><strong>Cola de citas</strong></a>
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
														 <asp:TextBox ID="txtFechaCita" runat="server"></asp:TextBox>
													</li>
													<li>
														<asp:Button Text="Buscar citas" runat="server" ID ="btnBuscar"  CausesValidation="False" OnClick="btnBuscar_Click"/>
													</li>
													<li>
														<asp:Button Text="Actualizar lista" runat="server" ID ="btnGuardaLista"  CssClass ="special" OnClick="btnGuardaLista_Click" />
													</li>
												</ul>
											</div>
											<div class="table-wrapper">
                                                  <asp:GridView ID="gridDetalle" runat="server" CssClass="subtitulo" EmptyDataText="No existen Registros" 
                                                      GridLines="Horizontal" AutoGenerateColumns="False" OnRowCommand="gridDetalle_RowCommand" >
                                                        <HeaderStyle  Font-Size="10px" />
                                                        <AlternatingRowStyle  Font-Size="10px" />
                                                          <RowStyle CssClass ="registroAlternado" Font-Size="10px" />
                                                      <Columns>
                                                          <asp:TemplateField HeaderText="CodV" HeaderStyle-Width="0" Visible="false">
                                                              <ItemTemplate>
                                                                  <asp:TextBox runat="server" ID="txtCitaID" Visible ="false"   Width="0" ForeColor ="Red" Text='<%# Eval("CitaID") %>' ></asp:TextBox>
                                                              </ItemTemplate>
				                                        <HeaderStyle Width="0px"></HeaderStyle>
                                                          </asp:TemplateField>

                                                         <asp:TemplateField HeaderText="Medico">
                                                              <ItemTemplate>
                                                                  <asp:DropDownList runat="server" ID="ddlMedico"
                                                                        DataSourceID="SqlDataSource5" 
                                                                        DataTextField ="NombreMedico"
                                                                        DataValueField ="MedicoConsultorioID"
                                                                        SelectedValue ='<%# Bind("MedicoConsultorioID") %>'
                                                                        >
                                                                  </asp:DropDownList>
                                                                <asp:SqlDataSource 
                                                                        ID="SqlDataSource5" 
                                                                        runat="server" ConnectionString="<%$ ConnectionStrings:CallCenterConnectionString %>" 
                                                                        SelectCommand= "SELECT  dbo.Medico.MedicoID, dbo.Medico.NombreMedico, dbo.MedicoConsultorio.MedicoConsultorioID, dbo.MedicoConsultorio.ConsultorioID, dbo.Consultorio.NombreConsultorio
                                                                        FROM   dbo.MedicoConsultorio INNER JOIN dbo.Medico ON dbo.MedicoConsultorio.MedicoID = dbo.Medico.MedicoID INNER JOIN dbo.Consultorio ON dbo.MedicoConsultorio.ConsultorioID = dbo.Consultorio.ConsultorioID 
                                                                        WHERE  (dbo.MedicoConsultorio.ConsultorioID = @ConsultorioID) 
                                                                        ORDER BY dbo.Consultorio.NombreConsultorio">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter Name="ConsultorioID" ControlID="hdnConsultorioID" PropertyName="Value" />
                                                                        </SelectParameters>
                                                                </asp:SqlDataSource>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>


                                                          <asp:TemplateField HeaderText="CodigoMedico" HeaderStyle-Width="0" Visible="false">
                                                              <ItemTemplate>
                                                                  <asp:Label runat="server" ID="lblCodigoMedicoConsultorio" Visible="false" Width = "0" Text='<%# Eval("MedicoConsultorioID") %>' ></asp:Label>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>

                                                           <asp:TemplateField HeaderText="Cédula Paciente">
                                                              <ItemTemplate>
                                                                  <asp:Label runat="server" ID="lblCedula" Text='<%# Eval("CedulaPacienteCita") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusCitaID").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                          <asp:TemplateField HeaderText="Nombre Paciente"  >
                                                              <ItemTemplate>
                                                                  <asp:Label runat="server" ID="lblNombrePaciente" Text='<%# Eval("NombrePacienteCita") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusCitaID").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                          <asp:TemplateField HeaderText="Estado">
                                                              <ItemTemplate>
                                                                  <asp:LinkButton runat="server" ID="lnkEstadoHistoria" Text='<%# Eval("PacienteRegistrado") %>'  PostBackUrl ='<%# String.Format("Paciente.aspx?Cedula={0}&Nombre={1}",Eval("CedulaPacienteCita"),Eval("NombrePacienteCita")) %>' Font-Underline="true" ForeColor ="Purple" Font-Bold ="true" Visible = '<%# Eval("PacienteRegistrado").ToString() == "[PACIENTE SIN HISTORIA MEDICA]"?true:false %>'></asp:LinkButton>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                          <asp:TemplateField HeaderText="Télefono">
                                                              <ItemTemplate>
                                                                  <asp:Label runat="server" ID="lblTelefono" Text='<%# Eval("CelularPacienteCita") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusCitaID").ToString() == "1"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                           <asp:TemplateField HeaderText="Motivo Cita">
                                                              <ItemTemplate>
                                                                  <asp:Label runat="server" ID="lblMotivo" Text='<%# Eval("NombreCitaMotivo") %>'></asp:Label>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                           <asp:TemplateField HeaderText="Descripción padecimiento">
                                                              <ItemTemplate>
                                                                  <asp:TextBox runat="server" ID="txtDescripcionPadecimiento"  Text='<%# Eval("DescripcionPadecimiento") %>'></asp:TextBox>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Asignar Estatus">
                                                              <ItemTemplate>
                                                                  <asp:DropDownList runat="server" ID="ddlEstatus"
                                                                        DataSourceID="SqlDataSource4" 
                                                                        DataTextField ="NombreEstatusCita"
                                                                        DataValueField ="EstatusCitaID"
                                                                        SelectedValue ='<%# Bind("EstatusCitaID") %>'
                                                                        >
                                                                  </asp:DropDownList>
                                                                <asp:SqlDataSource 
                                                                    ID="SqlDataSource4" 
                                                                    runat="server" ConnectionString="<%$ ConnectionStrings:CallCenterConnectionString %>" 
                                                                    SelectCommand="SELECT *  FROM [EstatusCita] ">
                                                                </asp:SqlDataSource>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>

                                                           <asp:TemplateField HeaderText="" HeaderStyle-Width="1">
                                                              <ItemTemplate>
                                                                  <asp:ImageButton runat="server" ID="btnEliminar" AlternateText="Eliminar Detalle" CausesValidation="false" OnClientClick="return Confirmacion();" ToolTip="Eliminar Detalle" CssClass="cBotones" ImageUrl="~/Images/eliminar.gif"  CommandName="EliminarDetalle" CommandArgument='<%# Eval("CitaID") %>'/>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                      </Columns>
                                                  </asp:GridView>
                                                <asp:HiddenField ID="hdnConsultorioID" runat="server" /> 
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