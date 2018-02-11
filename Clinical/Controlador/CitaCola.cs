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
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_CitaCola_ActualizarEstatusCita", dbParams));
        }
        public static int EliminarCitaCola(int citaID)
        {
            SqlParameter[] dbParams = new SqlParameter[]
            {
                    DBHelper.MakeParam("@CitaID", SqlDbType.Int, 0, citaID)
            };
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_CitaCola_EliminarCitaCola", dbParams));
        }
    }
}