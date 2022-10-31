import 'package:jne/helpers/http.dart';
import 'package:jne/helpers/http_method.dart';

class UserProvider {
  final Http _http = Http();

  Future getAllCandidates() async {
    try {
      final response = await _http.request(
        '/candidato',
        method: HttpMethod.post,
        body: {
          'pageSize': 10,
          'skip': 1,
          'filter': {'idProcesoElectoral': 113, 'numeroDocumento': 'juan'}
        },
      );

      return response.data;
    } catch (e) {
      return null;
    }
  }
}
