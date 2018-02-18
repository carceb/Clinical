using Database.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Clinical
{
    public partial class MedicoCalendario
    {
        public static int InsertarMedicoCalendario(CMedicoCalendario objetoMedicoCalendario)
        {
            SqlParameter[] dbParams = new SqlParameter[]
            {
                    DBHelper.MakeParam("@MedicoConsultorioID", SqlDbType.Int, 0, objetoMedicoCalendario.MedicoConsultorioID),
                    DBHelper.MakeParam("@DiaSemanaID", SqlDbType.Int, 0, objetoMedicoCalendario.DiaSemanaID),
                    DBHelper.MakeParam("@HoraSemanaID", SqlDbType.Int, 0, objetoMedicoCalendario.HoraSemanaID),
                    DBHelper.MakeParam("@MinutosSemanaID", SqlDbType.Int, 0, objetoMedicoCalendario.MinutosSemanaID),
                    DBHelper.MakeParam("@TipoHoraSemanaID", SqlDbType.Int, 0, objetoMedicoCalendario.TipoHoraSemanaID),
                    DBHelper.MakeParam("@IndicaHoraInicial", SqlDbType.Bit, 0, objetoMedicoCalendario.IndicaHoraInicial)
            };
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_MedicoCalendario_InsertarMedicoCalendario", dbParams));
        }
        public static DataSet ObtenerMedicoCalendario(int medicoID)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@MedicoID", SqlDbType.Int, 0, medicoID),
                };

            return DBHelper.ExecuteDataSet("usp_MedicoCalendario_ObtenerCalendario", dbParams);
        }
        public static int EliminarMedicoCalendario(int medicoCalendarioSemanaID)
        {
            SqlParameter[] dbParams = new SqlParameter[]
            {
                    DBHelper.MakeParam("@MedicoCalendarioSemanaID", SqlDbType.Int, 0, medicoCalendarioSemanaID)
            };
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_MedicoCalendario_EliminarMedicoCalendario", dbParams));
        }
    }
}