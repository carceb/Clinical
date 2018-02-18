<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicoConsultorio.aspx.cs" Inherits="Clinical.MedicoConsultorio" %>

<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>
<%@ Register TagPrefix="uc2" TagName="UCNavegacion" Src="~/Vista/UCNavegacion.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<!DOCTYPE HTML>

<html>
	<head>
		<title>| clinical | Medico Consultorio|</title>
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
			$('#txtNombreMedico').simpleAutoComplete('Autocomplete.aspx', {
				autoCompleteClassName: 'autocomplete',
				selectedClassName: 'sel',
				attrCallBack: 'rel',
				identifier: 'MedicosNombre'
			}, fnPersonalCallBack);

		});

		function fnPersonalCallBack(par) {
			document.getElementById("hdnMedicoID").value = par[0];
			document.getElementById("txtNombreMedico").value = par[1];
			var bt = document.getElementById("btnTest");
			bt.click();
		}
		$(function () {
			$('#txtNombreConsultorio').simpleAutoComplete('Autocomplete.aspx', {
				autoCompleteClassName: 'autocomplete',
				selectedClassName: 'sel',
				attrCallBack: 'rel',
				identifier: 'Consultorios'
			}, fnPersonalCallBack1);

		});

		function fnPersonalCallBack1(par) {
			document.getElementById("hdnConsultorioID").value = par[0];
			document.getElementById("txtNombreConsultorio").value = par[1];
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
									<a class="logo"><strong>Medico Consultorio</strong></a>
									<ul class="icons">

									</ul>
								</header>
							<!-- Content -->
							<form runat ="server" id ="principal">
								<section>
									<p></p>
										<div class="row uniform">
											<div class="6u 12u$(xsmall)">
												<asp:TextBox runat="server" ID="txtNombreMedico"   onkeypress="return event.keyCode!=13;" MaxLength="200" placeholder ="Nombre doctor"/>
												<ASP:RequiredFieldValidator id="rqrValidaNombreMedico" runat="server" errormessage="Debe colocar el nombre del medico" width="132px" controltovalidate="txtNombreMedico" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
												<asp:HiddenField runat ="server" ID ="hdnMedicoID"  Value="0"/>                                               </div>
											<div class="6u 12u$(xsmall)"> 
												<asp:TextBox runat="server" ID="txtNombreConsultorio" onkeypress="return event.keyCode!=13;" MaxLength="300" placeholder ="Nombre consultorio"/>
												<asp:HiddenField runat ="server" ID ="hdnConsultorioID"  Value="0"/>    
												<ASP:RequiredFieldValidator id="rqrValidaConsultorio" runat="server" errormessage="Debe colocar el nombre del consultorio" width="132px" controltovalidate="txtNombreConsultorio" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
											</div>
											<div class="6u 12u$(xsmall)">
												<asp:TextBox runat="server" ID="txtCitas" onkeypress="return event.keyCode!=13;" MaxLength="12" placeholder ="Numero maximo de citas"/>
												<ASP:RequiredFieldValidator id="rqrValidaCitas" runat="server" errormessage="Debe colocar cantidad de citas" width="132px" controltovalidate="txtCitas" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
											</div>
											<div class="6u 12u$(xsmall)">
												<div class="select-wrapper">
													<asp:DropDownList ID="ddlFormaPago" runat="server"  Width="520" AppendDataBoundItems="True"  >
													</asp:DropDownList>
												</div>
											</div>
											<div class="12u$">
												<ul class="actions">
													<li><asp:Button Text="Actualizar" runat="server" ID ="btnGuardar"  CssClass ="special" OnClick="btnGuardar_Click"/></li>
													<li><asp:Button Text="Nuevo registro" runat="server" ID ="btnNuevo"  CausesValidation="False" OnClick="btnNuevo_Click"/></li>
													<li><asp:Button Text="TEST" runat="server" ID ="btnTest"  style="display:none" CausesValidation="False" OnClick="btnTest_Click"/></li>
												</ul>
											</div>
											<div class="table-wrapper">
												  <asp:GridView ID="gridDetalle" runat="server"  EmptyDataText="No existen Registros" 
													  GridLines="Horizontal" AutoGenerateColumns="False" OnRowCommand="gridDetalle_RowCommand" >
														<HeaderStyle  Font-Size="10px" />
														<AlternatingRowStyle  Font-Size="10px" />
														  <RowStyle  Font-Size="10px" />
													  <Columns>
														  <asp:TemplateField HeaderText="Médico">
															  <ItemTemplate>
																  <asp:Label runat="server" ID="lblMedico" Text='<%# Eval("NombreMedico") %>' Font-Bold ="true" ></asp:Label>
															  </ItemTemplate>
														  </asp:TemplateField>
														  <asp:TemplateField HeaderText="Especialidad">
															  <ItemTemplate>
																  <asp:Label runat="server" ID="lblEspecialidad" Text='<%# Eval("NombreEspecialidadMedica") %>'></asp:Label>
															  </ItemTemplate>
														  </asp:TemplateField>
														   <asp:TemplateField HeaderText="Consultorio">
															  <ItemTemplate>
																  <asp:Label runat="server" ID="lblConsultorio" Text='<%# Eval("NombreConsultorio") %>' Font-Bold ="true" ></asp:Label>
															  </ItemTemplate>
														  </asp:TemplateField>
														  <asp:TemplateField HeaderText="Estado">
															  <ItemTemplate>
																  <asp:Label runat="server" ID="lblNombreEstado" Text='<%# Eval("NombreEstado") %>' Font-Bold ="true" ></asp:Label>
															  </ItemTemplate>
														  </asp:TemplateField>
														  <asp:TemplateField HeaderText="Ciudad">
															  <ItemTemplate>
																  <asp:Label runat="server" ID="lblCiudad" Text='<%# Eval("NombreCiudad") %>' Font-Bold ="true" ></asp:Label>
															  </ItemTemplate>
														  </asp:TemplateField>

														   <asp:TemplateField HeaderText="Acciones">
															  <ItemTemplate>
																  <asp:ImageButton runat="server" ID="btnEliminar" AlternateText="Eliminar Detalle" CausesValidation="false" OnClientClick="return Confirmacion();" ToolTip="Eliminar Detalle" CssClass="cBotones" ImageUrl="~/Images/eliminar.gif"  CommandName="EliminarDetalle" CommandArgument='<%# Eval("MedicoConsultorioID") %>'/>
															  </ItemTemplate>
														  </asp:TemplateField>
													  </Columns>
												  </asp:GridView>
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
