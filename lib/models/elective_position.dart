class ElectivePosition {
  final int? idHvcargoEleccion,
      itemCargoEleccion,
      idOrgPolCargoElec,
      idCargoEleccion,
      idHojaVida,
      idEstado;
  final String? tengoCargoEleccion,
      orgPolCargoElec,
      cargoEleccion,
      anioCargoElecDesde,
      anioCargoElecHasta,
      estado,
      txComentario;

  ElectivePosition({
    this.idHvcargoEleccion,
    this.itemCargoEleccion,
    this.idOrgPolCargoElec,
    this.idCargoEleccion,
    this.idHojaVida,
    this.idEstado,
    this.tengoCargoEleccion,
    this.orgPolCargoElec,
    this.cargoEleccion,
    this.anioCargoElecDesde,
    this.anioCargoElecHasta,
    this.estado,
    this.txComentario,
  });

  factory ElectivePosition.fromJson(Map<String, dynamic> json) {
    return ElectivePosition(
      idHvcargoEleccion: json['idHvcargoEleccion'],
      itemCargoEleccion: json['itemCargoEleccion'],
      idOrgPolCargoElec: json['idOrgPolCargoElec'],
      idCargoEleccion: json['idCargoEleccion'],
      idHojaVida: json['idHojaVida'],
      idEstado: json['idEstado'],
      tengoCargoEleccion: json['tengoCargoEleccion'],
      orgPolCargoElec: json['orgPolCargoElec'],
      cargoEleccion: json['cargoEleccion'],
      anioCargoElecDesde: json['anioCargoElecDesde'],
      anioCargoElecHasta: json['anioCargoElecHasta'],
      estado: json['estado'],
      txComentario: json['txComentario'],
    );
  }
}
