class TechnicalEducation {
  final int idHvEduTecnico, idHojaVida, idEstado;
  final String? tengoEduTecnico,
      cenEstudioTecnico,
      carreraTecnico,
      concluidoEduTecnico,
      txComentario,
      estado;

  TechnicalEducation({
    required this.idHvEduTecnico,
    required this.idHojaVida,
    required this.idEstado,
    this.tengoEduTecnico,
    this.cenEstudioTecnico,
    this.carreraTecnico,
    this.concluidoEduTecnico,
    this.txComentario,
    this.estado,
  });

  factory TechnicalEducation.fromJson(Map<String, dynamic> json) {
    return TechnicalEducation(
      idHvEduTecnico: json['idHvEduTecnico'],
      idHojaVida: json['idHojaVida'],
      idEstado: json['idEstado'],
      tengoEduTecnico: json['tengoEduTecnico'],
      cenEstudioTecnico: json['cenEstudioTecnico'],
      carreraTecnico: json['carreraTecnico'],
      concluidoEduTecnico: json['concluidoEduTecnico'],
      txComentario: json['txComentario'],
      estado: json['estado'],
    );
  }
}
