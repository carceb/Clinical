using Database.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Clinical
{
    public partial class MedicoConsultorio
    {
        public static int InsertarMedicoConsultorio(CMedicoConsultorio objetoMedicoConsultorio)
        {
            SqlParameter[] dbParams = new SqlParameter[]
            {
                    DBHelper.MakeParam("@ConsultorioID", SqlDbType.Int, 0, objetoMedicoConsultorio.ConsultorioID),
                    DBHelper.MakeParam("@MedicoID", SqlDbType.Int, 0, objetoMedicoConsultorio.MedicoID),
                    DBHelper.MakeParam("@NumeroMaximoCitas", SqlDbType.Int, 0, objetoMedicoConsultorio.NumeroMaximoCitas),
                    DBHelper.MakeParam("@FormaPagoID", SqlDbType.Int, 0, objetoMedicoConsultorio.FormaPagoID)
            };
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_MedicoConsultorio_InsertarMedicoConsultorio", dbParams));
        }
        public static DataSet ObtenerMedicoConsultorios(int medicoID)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@MedicoID", SqlDbType.Int, 0, medicoID),
                };

            return DBHelper.ExecuteDataSet("usp_MedicoConsultorio_ObtenerMedicoConsultorios", dbParams);
        }
        public static int EliminarMedicoConsultorio(int medicoConsultorioID)
        {
            SqlParameter[] dbParams = new SqlParameter[]
            {
                    DBHelper.MakeParam("@MedicoConsultorio", SqlDbType.Int, 0, medicoConsultorioID)
            };
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_MedicoConsultorio_EliminarMedicoConsultorio", dbParams));
        }
        public static SqlDataReader ObtenerMedicoConConsultorio(int medicoID, int consultorioID)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@MedicoID", SqlDbType.Int, 0, medicoID),
                    DBHelper.MakeParam("@ConsultorioID", SqlDbType.Int, 0, consultorioID)
                };

            return DBHelper.ExecuteDataReader("usp_MedicoConsultorio_ObtenerMedicoConConsultorio", dbParams);
        }
    }
}