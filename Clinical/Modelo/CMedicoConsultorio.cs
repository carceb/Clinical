using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Clinical
{
    public class CMedicoConsultorio
    {
        public CMedicoConsultorio()
        {

        }

        public CMedicoConsultorio(int _medicoConsultorioID, int _consultorioID, int _MedicoID, int _numeroMaximoCitas, int _formaPagoID)
        {
            this._medicoConsultorioID = _medicoConsultorioID;
            this._consultorioID = _consultorioID;
            this._MedicoID = _MedicoID;
            this._numeroMaximoCitas = _numeroMaximoCitas;
            this._formaPagoID = _formaPagoID;
        }

        private int _medicoConsultorioID;
        private int _consultorioID;
        private int _MedicoID;
        private int _numeroMaximoCitas;
        private int _formaPagoID;

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

        public int ConsultorioID
        {
            get
            {
                return _consultorioID;
            }

            set
            {
                _consultorioID = value;
            }
        }

        public int MedicoID
        {
            get
            {
                return _MedicoID;
            }

            set
            {
                _MedicoID = value;
            }
        }

        public int NumeroMaximoCitas
        {
            get
            {
                return _numeroMaximoCitas;
            }

            set
            {
                _numeroMaximoCitas = value;
            }
        }

        public int FormaPagoID
        {
            get
            {
                return _formaPagoID;
            }

            set
            {
                _formaPagoID = value;
            }
        }
    }
}