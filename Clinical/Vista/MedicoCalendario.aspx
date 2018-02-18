<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicoCalendario.aspx.cs" Inherits="Clinical.MedicoCalendario" %>

<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>
<%@ Register TagPrefix="uc2" TagName="UCNavegacion" Src="~/Vista/UCNavegacion.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<!DOCTYPE HTML>

<html>
	<head>
		<title>| clinical | Medico Calendario|</title>
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
				identifier: 'ConsultoriosMedicos'
			}, fnPersonalCallBack1);

		});

		function fnPersonalCallBack1(par) {
			document.getElementById("hdnConsultorioID").value = par[0];
			document.getElementById("hdnMedicoConsultorioID").value = par[3];
			document.getElementById("txtNombreConsultorio").value = par[1];
			document.getElementById("hdnMedicoID").value = par[9];
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
												<asp:TextBox runat="server" ID="txtNombreConsultorio" onkeypress="return event.keyCode!=13;" MaxLength="300" placeholder ="Nombre Consultorio"/>
												<asp:HiddenField runat ="server" ID ="hdnConsultorioID"  Value="0"/>
												<asp:HiddenField runat ="server" ID ="hdnMedicoConsultorioID"  Value="0"/>
												<asp:HiddenField runat ="server" ID ="hdnMedicoID"  Value="0"/>        
												<ASP:RequiredFieldValidator id="rqrValidaConsultorio" runat="server" errormessage="Debe colocar el nombre del consultorio" width="132px" controltovalidate="txtNombreConsultorio" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
											</div>
											<div class="6u 12u$(xsmall)">
												<div class="select-wrapper">
													<asp:DropDownList ID="ddlDia" runat="server"   AppendDataBoundItems="True"  >
													</asp:DropDownList>
												</div>
											</div>
											<div class="6u 12u$(xsmall)">
												<div class="select-wrapper">
													<asp:DropDownList ID="ddlHora" runat="server"   AppendDataBoundItems="True"  >
													</asp:DropDownList>
												</div>
											</div>
											<div class="6u 12u$(xsmall)">
												<div class="select-wrapper">
													<asp:DropDownList ID="ddlMinutos" runat="server"   AppendDataBoundItems="True"  >
													</asp:DropDownList>
												</div>
											</div>
											<div class="6u 12u$(xsmall)">
												<div class="select-wrapper">
													<asp:DropDownList ID="ddlTipoHora" runat="server"   AppendDataBoundItems="True"  >
													</asp:DropDownList>
												</div>
											</div>
											<div class="6u 12u$(xsmall)">
												<div class="select-wrapper">
													<asp:DropDownList ID="ddlInicial" runat="server"   >
														<asp:ListItem>SI</asp:ListItem>
														<asp:ListItem>NO</asp:ListItem>
													</asp:DropDownList>
												</div>
											</div>

											<div class="12u$">
												<ul class="actions">
													<li><asp:Button Text="Actualizar" runat="server" ID ="btnGuardar"  CssClass ="special" OnClick="btnGuardar_Click" /></li>
													<li><asp:Button Text="Nuevo registro" runat="server" ID ="btnNuevo"  CausesValidation="False" OnClick="btnNuevo_Click" /></li>
													<li><asp:Button Text="TEST" runat="server" ID ="btnTest"   style="display:none" CausesValidation="False" OnClick="btnTest_Click" /></li>
											</ul>
											</div>
											<div class="table-wrapper">
		                                        <asp:GridView ID="gridDetalle" runat="server"  EmptyDataText="No existen Registros" 
			                                        GridLines="Horizontal" AutoGenerateColumns="False" OnRowCommand="gridDetalle_RowCommand" >
				                                    <HeaderStyle  Font-Size="10px" />
				                                    <AlternatingRowStyle CssClass ="registroNormal" Font-Size="10px" />
				                                        <RowStyle CssClass ="registroAlternado" Font-Size="10px" />
			                                        <Columns>
				                                        <asp:TemplateField HeaderText="Consultorio" >
					                                        <ItemTemplate>
						                                        <asp:Label runat="server" ID="lblConsultorio" Text='<%# Eval("NombreConsultorio") %>' Font-Bold ="true" ></asp:Label>
					                                        </ItemTemplate>
				                                        </asp:TemplateField>
				                                        <asp:TemplateField HeaderText="Estado">
					                                        <ItemTemplate>
						                                        <asp:Label runat="server" ID="lblEstado" Text='<%# Eval("NombreEstado") %>'></asp:Label>
					                                        </ItemTemplate>
				                                        </asp:TemplateField>
				                                        <asp:TemplateField HeaderText="Ciudad" >
					                                        <ItemTemplate>
						                                        <asp:Label runat="server" ID="lblCiudad" Text='<%# Eval("NombreCiudad") %>' Font-Bold ="true" ></asp:Label>
					                                        </ItemTemplate>
				                                        </asp:TemplateField>
				                                        <asp:TemplateField HeaderText="Doctor" >
					                                        <ItemTemplate>
						                                        <asp:Label runat="server" ID="lblDoctor" Text='<%# Eval("NombreMedico") %>' Font-Bold ="true" ></asp:Label>
					                                        </ItemTemplate>
				                                        </asp:TemplateField>
				                                        <asp:TemplateField HeaderText="Día" >
					                                        <ItemTemplate>
						                                        <asp:Label runat="server" ID="lblDia" Text='<%# Eval("DiaSemana") %>' Font-Bold ="true" ></asp:Label>
					                                        </ItemTemplate>
				                                        </asp:TemplateField>
				                                        <asp:TemplateField HeaderText="Hora" >
					                                        <ItemTemplate>
						                                        <asp:Label runat="server" ID="lblHora" Text='<%# Eval("HoraSemana") %>' Font-Bold ="true" ></asp:Label>
					                                        </ItemTemplate>
				                                        </asp:TemplateField>
				                                        <asp:TemplateField HeaderText="Minutos" >
					                                        <ItemTemplate>
						                                        <asp:Label runat="server" ID="lblMinutos" Text='<%# Eval("MinutosSemana") %>' Font-Bold ="true" ></asp:Label>
					                                        </ItemTemplate>
				                                        </asp:TemplateField>

				                                        <asp:TemplateField HeaderText="Tipo">
					                                        <ItemTemplate>
						                                        <asp:Label runat="server" ID="lblTipo" Text='<%# Eval("NombreTipoHoraSemana") %>' Font-Bold ="true" ></asp:Label>
					                                        </ItemTemplate>
				                                        </asp:TemplateField>

				                                        <asp:TemplateField HeaderText="Inicio">
					                                        <ItemTemplate>
						                                        <asp:Label runat="server" ID="lblInicio" Text='<%# Eval("IndicaHoraInicial") %>' Font-Bold ="true" ></asp:Label>
					                                        </ItemTemplate>
				                                        </asp:TemplateField>

				                                        <asp:TemplateField HeaderText="Acciones">
					                                        <ItemTemplate>
						                                        <asp:ImageButton runat="server" ID="btnEliminar" AlternateText="Eliminar Detalle" CausesValidation="false" OnClientClick="return Confirmacion();" ToolTip="Eliminar Detalle" CssClass="cBotones" ImageUrl="~/Images/eliminar.gif"  CommandName="EliminarDetalle" CommandArgument='<%# Eval("MedicoCalendarioSemanaID") %>'/>
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


