using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Clinical
{
    public class CConsultorio
    {
        public CConsultorio()
        {

        }

        public CConsultorio(int _consultorioID, string _nombreConsultorio, string _rif, int _ciudadID, string _telefonoConsultorio, string _emailConsultorio, string _direccionConsultorio)
        {
            this._consultorioID = _consultorioID;
            this._nombreConsultorio = _nombreConsultorio;
            this._rif = _rif;
            this._ciudadID = _ciudadID;
            this._telefonoConsultorio = _telefonoConsultorio;
            this._emailConsultorio = _emailConsultorio;
            this._direccionConsultorio = _direccionConsultorio;
        }

        private int _consultorioID;
        private string _nombreConsultorio;
        private string _rif;
        private string _direccionConsultorio;
        private int _ciudadID;
        private string _telefonoConsultorio;
        private string _emailConsultorio;

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

        public string NombreConsultorio
        {
            get
            {
                return _nombreConsultorio;
            }

            set
            {
                _nombreConsultorio = value;
            }
        }

        public string Rif
        {
            get
            {
                return _rif;
            }

            set
            {
                _rif = value;
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

        public string TelefonoConsultorio
        {
            get
            {
                return _telefonoConsultorio;
            }

            set
            {
                _telefonoConsultorio = value;
            }
        }

        public string EmailConsultorio
        {
            get
            {
                return _emailConsultorio;
            }

            set
            {
                _emailConsultorio = value;
            }
        }
        public string DireccionConsultorio
        {
            get
            {
                return _direccionConsultorio;
            }

            set
            {
                _direccionConsultorio = value;
            }
        }
    }
}