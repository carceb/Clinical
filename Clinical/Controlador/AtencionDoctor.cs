using Database.Classes;
using System;
using System.Data;
using System.Data.SqlClient;


namespace Clinical
{
    public partial class AtencionDoctor
    {
        public static SqlDataReader ObtenerDatosPacienteEnAtencion(int codigoConsultorio, string fechaCita)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@ConsultorioID", SqlDbType.Int, 0, codigoConsultorio),
                    DBHelper.MakeParam("@FechaDeCita", SqlDbType.VarChar, 0, fechaCita)
                };

            return DBHelper.ExecuteDataReader("usp_CitaCola_ObtenerPacienteEnAtencion", dbParams);
        }
        public static DataSet ObtenerDatosPacienteConsulta(int codigoConsultorio, string fechaCita)
        {
            decimal cedulaPaciente =0;
            SqlDataReader dr = ObtenerDatosPacienteEnAtencion(codigoConsultorio, fechaCita);
            if(dr.HasRows)
            {
                while(dr.Read())
                {
                    cedulaPaciente = dr.GetDecimal(6);
                }
            }
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@CedulaPaciente", SqlDbType.Decimal, 0, cedulaPaciente)
                };

            return DBHelper.ExecuteDataSet("usp_AtencionDoctor_ObtenerDatosPacienteConsulta", dbParams);
        }
        public static int ActuaizarConsulta(CConsulta objetoConsulta)
        {
            SqlParameter[] dbParams = new SqlParameter[]
            {
                    DBHelper.MakeParam("@PacienteConsultaID", SqlDbType.Int, 0, objetoConsulta.PacienteConsultaID),
                    DBHelper.MakeParam("@DescripcionTratamiento", SqlDbType.VarChar, 0, objetoConsulta.DescripcionTratamiento),
                    DBHelper.MakeParam("@Medicamentos", SqlDbType.VarChar, 0, objetoConsulta.Medicamentos),
                    DBHelper.MakeParam("@DescripcionEvolucionTratamiento", SqlDbType.VarChar, 0, objetoConsulta.DescripcionEvolucionTratamiento),
                    DBHelper.MakeParam("@EstatusCitaID", SqlDbType.Int, 0, objetoConsulta.EstatusCitaID)
            };
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_AtencionDoctor_ActualizarConsulta", dbParams));
        }
    }
}