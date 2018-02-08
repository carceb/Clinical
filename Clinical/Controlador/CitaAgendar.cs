using Database.Classes;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace Clinical
{
    public partial class CitaAgendar
    {
        public static SqlDataReader ObtenerVisitas(int medicoCalendarioSemanaID)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@MedicoCalendarioSemanaID", SqlDbType.Int, 0, medicoCalendarioSemanaID),
                };

            return DBHelper.ExecuteDataReader("usp_CitaAgendar_ObtenerSeleccionConsultorio", dbParams);
        }
        public static int InsertarCita(CCita objetoCita)
        {
            SqlParameter[] dbParams = new SqlParameter[]
            {
                    DBHelper.MakeParam("@MedicoConsultorioID", SqlDbType.Int, 0, objetoCita.MedicoConsultorioID),
                    DBHelper.MakeParam("@FechaCita", SqlDbType.SmallDateTime, 0, objetoCita.FechaCita),
                    DBHelper.MakeParam("@CedulaPacienteCita", SqlDbType.Int, 0, objetoCita.CedulaPacienteCita),
                    DBHelper.MakeParam("@NombrePacienteCita", SqlDbType.VarChar, 0, objetoCita.NombrePacienteCita),
                    DBHelper.MakeParam("@CelularPacienteCita", SqlDbType.VarChar, 0, objetoCita.CelularPacienteCita),
                    DBHelper.MakeParam("@EMailPacienteCita", SqlDbType.VarChar, 0, objetoCita.EmailPacienteCita),
                    DBHelper.MakeParam("@CitaMotivoID", SqlDbType.Int, 0, objetoCita.CitaMotivoID),

            };
            return Convert.ToInt32(DBHelper.ExecuteScalar("usp_CitaAgendar_InsertarCita", dbParams));
        }
        public static SqlDataReader ObtenerCitaPorCedula(int cedulaCita)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@CedulaPacienteCita", SqlDbType.Int, 0, cedulaCita)
                };

            return DBHelper.ExecuteDataReader("usp_CitaAgendar_ObtenerCitaPorCedula", dbParams);
        }
        public static SqlDataReader ObtenerCalendarioConsulta(int medicoConsultorioID, string diaSemana)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@MedicoConsultorioID", SqlDbType.Int, 0, medicoConsultorioID),
                    DBHelper.MakeParam("@DiaSemana", SqlDbType.VarChar, 0, diaSemana)
                };

            return DBHelper.ExecuteDataReader("usp_CitaAgendar_ObtenerCalendario", dbParams);
        }
        public static SqlDataReader ObtenerCitasConsultorio(int medicoConsultorioID, string fechaCita)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@MedicoConsultorioID", SqlDbType.Int, 0, medicoConsultorioID),
                    DBHelper.MakeParam("@FechaCita", SqlDbType.VarChar, 0, fechaCita)
                };

            return DBHelper.ExecuteDataReader("usp_CitaAgendar_ObtenerCitasConsultorio", dbParams);
        }
        public static bool EsCitaAgendada(int cedulaCita)
        {
            bool esAgendada = false;
            SqlDataReader dr = ObtenerCitaPorCedula(cedulaCita);
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    esAgendada = true;
                }
            }
            return esAgendada;
        }
        public static bool EsHoraIncorrecta(int medicoConsultorioID, string diaSemana)
        {
            bool esIncorrecta = false;
            CultureInfo ci = new CultureInfo("Es-Es");
            SqlDataReader dr = ObtenerCalendarioConsulta(medicoConsultorioID, diaSemana);
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    int horaCalendario  =dr.GetInt32(4);
                    string tipoHorario = dr.GetString(6);

                    if (tipoHorario == "PM")
                    {
                        if (horaCalendario == 12)
                        {
                            horaCalendario = dr.GetInt32(4) - 1;
                        }
                        else
                        {
                            horaCalendario = dr.GetInt32(4) - 1 + 12;
                        }
                    }
                    else
                    {
                        if (horaCalendario == 12)
                        {
                            horaCalendario = dr.GetInt32(4) - 1;
                        }
                        else
                        {
                            horaCalendario = dr.GetInt32(4) - 1 + 12;
                        }
                    }

                    DateTime dt = System.DateTime.Now;
                    string horaActual = dt.ToString("HH", CultureInfo.InvariantCulture);

                    if (Convert.ToInt32(horaActual) > horaCalendario)
                    {
                        string diaSinAcento = ci.DateTimeFormat.GetDayName(System.DateTime.Now.DayOfWeek).ToUpper();
                        diaSinAcento = diaSinAcento.Replace("É", "E");
                        diaSinAcento = diaSinAcento.Replace("Á", "A");
                        if(diaSemana == diaSinAcento)
                        {
                            esIncorrecta = true;
                        }
                    }
                }
            }
            return esIncorrecta;
        }
        public static bool EsNumeroMaximoCitas(int medicoConsultorioID, string diaSemana, string fechaCita)
        {
            bool esNumeroMaximo = false;
            int citasAgendadasConsultorio = 0;
            int maximoCitasConsultorio;
            SqlDataReader dr = ObtenerCalendarioConsulta(medicoConsultorioID, diaSemana);
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    maximoCitasConsultorio = dr.GetInt32(11);
                    SqlDataReader drCitas = ObtenerCitasConsultorio(medicoConsultorioID, fechaCita);
                    if(drCitas.HasRows)
                    {
                        while(drCitas.Read())
                        {
                            citasAgendadasConsultorio = drCitas.GetInt32(2);
                        }
                    }
                    if(citasAgendadasConsultorio > maximoCitasConsultorio)
                    {
                        esNumeroMaximo = true;
                    }
                }
            }
            return esNumeroMaximo;
        }
    }
}