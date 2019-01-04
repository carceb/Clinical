
namespace Clinical
{
    public class CCita
    {
        public CCita()
        {

        }

        public CCita(int _medicoConsultorioID, string _fechaCita, string _cedulaPacienteCita, string _nombrePacienteCita, string _celularPacienteCita, string _emailPacienteCita, int _estatusCitaID, int _citaMotivoID, int _citaID, string _descripcionPadecimiento, int _ordenLlegada)
        {
            this._medicoConsultorioID = _medicoConsultorioID;
            this._fechaCita = _fechaCita;
            this._cedulaPacienteCita = _cedulaPacienteCita;
            this._nombrePacienteCita = _nombrePacienteCita;
            this._celularPacienteCita = _celularPacienteCita;
            this._emailPacienteCita = _emailPacienteCita;
            this._estatusCitaID = _estatusCitaID;
            this._citaMotivoID = _citaMotivoID;
            this._citaID = _citaID;
            this._ordenLlegada = _ordenLlegada;
        }

        private int _medicoConsultorioID;
        private string _fechaCita;
        private string _cedulaPacienteCita;
        private string _nombrePacienteCita;
        private string _celularPacienteCita;
        private string _emailPacienteCita;
        private int _estatusCitaID;
        private int _citaMotivoID;
        private int _citaID;
        private string _descripcionPadecimiento;
        private int _ordenLlegada;

        public int MedicoConsultorioID
        {
            get
            {
                return _medicoConsultorioID;
            }

            set
            {
                _medicoConsultorioID = value;
            }
        }

        public string FechaCita
        {
            get
            {
                return _fechaCita;
            }

            set
            {
                _fechaCita = value;
            }
        }

        public string CedulaPacienteCita
        {
            get
            {
                return _cedulaPacienteCita;
            }

            set
            {
                _cedulaPacienteCita = value;
            }
        }

        public string NombrePacienteCita
        {
            get
            {
                return _nombrePacienteCita;
            }

            set
            {
                _nombrePacienteCita = value;
            }
        }

        public string CelularPacienteCita
        {
            get
            {
                return _celularPacienteCita;
            }

            set
            {
                _celularPacienteCita = value;
            }
        }

        public string EmailPacienteCita
        {
            get
            {
                return _emailPacienteCita;
            }

            set
            {
                _emailPacienteCita = value;
            }
        }

        public int EstatusCitaID
        {
            get
            {
                return _estatusCitaID;
            }

            set
            {
                _estatusCitaID = value;
            }
        }
        public int CitaMotivoID
        {
            get
            {
                return _citaMotivoID;
            }

            set
            {
                _citaMotivoID = value;
            }
        }
        public int CitaID
        {
            get
            {
                return _citaID;
            }

            set
            {
                _citaID = value;
            }
        }
        public string DescripcionPadecimiento
        {
            get
            {
                return _descripcionPadecimiento;
            }

            set
            {
                _descripcionPadecimiento = value;
            }
        }
        public int OrdenDeLLegada
        {
            get
            {
                return _ordenLlegada;
            }

            set
            {
                _ordenLlegada = value;
            }
        }
    }
}
