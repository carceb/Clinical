using Database.Classes;
using System;
using System.Data;
using System.Data.SqlClient;

namespace Clinical
{
    public partial class Medicos
    {
        public static int InsertarMedico(CMedicos objetoMedico)
        {
            SqlParameter[] dbParams = new SqlParameter[]
            {
                    DBHelper.MakeParam("@SexoMedico", SqlDbType.VarChar, 0, objetoMedico.SexoMedico),
                    DBHelper.MakeParam("@CedulaMedico", SqlDbType.Int, 0, objetoMedico.CedulaMedico),
                    DBHelper.MakeParam("@NombreMedico", SqlDbType.VarChar, 0, objetoMedico.NombreMedico),
                    DBHelper.MakeParam("@RIFMedico", SqlDbType.VarChar, 0, objetoMedico.RIFMedico),
                    DBHelper.MakeParam("@MSAS", SqlDbType.VarChar, 0, objetoMedico.MSAS),
                    DBHelper.MakeParam("@ColegioMedico", SqlDbType.VarChar, 0, objetoMedico.ColegioMedico),
                    DBHelper.MakeParam("@EspecialidadMedicaID", SqlDbType.Int, 0, objetoMedico.EspecialidadMedicaID),
                    DBHelper.MakeParam("@DescripcionEspecialidad", SqlDbType.VarChar, 0, objetoMedico.DescripcionEspecialidad),
                    DBHelper.MakeParam("@CelularMedico", SqlDbType.VarChar, 0, objetoMedico.CelularMedico),
                    DBHelper.MakeParam("@EmailMedico", SqlDbType.VarChar, 0, objetoMedico.EmailMedico)

            };
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_Medicos_InsertarMedico", dbParams));
        }
        public static int ActualizarMedico(CMedicos objetoMedico)
        {
            SqlParameter[] dbParams = new SqlParameter[]
            {
                    DBHelper.MakeParam("@MedicoID", SqlDbType.Int, 0, objetoMedico.MedicoID),
                    DBHelper.MakeParam("@SexoMedico", SqlDbType.VarChar, 0, objetoMedico.SexoMedico),
                    DBHelper.MakeParam("@CedulaMedico", SqlDbType.Int, 0, objetoMedico.CedulaMedico),
                    DBHelper.MakeParam("@NombreMedico", SqlDbType.VarChar, 0, objetoMedico.NombreMedico),
                    DBHelper.MakeParam("@RIFMedico", SqlDbType.VarChar, 0, objetoMedico.RIFMedico),
                    DBHelper.MakeParam("@MSAS", SqlDbType.VarChar, 0, objetoMedico.MSAS),
                    DBHelper.MakeParam("@ColegioMedico", SqlDbType.VarChar, 0, objetoMedico.ColegioMedico),
                    DBHelper.MakeParam("@EspecialidadMedicaID", SqlDbType.Int, 0, objetoMedico.EspecialidadMedicaID),
                    DBHelper.MakeParam("@DescripcionEspecialidad", SqlDbType.VarChar, 0, objetoMedico.DescripcionEspecialidad),
                    DBHelper.MakeParam("@CelularMedico", SqlDbType.VarChar, 0, objetoMedico.CelularMedico),
                    DBHelper.MakeParam("@EmailMedico", SqlDbType.VarChar, 0, objetoMedico.EmailMedico)

            };
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_Medicos_ActualizarMedico", dbParams));
        }
    }
}