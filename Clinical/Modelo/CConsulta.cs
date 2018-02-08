using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Clinical
{
    public class CConsulta
    {
        private int _pacienteConsultaID;
        private int _pacienteID;
        private string _fechaConsulta;
        private string _motivoConsulta;
        private int _medicoID;
        private string _descripcionTratamiento;
        private string _medicamentos;
        private string _descripcionEvolucionTratamiento;
        private int _estatusCitaID;

        public CConsulta()
        {

        }
        public CConsulta(int _pacienteConsultaID, int _pacienteID, string _fechaConsulta, string _motivoConsulta, int _medicoID, string _descripcionTratamiento, string _medicamentos, string _descripcionEvolucionTratamiento, int _estatusCitaID)
        {
            this._pacienteConsultaID = _pacienteConsultaID;
            this._pacienteID = _pacienteID;
            this._fechaConsulta = _fechaConsulta;
            this._motivoConsulta = _motivoConsulta;
            this._medicoID = _medicoID;
            this._descripcionTratamiento = _descripcionTratamiento;
            this._medicamentos = _medicamentos;
            this._descripcionEvolucionTratamiento = _descripcionEvolucionTratamiento;
            this._estatusCitaID = _estatusCitaID;
        }

        public int PacienteConsultaID
        {
            get
            {
                return _pacienteConsultaID;
            }

            set
            {
                _pacienteConsultaID = value;
            }
        }

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

        public string FechaConsulta
        {
            get
            {
                return _fechaConsulta;
            }

            set
            {
                _fechaConsulta = value;
            }
        }

        public string MotivoConsulta
        {
            get
            {
                return _motivoConsulta;
            }

            set
            {
                _motivoConsulta = value;
            }
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

        public string DescripcionTratamiento
        {
            get
            {
                return _descripcionTratamiento;
            }

            set
            {
                _descripcionTratamiento = value;
            }
        }

        public string Medicamentos
        {
            get
            {
                return _medicamentos;
            }

            set
            {
                _medicamentos = value;
            }
        }

        public string DescripcionEvolucionTratamiento
        {
            get
            {
                return _descripcionEvolucionTratamiento;
            }

            set
            {
                _descripcionEvolucionTratamiento = value;
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
    }
}