using Database.Classes;
using System;
using System.Data;
using System.Data.SqlClient;

namespace Clinical
{
    public partial class Consultorio
    {
        public static int InsertarConsultorio(CConsultorio objetoConsultorio)
        {
            SqlParameter[] dbParams = new SqlParameter[]
            {
                    DBHelper.MakeParam("@NombreConsultorio", SqlDbType.VarChar, 0, objetoConsultorio.NombreConsultorio),
                    DBHelper.MakeParam("@RIFConsultorio", SqlDbType.VarChar, 0, objetoConsultorio.Rif),
                    DBHelper.MakeParam("@DireccionConsultorio", SqlDbType.VarChar, 0, objetoConsultorio.DireccionConsultorio),
                    DBHelper.MakeParam("@CiudadID", SqlDbType.Int, 0, objetoConsultorio.CiudadID),
                    DBHelper.MakeParam("@TelefonoConsultorio", SqlDbType.VarChar, 0, objetoConsultorio.TelefonoConsultorio),
                    DBHelper.MakeParam("@EmailConsultorio", SqlDbType.VarChar, 0, objetoConsultorio.EmailConsultorio)

            };
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_Consultorio_InsertarConsultorio", dbParams));
        }
        public static int ActualizarConsultorio(CConsultorio objetoConsultorio)
        {
            SqlParameter[] dbParams = new SqlParameter[]
            {
                    DBHelper.MakeParam("@ConsultorioID", SqlDbType.Int, 0, objetoConsultorio.ConsultorioID),
                    DBHelper.MakeParam("@NombreConsultorio", SqlDbType.VarChar, 0, objetoConsultorio.NombreConsultorio),
                    DBHelper.MakeParam("@RIFConsultorio", SqlDbType.VarChar ,0, objetoConsultorio.Rif),
                    DBHelper.MakeParam("@DireccionConsultorio", SqlDbType.VarChar, 0, objetoConsultorio.DireccionConsultorio),
                    DBHelper.MakeParam("@CiudadID", SqlDbType.Int, 0, objetoConsultorio.CiudadID),
                    DBHelper.MakeParam("@TelefonoConsultorio", SqlDbType.VarChar, 0, objetoConsultorio.TelefonoConsultorio),
                    DBHelper.MakeParam("@EmailConsultorio", SqlDbType.VarChar, 0, objetoConsultorio.EmailConsultorio)

            };
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_Consultorio_ActualizarConsultorio", dbParams));
        }
    }
}