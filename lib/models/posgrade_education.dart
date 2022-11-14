class PosgradeEducation {
  final int? fgRegistroManual,
      idEstado,
      idHojaVida,
      idHvPosgrado,
      nuItemPosgrado;
  final String? concluidoPosgrado,
      egresadoPosgrado,
      esDoctor,
      esMaestro,
      fgRegistro,
      tengoPosgrado,
      txAnioPosgrado,
      txCenEstudioPosgrado,
      txEspecialidadPosgrado,
      txComentario,
      txEstado;

  PosgradeEducation({
    this.fgRegistroManual,
    this.idEstado,
    this.idHojaVida,
    this.idHvPosgrado,
    this.nuItemPosgrado,
    this.concluidoPosgrado,
    this.egresadoPosgrado,
    this.esDoctor,
    this.esMaestro,
    this.fgRegistro,
    this.tengoPosgrado,
    this.txAnioPosgrado,
    this.txCenEstudioPosgrado,
    this.txEspecialidadPosgrado,
    this.txComentario,
    this.txEstado,
  });

  factory PosgradeEducation.fromJson(Map<String, dynamic> json) {
    return PosgradeEducation(
      fgRegistroManual: json['fgRegistroManual'],
      idEstado: json['idEstado'],
      idHojaVida: json['idHojaVida'],
      idHvPosgrado: json['idHvPosgrado'],
      nuItemPosgrado: json['nuItemPosgrado'],
      concluidoPosgrado: json['concluidoPosgrado'],
      egresadoPosgrado: json['egresadoPosgrado'],
      esDoctor: json['esDoctor'],
      esMaestro: json['esMaestro'],
      fgRegistro: json['fgRegistro'],
      tengoPosgrado: json['tengoPosgrado'],
      txAnioPosgrado: json['txAnioPosgrado'],
      txCenEstudioPosgrado: json['txCenEstudioPosgrado'],
      txEspecialidadPosgrado: json['txEspecialidadPosgrado'],
      txComentario: json['txComentario'],
      txEstado: json['txEstado'],
    );
  }
}
