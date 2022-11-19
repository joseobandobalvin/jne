class PartialPosition {
  final int? idHvCargoPartidario,
      itemCargoPartidario,
      idOrgPolCargoPartidario,
      idHojaVida,
      idEstado;
  final String? tengoCargoPartidario,
      orgPolCargoPartidario,
      cargoPartidario,
      anioCargoPartiDesde,
      anioCargoPartiHasta,
      estado,
      txComentario;

  PartialPosition({
    this.idHvCargoPartidario,
    this.itemCargoPartidario,
    this.idOrgPolCargoPartidario,
    this.idHojaVida,
    this.idEstado,
    this.tengoCargoPartidario,
    this.orgPolCargoPartidario,
    this.cargoPartidario,
    this.anioCargoPartiDesde,
    this.anioCargoPartiHasta,
    this.estado,
    this.txComentario,
  });

  factory PartialPosition.fromJson(Map<String, dynamic> json) {
    return PartialPosition(
      idHvCargoPartidario: json['idHvCargoPartidario'],
      itemCargoPartidario: json['itemCargoPartidario'],
      idOrgPolCargoPartidario: json['idOrgPolCargoPartidario'],
      idHojaVida: json['idHojaVida'],
      idEstado: json['idEstado'],
      tengoCargoPartidario: json['tengoCargoPartidario'],
      orgPolCargoPartidario: json['orgPolCargoPartidario'],
      cargoPartidario: json['cargoPartidario'],
      anioCargoPartiDesde: json['anioCargoPartiDesde'],
      anioCargoPartiHasta: json['anioCargoPartiHasta'],
      estado: json['estado'],
      txComentario: json['txComentario'],
    );
  }
}
