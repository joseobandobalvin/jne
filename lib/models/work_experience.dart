class WorkExperience {
  final int idEstado, itemExpeLaboral, idHvExpeLaboral;
  final int idHojaVida;

  final String? tengoExpeLaboral,
      centroTrabajo,
      ocupacionProfesion,
      rucTrabajo,
      direccionTrabajo,
      anioTrabajoDesde,
      anioTrabajoHasta,
      ubigeoTrabajo,
      trabajoPais,
      trabajoDepartamento,
      trabajoProvincia,
      trabajoDistrito,
      estado,
      txComentario;

  WorkExperience({
    required this.idEstado,
    required this.itemExpeLaboral,
    required this.idHvExpeLaboral,
    required this.idHojaVida,
    this.tengoExpeLaboral,
    this.centroTrabajo,
    this.ocupacionProfesion,
    this.rucTrabajo,
    this.direccionTrabajo,
    this.anioTrabajoDesde,
    this.anioTrabajoHasta,
    this.ubigeoTrabajo,
    this.trabajoPais,
    this.trabajoDepartamento,
    this.trabajoProvincia,
    this.trabajoDistrito,
    this.estado,
    this.txComentario,
  });

  factory WorkExperience.fromJson(Map<String, dynamic> json) {
    return WorkExperience(
      idEstado: json['idEstado'],
      itemExpeLaboral: json['itemExpeLaboral'],
      idHvExpeLaboral: json['idHvExpeLaboral'],
      idHojaVida: json['idHojaVida'],
      tengoExpeLaboral: json['tengoExpeLaboral'],
      centroTrabajo: json['centroTrabajo'],
      ocupacionProfesion: json['ocupacionProfesion'],
      rucTrabajo: json['rucTrabajo'],
      direccionTrabajo: json['direccionTrabajo'],
      anioTrabajoDesde: json['anioTrabajoDesde'],
      anioTrabajoHasta: json['anioTrabajoHasta'],
      ubigeoTrabajo: json['ubigeoTrabajo'],
      trabajoPais: json['trabajoPais'],
      trabajoDepartamento: json['trabajoDepartamento'],
      trabajoProvincia: json['trabajoProvincia'],
      trabajoDistrito: json['trabajoDistrito'],
      estado: json['estado'],
      txComentario: json['txComentario'],
    );
  }
}
