<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AtencionDoctorSeleccion.aspx.cs" Inherits="Clinical.AtencionDoctorSeleccion" %>

<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>
<%@ Register TagPrefix="uc2" TagName="UCNavegacion" Src="~/Vista/UCNavegacion.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">



<!DOCTYPE HTML>

<html>
    <head>
        <title>| clinical | Seleccionar Paciente Para Consulta |</title>
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
                                    <a class="logo"><strong>Seleccionar Paciente Para Consulta</strong></a>
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
                                                         <asp:DropDownList ID="ddlDoctor" runat="server" Width="300" OnSelectedIndexChanged="ddlDoctor_SelectedIndexChanged" ></asp:DropDownList>
                                                    </li>
                                                </ul>

                                            </div>
                                        </div>
                                        <ul class="actions">
                                                <%--separador--%>
                                        </ul>
                                            <div class="table-wrapper">
                                                  <asp:GridView ID="gridDetalle" runat="server" CssClass="subtitulo" EmptyDataText="No existen Registros" 
                                                      GridLines="Horizontal" AutoGenerateColumns="False" OnRowCommand="gridDetalle_RowCommand"  >
                                                        <HeaderStyle CssClass ="registroTitulo" Font-Size="10px" />
                                                        <AlternatingRowStyle CssClass ="registroNormal" Font-Size="10px" />
                                                          <RowStyle CssClass ="registroAlternado" Font-Size="10px" />
                                                      <Columns>
                                                          <asp:TemplateField HeaderText="CodV" HeaderStyle-Width="0" Visible="false">
                                                              <ItemTemplate>
                                                                  <asp:TextBox runat="server" ID="txtCitaID" Visible ="false"   Width="0" ForeColor ="Red" Text='<%# Eval("CitaID") %>' ></asp:TextBox>
                                                              </ItemTemplate>
                                                        <HeaderStyle Width="0px"></HeaderStyle>
                                                          </asp:TemplateField>
                                                          <asp:TemplateField HeaderText="Estatus Cita">
                                                              <ItemTemplate>
                                                                  <asp:Label runat="server" ID="lblEstatusCita" Text='<%# Eval("NombreEstatusCita") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusCitaID").ToString() == "3"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                          <asp:TemplateField HeaderText="Paciente">
                                                              <ItemTemplate>
                                                                  <asp:Label runat="server" ID="lblNombrePaciente" Text='<%# Eval("NombrePacienteCita") %>' Font-Bold ="true" ForeColor = '<%# Eval("EstatusCitaID").ToString() == "3"?System.Drawing.Color.Red:System.Drawing.Color.Blue %>'></asp:Label>
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
                                                           <asp:TemplateField HeaderText="MedicoConsultorioID" HeaderStyle-Width="0" Visible="false">
                                                              <ItemTemplate>
                                                                  <asp:TextBox runat="server" ID="txtMedicoConsultorioID"  Visible="false" Text='<%# Eval("MedicoConsultorioID") %>' ></asp:TextBox>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>

                                                           <asp:TemplateField HeaderText="Acciones" HeaderStyle-Width="150px">
                                                              <ItemTemplate>
                                                                  <asp:ImageButton runat="server" ID="btnSeleccionar" AlternateText="Seleccionar Detalle" CausesValidation="false" ToolTip="Seleccionar Paciente"  ImageUrl="~/images/seleccionar.png"  CommandName="SeleccionarDetalle" CommandArgument='<%# Eval("CitaID") %>' Visible  = '<%# Eval("EstatusCitaID").ToString() == "3"?true:false %>'/>
                                                                  <%--<asp:ImageButton runat="server" ID="btnEliminar" AlternateText="Eliminar Detalle" CausesValidation="false" OnClientClick="return Confirmacion();" ToolTip="Eliminar Cita"  ImageUrl="~/images/eliminar.gif"  CommandName="EliminarDetalle" CommandArgument='<%# Eval("CitaID") %>'/>--%>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                      </Columns>
                                                  </asp:GridView>
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