class Cv {
  final String estado,
      nombreCompleto,
      numeroDocumento,
      organizacionPolitica,
      rutaArchivo;
  final String? postulaDepartamento, postulaDistrito, postulaProvincia;
  final int rowNumber;
  final double idOrganizacionPolitica, numeroCandidato, idHojaVida;

  Cv({
    required this.estado,
    required this.nombreCompleto,
    required this.organizacionPolitica,
    this.postulaDepartamento,
    this.postulaDistrito,
    this.postulaProvincia,
    required this.rutaArchivo,
    required this.idHojaVida,
    required this.idOrganizacionPolitica,
    required this.numeroCandidato,
    required this.numeroDocumento,
    required this.rowNumber,
  });

  factory Cv.fromJson(Map<String, dynamic> json) {
    return Cv(
        estado: json['estado'],
        nombreCompleto: json['nombreCompleto'],
        organizacionPolitica: json['organizacionPolitica'],
        postulaDepartamento: json['postulaDepartamento'],
        postulaDistrito: json['postulaDistrito'],
        postulaProvincia: json['postulaProvincia'],
        rutaArchivo: json['rutaArchivo'],
        idHojaVida: json['idHojaVida'],
        idOrganizacionPolitica: json['idOrganizacionPolitica'],
        numeroCandidato: json['numeroCandidato'],
        numeroDocumento: json['numeroDocumento'],
        rowNumber: json['rowNumber']);
  }
}
