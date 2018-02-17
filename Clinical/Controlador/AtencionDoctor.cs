using Database.Classes;
using System;
using System.Data;
using System.Data.SqlClient;


namespace Clinical
{
    public partial class AtencionDoctor
    {
        public static SqlDataReader ObtenerDatosPacienteEnAtencion(int codigoConsultorio, string fechaCita, int codigoMedico)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@ConsultorioID", SqlDbType.Int, 0, codigoConsultorio),
                    DBHelper.MakeParam("@FechaDeCita", SqlDbType.VarChar, 0, fechaCita),
                    DBHelper.MakeParam("@MedicoID", SqlDbType.Int, 0, codigoMedico)
                };

            return DBHelper.ExecuteDataReader("usp_AtencionDoctor_ObtenerPacienteEnAtencion", dbParams);
        }
        public static DataSet ObtenerDatosPacienteConsulta(int codigoConsultorio, string fechaCita, int codigoMedico)
        {
            decimal cedulaPaciente =0;

            SqlDataReader dr = ObtenerDatosPacienteEnAtencion(codigoConsultorio, fechaCita, codigoMedico);
            if(dr.HasRows)
            {
                while(dr.Read())
                {
                    cedulaPaciente = dr.GetDecimal(6);
                }
            }
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@CedulaPaciente", SqlDbType.Decimal, 0, cedulaPaciente),
                    DBHelper.MakeParam("@MedicoID", SqlDbType.Int, 0, codigoMedico)
                };

            return DBHelper.ExecuteDataSet("usp_AtencionDoctor_ObtenerDatosPacienteConsulta", dbParams);
        }
        public static int ActualizarConsulta(CConsulta objetoConsulta, int codigoCita)
        {
            SqlParameter[] dbParams = new SqlParameter[]
            {
                    DBHelper.MakeParam("@PacienteConsultaID", SqlDbType.Int, 0, objetoConsulta.PacienteConsultaID),
                    DBHelper.MakeParam("@DescripcionTratamiento", SqlDbType.VarChar, 0, objetoConsulta.DescripcionTratamiento),
                    DBHelper.MakeParam("@Medicamentos", SqlDbType.VarChar, 0, objetoConsulta.Medicamentos),
                    DBHelper.MakeParam("@DescripcionEvolucionTratamiento", SqlDbType.VarChar, 0, objetoConsulta.DescripcionEvolucionTratamiento),
                    DBHelper.MakeParam("@EstatusCitaID", SqlDbType.Int, 0, objetoConsulta.EstatusCitaID),
                    DBHelper.MakeParam("@CitaID", SqlDbType.Int, 0, codigoCita)
            };
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_AtencionDoctor_ActualizarConsulta", dbParams));
        }
        public static SqlDataReader ObtenerConsultaRegistrada(int cedulaPaciente, string fechaConsulta)
        {

            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@CedulaPaciente", SqlDbType.Decimal, 0, cedulaPaciente),
                    DBHelper.MakeParam("@FechaDeConsulta", SqlDbType.VarChar, 0, fechaConsulta)
                };

            return DBHelper.ExecuteDataReader("usp_AtencionDoctor_ObtenerConsultaRegistrada", dbParams);
        }
    }
}