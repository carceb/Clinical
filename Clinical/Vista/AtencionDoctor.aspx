
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AtencionDoctor.aspx.cs" Inherits="Clinical.AtencionDoctor" %>
<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>
<%@ Register TagPrefix="uc2" TagName="UCNavegacion" Src="~/Vista/UCNavegacion.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<!DOCTYPE HTML>

<html>
    <head>
        <title>| clinical | Atención Doctor|</title>
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
                                    <a class="logo"><strong>Atención Doctor</strong></a>
                                    <ul class="icons">

                                    </ul>
                                </header>
                            <!-- Content -->
                            <form runat ="server" id ="principal">
                                <section>
                                    <p></p>
                                        <div class="row uniform">
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtNombrePaciente" placeholder ="Nombre Paciente" />
                                            </div>
                                            <div class="6u 12u$(xsmall)"> 
                                                <asp:TextBox runat="server" ID="txtEdad"  placeholder ="Edad" />
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtEstado" />  
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtCiudad" />
                                            </div>
                                            <div class="6u 12u$(xsmall)">
                                                <asp:TextBox runat="server" ID="txtDireccion"  TextMode="MultiLine" Rows="2"  onkeypress="return event.keyCode!=13;" placeholder ="Dirección del Paciente"/>
                                            </div>
                                            <div class="12u$">
                                                <ul class="actions">
                                                  <asp:Button Text="Actualizar" runat="server" ID ="btnGuardar"   OnClick="btnGuardar_Click"/>
                                                  <asp:Button Text="Nuevo registro" runat="server" ID ="btnNuevo" />

                                                </ul>
                                            </div>
                                            <div class="table-wrapper">
                                                  <asp:GridView ID="gridDetalle" runat="server"  EmptyDataText="No existen Registros" 
                                                      GridLines="Horizontal" AutoGenerateColumns="False" OnRowCommand="gridDetalle_RowCommand"  >
                                                        <HeaderStyle  Font-Size="10px" />
                                                        <AlternatingRowStyle  Font-Size="10px" />
                                                          <RowStyle  Font-Size="10px" />
                                                      <Columns>
                                                          <asp:TemplateField HeaderText="CodV" HeaderStyle-Width="0" Visible="false">
                                                              <ItemTemplate>
                                                                  <asp:TextBox runat="server" ID="txtCitaID" Visible ="false"   Width="0" ForeColor ="Red" Text='<%# Eval("PacienteConsultaID") %>' ></asp:TextBox>
                                                              </ItemTemplate>
                                                        <HeaderStyle Width="0px"></HeaderStyle>
                                                          </asp:TemplateField>
                                                          <asp:TemplateField HeaderText="Fecha">
                                                              <ItemTemplate>
                                                                  <asp:Label runat="server" ID="lblFechaConsulta" Text='<%# Eval("FechaDeConsulta") %>' ></asp:Label>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                          <asp:TemplateField HeaderText="Motivo Consulta">
                                                              <ItemTemplate>
                                                                  <asp:Label runat="server" ID="lblMotivo" Text='<%# Eval("MotivoConsulta") %>' ></asp:Label>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                           <asp:TemplateField HeaderText="Doctor">
                                                              <ItemTemplate>
                                                                  <asp:Label runat="server" ID="lblDoctor" Text='<%# Eval("NombreMedico") %>' ></asp:Label>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                          <asp:TemplateField HeaderText="Tratamiento">
                                                              <ItemTemplate>
                                                                  <asp:TextBox runat="server" ID="txtDescripcionTratamiento" TextMode="MultiLine" Rows ="4"  Text='<%# Eval("DescripcionTratamiento") %>'  Enabled = '<%# Eval("EstatusCitaID ").ToString() == "4"?false:true %>' ></asp:TextBox>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                          <asp:TemplateField HeaderText="Medicamentos">
                                                              <ItemTemplate>
                                                                  <asp:TextBox runat="server" ID="txtMedicamentos" TextMode="MultiLine" Rows ="4" Text='<%# Eval("Medicamentos") %>' Enabled = '<%# Eval("EstatusCitaID ").ToString() == "4"?false:true %>'></asp:TextBox>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                           <asp:TemplateField HeaderText="Evolución">
                                                              <ItemTemplate>
                                                                  <asp:TextBox runat="server" ID="txtEvolucion" TextMode="MultiLine" Rows ="4"  Text='<%# Eval("DescripcionEvolucionTratamiento") %>' Enabled = '<%# Eval("EstatusCitaID ").ToString() == "4"?false:true %>' ></asp:TextBox>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Estatus">
                                                              <ItemTemplate>
                                                                  <asp:DropDownList runat="server" ID="ddlEstatus"
                                                                        DataSourceID="SqlDataSource4" 
                                                                        DataTextField ="NombreEstatusCita"
                                                                        DataValueField ="EstatusCitaID"
                                                                        SelectedValue ='<%# Bind("EstatusCitaID") %>'
                                                                        
                                                                        Enabled = '<%# Eval("EstatusCitaID ").ToString() == "4"?false:true %>'>
                                                                  </asp:DropDownList>
                                                                <asp:SqlDataSource 
                                                                    ID="SqlDataSource4" 
                                                                    runat="server" ConnectionString="<%$ ConnectionStrings:CallCenterConnectionString %>" 
                                                                    SelectCommand="SELECT EstatusCitaID, NombreEstatusCita FROM dbo.EstatusCita WHERE (EstatusCitaID = 3 OR EstatusCitaID = 4)">
                                                                </asp:SqlDataSource>
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
    </body>
</html>
    
    
    
    
 







        </td>
    </tr>
    <tr>
      <td width="200" height="30" bgcolor="#d2d2c6">&nbsp;</td>
      <td width="10" bgcolor="#d2d2c6">&nbsp;</td>
      <td width="770" bgcolor="#d2d2c6" align="center" style="font-size:  small" ><u>clinical</u> Usuario: <%:Session["NombreCompletoUsuario"]%> Consultorio: <%:Session["NombreEmpresa"]%>
      <td width="20" bgcolor="#d2d2c6">&nbsp;</td>  
    </tr>
  </table>
    </form>
</body>
</html>
