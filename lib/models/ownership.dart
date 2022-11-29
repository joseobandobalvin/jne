class Ownership {
  final int idHojaVida,
      idEstado,
      idHVTitularidad,
      nuItemTitularidad,
      idParamTipoTitularidad;

  final double flValor, flCantidad;

  final String? tengoTitularidad,
      txComentario,
      txFechaRegistro,
      txPersonaJuridica,
      txRegistroManual,
      txTipoTitularidad,
      txUsuario;

  Ownership({
    required this.idHojaVida,
    required this.flValor,
    required this.flCantidad,
    required this.idEstado,
    required this.idHVTitularidad,
    required this.nuItemTitularidad,
    required this.idParamTipoTitularidad,
    this.tengoTitularidad,
    this.txComentario,
    this.txFechaRegistro,
    this.txPersonaJuridica,
    this.txRegistroManual,
    this.txTipoTitularidad,
    this.txUsuario,
  });

  factory Ownership.fromJson(Map<String, dynamic> json) {
    return Ownership(
      idHojaVida: json['idHojaVida'],
      flValor: json['flValor'],
      flCantidad: json['flCantidad'],
      idEstado: json['idEstado'],
      idHVTitularidad: json['idHVTitularidad'],
      nuItemTitularidad: json['nuItemTitularidad'],
      idParamTipoTitularidad: json['idParamTipoTitularidad'],
      tengoTitularidad: json['tengoTitularidad'],
      txComentario: json['txComentario'],
      txFechaRegistro: json['txFechaRegistro'],
      txPersonaJuridica: json['txPersonaJuridica'],
      txRegistroManual: json['txRegistroManual'],
      txTipoTitularidad: json['txTipoTitularidad'],
      txUsuario: json['txUsuario'],
    );
  }
}
