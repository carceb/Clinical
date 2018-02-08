using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Clinical
{
    public class CMedicos
    {

        public CMedicos()
        {

        }
        private int _medicoID;
        private string _sexoMedico;
        private int _cedulaMedico;
        private string _nombreMedico;
        private string _rIFMedico;
        private string _MSAS;
        private string _colegioMedico;
        private int _especialidadMedicaID;
        private string _descripcionEspecialidad;
        private string _celularMedico;
        private string _emailMedico;

        public CMedicos(int _medicoID, string _sexoMedico, int _cedulaMedico, string _nombreMedico, string _rIFMedico, string _MSAS, string _colegioMedico, int _especialidadMedicaID, string _descripcionEspecialidad, string _celularMedico, string _emailMedico)
        {
            this._medicoID = _medicoID;
            this._sexoMedico = _sexoMedico;
            this._cedulaMedico = _cedulaMedico;
            this._nombreMedico = _nombreMedico;
            this._rIFMedico = _rIFMedico;
            this._MSAS = _MSAS;
            this._colegioMedico = _colegioMedico;
            this._especialidadMedicaID = _especialidadMedicaID;
            this._descripcionEspecialidad = _descripcionEspecialidad;
            this._celularMedico = _celularMedico;
            this._emailMedico = _emailMedico;
        }

        public int MedicoID
        {
            get
            {
                return _medicoID;
            }

            set
            {
                _medicoID = value;
            }
        }

        public string SexoMedico
        {
            get
            {
                return _sexoMedico;
            }

            set
            {
                _sexoMedico = value;
            }
        }

        public int CedulaMedico
        {
            get
            {
                return _cedulaMedico;
            }

            set
            {
                _cedulaMedico = value;
            }
        }

        public string NombreMedico
        {
            get
            {
                return _nombreMedico;
            }

            set
            {
                _nombreMedico = value;
            }
        }

        public string RIFMedico
        {
            get
            {
                return _rIFMedico;
            }

            set
            {
                _rIFMedico = value;
            }
        }

        public string MSAS
        {
            get
            {
                return _MSAS;
            }

            set
            {
                _MSAS = value;
            }
        }

        public string ColegioMedico
        {
            get
            {
                return _colegioMedico;
            }

            set
            {
                _colegioMedico = value;
            }
        }

        public int EspecialidadMedicaID
        {
            get
            {
                return _especialidadMedicaID;
            }

            set
            {
                _especialidadMedicaID = value;
            }
        }

        public string DescripcionEspecialidad
        {
            get
            {
                return _descripcionEspecialidad;
            }

            set
            {
                _descripcionEspecialidad = value;
            }
        }

        public string CelularMedico
        {
            get
            {
                return _celularMedico;
            }

            set
            {
                _celularMedico = value;
            }
        }

        public string EmailMedico
        {
            get
            {
                return _emailMedico;
            }

            set
            {
                _emailMedico = value;
            }
        }
    }
}