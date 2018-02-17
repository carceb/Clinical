using Database.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Clinical
{
    public partial class CitaCola
    {
        public static DataSet ObtenerColaDeCitas(int consultorioID, string fechaDeCita)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@ConsultorioID", SqlDbType.Int, 0, consultorioID),
                    DBHelper.MakeParam("@FechaDeCita", SqlDbType.VarChar, 0, fechaDeCita)
                };

            return DBHelper.ExecuteDataSet("usp_CitaCola_ObtenerColaDeCitas", dbParams);
        }
        public static int ActuaizarEstatusCita(CCita objetoCita)
        {
            SqlParameter[] dbParams = new SqlParameter[]
            {
                    DBHelper.MakeParam("@CitaID", SqlDbType.Int, 0, objetoCita.CitaID),
                    DBHelper.MakeParam("@EstatusCitaID", SqlDbType.Int, 0, objetoCita.EstatusCitaID),
                    DBHelper.MakeParam("@DescripcionPadecimiento", SqlDbType.VarChar, 0, objetoCita.DescripcionPadecimiento),
                    DBHelper.MakeParam("@MedicoConsultorioD", SqlDbType.Int, 0, objetoCita.MedicoConsultorioID)
            };
            if (objetoCita.EstatusCitaID == 3)
            {
                IngresaPacienteConsulta(objetoCita);
            }
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_CitaCola_ActualizarEstatusCita", dbParams));
        }
        private static void IngresaPacienteConsulta(CCita objetoCita)
        {
            SqlDataReader dr;
            dr = AtencionDoctor.ObtenerConsultaRegistrada(Convert.ToInt32(objetoCita.CedulaPacienteCita), objetoCita.FechaCita);
            if (!dr.HasRows)
            {
                SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@PacienteID", SqlDbType.Int, 0, 0),
                    DBHelper.MakeParam("@CedulaPaciente", SqlDbType.Int, 0, Convert.ToInt32(objetoCita.CedulaPacienteCita)),
                    DBHelper.MakeParam("@FechaConsulta", SqlDbType.SmallDateTime, 0, Convert.ToDateTime(objetoCita.FechaCita)),
                    DBHelper.MakeParam("@MotivoConsulta", SqlDbType.VarChar, 0, objetoCita.DescripcionPadecimiento),
                    DBHelper.MakeParam("@MedicoConsultorioID", SqlDbType.Int, 0, objetoCita.MedicoConsultorioID),
                    DBHelper.MakeParam("@MedicoID", SqlDbType.Int, 0, 0)
                };
                DBHelper.ExecuteScalar("usp_CitaCola_InsertarPacienteConsulta", dbParams);
            }

        }
        public static int EliminarCitaCola(int citaID)
        {
            SqlParameter[] dbParams = new SqlParameter[]
            {
                    DBHelper.MakeParam("@CitaID", SqlDbType.Int, 0, citaID)
            };
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_CitaCola_EliminarCitaCola", dbParams));
        }
        public static DataSet ObtenerColaCitasDoctor(int consultorioID, string fechaDeCita, int codigoMedico)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@ConsultorioID", SqlDbType.Int, 0, consultorioID),
                    DBHelper.MakeParam("@FechaDeCita", SqlDbType.VarChar, 0, fechaDeCita),
                    DBHelper.MakeParam("@MedicoID", SqlDbType.Int, 0, codigoMedico)
                };

            return DBHelper.ExecuteDataSet("usp_SeleccionDoctor_ObtenerColaDeCitas", dbParams);
        }
    }
}