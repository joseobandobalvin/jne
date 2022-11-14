class BasicEducation {
  final int idHvEduBasica, idHojaVida, idEstado;
  final String? tengoEduBasica,
      eduPrimaria,
      concluidoEduPrimaria,
      eduSecundaria,
      concluidoEduSecundaria,
      estado;

  BasicEducation({
    required this.idHvEduBasica,
    required this.idHojaVida,
    required this.idEstado,
    this.tengoEduBasica,
    this.eduPrimaria,
    this.concluidoEduPrimaria,
    this.eduSecundaria,
    this.concluidoEduSecundaria,
    this.estado,
  });

  factory BasicEducation.fromJson(Map<String, dynamic> json) {
    return BasicEducation(
      idHvEduBasica: json['idHvEduBasica'],
      idHojaVida: json['idHojaVida'],
      idEstado: json['idEstado'],
      tengoEduBasica: json['tengoEduBasica'],
      eduPrimaria: json['eduPrimaria'],
      concluidoEduPrimaria: json['concluidoEduPrimaria'],
      eduSecundaria: json['eduSecundaria'],
      concluidoEduSecundaria: json['concluidoEduSecundaria'],
      estado: json['estado'],
    );
  }
}
