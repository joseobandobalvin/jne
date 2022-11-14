class UniversityEducation {
  final int? idHvEduUniversitaria, idEstado;
  final String? tengoEduUniversitaria,
      itemEduUni,
      eduUniversitaria,
      universidad,
      carreraUni,
      concluidoEduUni,
      egresadoEduUni,
      bachillerEduUni,
      anioBachiller,
      tituloUni,
      anioTitulo,
      txComentario,
      estado;

  UniversityEducation({
    this.idHvEduUniversitaria,
    this.idEstado,
    this.tengoEduUniversitaria,
    this.itemEduUni,
    this.eduUniversitaria,
    this.universidad,
    this.carreraUni,
    this.concluidoEduUni,
    this.egresadoEduUni,
    this.bachillerEduUni,
    this.anioBachiller,
    this.tituloUni,
    this.anioTitulo,
    this.txComentario,
    this.estado,
  });

  factory UniversityEducation.fromJson(Map<String, dynamic> json) {
    return UniversityEducation(
      idHvEduUniversitaria: json['idHvEduUniversitaria'],
      idEstado: json['idEstado'],
      tengoEduUniversitaria: json['tengoEduUniversitaria'],
      itemEduUni: json['itemEduUni'],
      eduUniversitaria: json['eduUniversitaria'],
      universidad: json['universidad'],
      carreraUni: json['carreraUni'],
      concluidoEduUni: json['concluidoEduUni'],
      egresadoEduUni: json['egresadoEduUni'],
      bachillerEduUni: json['bachillerEduUni'],
      anioBachiller: json['anioBachiller'],
      tituloUni: json['tituloUni'],
      anioTitulo: json['anioTitulo'],
      txComentario: json['txComentario'],
      estado: json['estado'],
    );
  }
}
