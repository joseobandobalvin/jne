import 'package:get/get.dart';
import 'package:jne/models/organization.dart';
import 'package:jne/providers/remote/organization_provider.dart';

class OrganizationController extends GetxController {
  final OrganizationProvider _orgProvider = OrganizationProvider();

  Future<List<Organization>> getListByDepartmentAndOrganization() async {
    final res = await _orgProvider.getListByDepartmentAndOrganization();
    List<Organization> organizations = [];

    //print(res);

    if (res != null) {
      final lista = List.from(res['data']);
      for (var e in lista) {
        final Organization user = Organization.fromJson(e);
        organizations.add(user);
      }
      return organizations;
    }

    return organizations;
  }
}
