import 'package:jne/helpers/http.dart';
import 'package:jne/helpers/http_method.dart';

class OrganizationProvider {
  final Http _http = Http();

  Future getListByDepartmentAndOrganization() async {
    try {
      final response = await _http.request(
        '/candidato/listas-regio-muni',
        method: HttpMethod.post,
        body: {
          "pageSize": 0,
          "skip": 0,
          "sortField": "",
          "sortDir": "",
          "filter": {
            "idProcesoElectoral": 113,
            "idTipoEleccion": 4,
            "idOrganizacionPolitica": 0,
            "idJuradoElectoral": 0,
            "txUbigeoDepartamento": "25",
            "txUbigeoProvincia": "00",
            "txUbigeoDistrito": "00"
          }
        },
      );
      //print(response.data);
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
