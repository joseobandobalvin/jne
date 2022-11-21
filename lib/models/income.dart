class Income {
  final int idHojaVida, idEstado, idHvIngresos;
  final String? anioIngresos, tengoIngresos, idTengoIngresos;

  final double? otroIngresoPrivado,
      otroIngresoPublico,
      remuBrutaPrivado,
      remuBrutaPublico,
      rentaIndividualPrivado,
      rentaIndividualPublico,
      totalIngresos;

  Income({
    required this.idHojaVida,
    required this.idEstado,
    required this.idHvIngresos,
    this.anioIngresos,
    this.tengoIngresos,
    this.idTengoIngresos,
    this.otroIngresoPrivado,
    this.otroIngresoPublico,
    this.remuBrutaPrivado,
    this.remuBrutaPublico,
    this.rentaIndividualPrivado,
    this.rentaIndividualPublico,
    this.totalIngresos,
  });

  factory Income.fromJson(Map<String, dynamic> json) {
    return Income(
      idHojaVida: json['idHojaVida'],
      idEstado: json['idEstado'],
      idHvIngresos: json['idHvIngresos'],
      anioIngresos: json['anioIngresos'],
      tengoIngresos: json['tengoIngresos'],
      idTengoIngresos: json['idTengoIngresos'],
      otroIngresoPrivado: json['otroIngresoPrivado'],
      otroIngresoPublico: json['otroIngresoPublico'],
      remuBrutaPrivado: json['remuBrutaPrivado'],
      remuBrutaPublico: json['remuBrutaPublico'],
      rentaIndividualPrivado: json['rentaIndividualPrivado'],
      rentaIndividualPublico: json['rentaIndividualPublico'],
      totalIngresos: json['totalIngresos'],
    );
  }
}
