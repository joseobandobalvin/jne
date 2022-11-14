class GeneralData {
  final double? numeroCandidato;
  final String numeroDocumento,
      feNacimiento,
      nombres,
      apellidoPaterno,
      apellidoMaterno,
      sexo,
      paisNacimiento,
      naciDepartamento,
      naciProvincia,
      naciDistrito,
      domiDepartamento,
      domiProvincia,
      domiDistrito,
      domicilioDirecc;
  final String? txComentario;
  final List<String>? cargo;

  GeneralData({
    this.numeroCandidato,
    required this.numeroDocumento,
    required this.feNacimiento,
    required this.nombres,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.sexo,
    required this.paisNacimiento,
    required this.naciDepartamento,
    required this.naciProvincia,
    required this.naciDistrito,
    required this.domiDepartamento,
    required this.domiProvincia,
    required this.domiDistrito,
    required this.domicilioDirecc,
    this.txComentario,
    this.cargo,
  });

  factory GeneralData.fromJson(Map<String, dynamic> json) {
    var list = json['cargo'];
    List<String> cargoList = List<String>.from(list);

    return GeneralData(
      numeroCandidato: json['numeroCandidato'],
      numeroDocumento: json['numeroDocumento'],
      feNacimiento: json['feNacimiento'],
      nombres: json['nombres'],
      apellidoPaterno: json['apellidoPaterno'],
      apellidoMaterno: json['apellidoMaterno'],
      sexo: json['sexo'],
      paisNacimiento: json['paisNacimiento'],
      naciDepartamento: json['naciDepartamento'],
      naciProvincia: json['naciProvincia'],
      naciDistrito: json['naciDistrito'],
      domiDepartamento: json['domiDepartamento'],
      domiProvincia: json['domiProvincia'],
      domiDistrito: json['domiDistrito'],
      domicilioDirecc: json['domicilioDirecc'],
      txComentario: json['txComentario'],
      cargo: cargoList,
    );
  }
}
