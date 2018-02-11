using Database.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Clinical
{
    public partial class Paciente
    {
        public static int InsertarPaciente(CPaciente objetoPaciente)
        {
            int proceso = 0;
            if (objetoPaciente.PacienteID != 0)
            {
                proceso = ActualizarPaciente(objetoPaciente);
            }
            else
            {
                SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@SexoPaciente", SqlDbType.VarChar, 0, objetoPaciente.SexoPaciente),
                    DBHelper.MakeParam("@CedulaPaciente", SqlDbType.Int, 0, objetoPaciente.CedulaPaciente),
                    DBHelper.MakeParam("@FechaNacimientoPaciente", SqlDbType.SmallDateTime, 0, Convert.ToDateTime(objetoPaciente.FechaNacimientoPaciente)),
                    DBHelper.MakeParam("@NombrePaciente", SqlDbType.VarChar, 0, objetoPaciente.NombrePaciente),
                    DBHelper.MakeParam("@CelularPaciente", SqlDbType.VarChar, 0, objetoPaciente.CelularPaciente),
                    DBHelper.MakeParam("@CiudadID", SqlDbType.Int, 0, objetoPaciente.CiudadID),
                    DBHelper.MakeParam("@DireccionPaciente", SqlDbType.VarChar, 0, objetoPaciente.DireccionPaciente),
                    DBHelper.MakeParam("@AseguradoraID", SqlDbType.Int, 0, objetoPaciente.AseguradoraID),
                    DBHelper.MakeParam("@TipoSangreID", SqlDbType.Int, 0, objetoPaciente.TipoSangreID),
                    DBHelper.MakeParam("@Peso", SqlDbType.VarChar, 0, objetoPaciente.Peso)

                };
                proceso = Convert.ToInt32(DBHelper.ExecuteScalar("usp_Paciente_InsertarPaciente", dbParams));
            }
            return proceso;
        }
        public static int ActualizarPaciente(CPaciente objetoPaciente)
        {
            SqlParameter[] dbParams = new SqlParameter[]
            {
                    DBHelper.MakeParam("@PacienteID", SqlDbType.Int, 0, objetoPaciente.PacienteID),
                    DBHelper.MakeParam("@SexoPaciente", SqlDbType.VarChar, 0, objetoPaciente.SexoPaciente),
                    DBHelper.MakeParam("@CedulaPaciente", SqlDbType.Int, 0, objetoPaciente.CedulaPaciente),
                    DBHelper.MakeParam("@FechaNacimientoPaciente", SqlDbType.SmallDateTime, 0, Convert.ToDateTime(objetoPaciente.FechaNacimientoPaciente)),
                    DBHelper.MakeParam("@NombrePaciente", SqlDbType.VarChar, 0, objetoPaciente.NombrePaciente),
                    DBHelper.MakeParam("@CelularPaciente", SqlDbType.VarChar, 0, objetoPaciente.CelularPaciente),
                    DBHelper.MakeParam("@CiudadID", SqlDbType.Int, 0, objetoPaciente.CiudadID),
                    DBHelper.MakeParam("@DireccionPaciente", SqlDbType.VarChar, 0, objetoPaciente.DireccionPaciente),
                    DBHelper.MakeParam("@AseguradoraID", SqlDbType.Int, 0, objetoPaciente.AseguradoraID),
                    DBHelper.MakeParam("@TipoSangreID", SqlDbType.Int, 0, objetoPaciente.TipoSangreID),
                    DBHelper.MakeParam("@Peso", SqlDbType.VarChar, 0, objetoPaciente.Peso)

            };
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_Paciente_ActualizarPaciente", dbParams));
        }
    }

}