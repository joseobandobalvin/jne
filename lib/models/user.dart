class User {
  final String estado,
      nombreCompleto,
      organizacionPolitica,
      postulaDepartamento,
      postulaDistrito,
      postulaProvincia,
      rutaArchivo;
  final int idHojaVida,
      idOrganizacionPolitica,
      numeroCandidato,
      numeroDocumento;
  final int rowNumber;

  User({
    required this.estado,
    required this.nombreCompleto,
    required this.organizacionPolitica,
    required this.postulaDepartamento,
    required this.postulaDistrito,
    required this.postulaProvincia,
    required this.rutaArchivo,
    required this.idHojaVida,
    required this.idOrganizacionPolitica,
    required this.numeroCandidato,
    required this.numeroDocumento,
    required this.rowNumber,
  });
}
