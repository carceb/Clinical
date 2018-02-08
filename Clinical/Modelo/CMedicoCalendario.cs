using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Clinical
{
    public class CMedicoCalendario
    {
        public CMedicoCalendario()
        {
        }

        public CMedicoCalendario(int _medicoConsultorioID, int _diaSemanaID, int _horaSemanaID, int _minutosSemanaID, int _tipoHoraSemanaID, bool _indicaHoraInicial)
        {
            this._medicoConsultorioID = _medicoConsultorioID;
            this._diaSemanaID = _diaSemanaID;
            this._horaSemanaID = _horaSemanaID;
            this._minutosSemanaID = _minutosSemanaID;
            this._tipoHoraSemanaID = _tipoHoraSemanaID;
            this._indicaHoraInicial = _indicaHoraInicial;
        }

        private int _medicoConsultorioID;
        private int _diaSemanaID;
        private int _horaSemanaID;
        private int _minutosSemanaID;
        private int _tipoHoraSemanaID;
        private bool _indicaHoraInicial;

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

        public int DiaSemanaID
        {
            get
            {
                return _diaSemanaID;
            }

            set
            {
                _diaSemanaID = value;
            }
        }

        public int HoraSemanaID
        {
            get
            {
                return _horaSemanaID;
            }

            set
            {
                _horaSemanaID = value;
            }
        }

        public int MinutosSemanaID
        {
            get
            {
                return _minutosSemanaID;
            }

            set
            {
                _minutosSemanaID = value;
            }
        }

        public int TipoHoraSemanaID
        {
            get
            {
                return _tipoHoraSemanaID;
            }

            set
            {
                _tipoHoraSemanaID = value;
            }
        }

        public bool IndicaHoraInicial
        {
            get
            {
                return _indicaHoraInicial;
            }

            set
            {
                _indicaHoraInicial = value;
            }
        }
    }
}