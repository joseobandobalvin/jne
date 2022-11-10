class Organization {
  final String txOrganizacionPolitica,
      txTipoEleccion,
      txJuradoElectoral,
      txRutaCompleto,
      txRutaResumen,
      txCodExpedienteExt,
      txEstadoLista,
      txUbigeo,
      txRegion;
  final String? txTipoPlan, txDistritoElectoral, txProvincia, txDistrito;
  final double idPlanGobierno;
  final int idOrganizacionPolitica,
      idTipoEleccion,
      idJuradoElectoral,
      idEstadoLista,
      nuCantidadCandidatos;

  Organization(
      {required this.txOrganizacionPolitica,
      required this.txTipoEleccion,
      required this.txJuradoElectoral,
      required this.txRutaCompleto,
      required this.txRutaResumen,
      required this.txCodExpedienteExt,
      required this.txEstadoLista,
      required this.txUbigeo,
      required this.txRegion,
      this.txTipoPlan,
      this.txDistritoElectoral,
      this.txProvincia,
      this.txDistrito,
      required this.idPlanGobierno,
      required this.idOrganizacionPolitica,
      required this.idTipoEleccion,
      required this.idJuradoElectoral,
      required this.idEstadoLista,
      required this.nuCantidadCandidatos});

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
        txOrganizacionPolitica: json['txOrganizacionPolitica'],
        txTipoEleccion: json['txTipoEleccion'],
        txJuradoElectoral: json['txJuradoElectoral'],
        txRutaCompleto: json['txRutaCompleto'],
        txRutaResumen: json['txRutaResumen'],
        txCodExpedienteExt: json['txCodExpedienteExt'],
        txEstadoLista: json['txEstadoLista'],
        txUbigeo: json['txUbigeo'],
        txRegion: json['txRegion'],
        txTipoPlan: json['txTipoPlan'],
        txDistritoElectoral: json['txDistritoElectoral'],
        txProvincia: json['txProvincia'],
        txDistrito: json['txDistrito'],
        idPlanGobierno: json['idPlanGobierno'],
        idOrganizacionPolitica: json['idOrganizacionPolitica'],
        idTipoEleccion: json['idTipoEleccion'],
        idJuradoElectoral: json['idJuradoElectoral'],
        idEstadoLista: json['idEstadoLista'],
        nuCantidadCandidatos: json['nuCantidadCandidatos']);
  }
}
