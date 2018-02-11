using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Clinical
{
    public class CPaciente
    {
        public CPaciente()
        {

        }

        public CPaciente(int _pacienteID, string _sexoPaciente, int _cedulaPaciente, string _fechaNacimientoPaciente, string _nombrePaciente, string _celularPaciente, int _ciudadID, string _direccionPaciente, int _aseguradoraID, int _tipoSangreID, int _peso)
        {
            this._pacienteID = _pacienteID;
            this._sexoPaciente = _sexoPaciente;
            this._cedulaPaciente = _cedulaPaciente;
            this._fechaNacimientoPaciente = _fechaNacimientoPaciente;
            this._nombrePaciente = _nombrePaciente;
            this._celularPaciente = _celularPaciente;
            this._ciudadID = _ciudadID;
            this._direccionPaciente = _direccionPaciente;
            this._aseguradoraID = _aseguradoraID;
            this._tipoSangreID = _tipoSangreID;
            this._peso = _peso;
        }

        private int _pacienteID;
        private string _sexoPaciente;
        private int _cedulaPaciente;
        private string _fechaNacimientoPaciente;
        private string _nombrePaciente;
        private string _celularPaciente;
        private int _ciudadID;
        private string _direccionPaciente;
        private int _aseguradoraID;
        private int _tipoSangreID;
        private int _peso;

        public int PacienteID
        {
            get
            {
                return _pacienteID;
            }

            set
            {
                _pacienteID = value;
            }
        }

        public string SexoPaciente
        {
            get
            {
                return _sexoPaciente;
            }

            set
            {
                _sexoPaciente = value;
            }
        }

        public int CedulaPaciente
        {
            get
            {
                return _cedulaPaciente;
            }

            set
            {
                _cedulaPaciente = value;
            }
        }

        public string FechaNacimientoPaciente
        {
            get
            {
                return _fechaNacimientoPaciente;
            }

            set
            {
                _fechaNacimientoPaciente = value;
            }
        }

        public string NombrePaciente
        {
            get
            {
                return _nombrePaciente;
            }

            set
            {
                _nombrePaciente = value;
            }
        }

        public string CelularPaciente
        {
            get
            {
                return _celularPaciente;
            }

            set
            {
                _celularPaciente = value;
            }
        }

        public int CiudadID
        {
            get
            {
                return _ciudadID;
            }

            set
            {
                _ciudadID = value;
            }
        }

        public string DireccionPaciente
        {
            get
            {
                return _direccionPaciente;
            }

            set
            {
                _direccionPaciente = value;
            }
        }

        public int AseguradoraID
        {
            get
            {
                return _aseguradoraID;
            }

            set
            {
                _aseguradoraID = value;
            }
        }

        public int TipoSangreID
        {
            get
            {
                return _tipoSangreID;
            }

            set
            {
                _tipoSangreID = value;
            }
        }

        public int Peso
        {
            get
            {
                return _peso;
            }

            set
            {
                _peso = value;
            }
        }
    }
}