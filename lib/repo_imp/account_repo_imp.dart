import 'package:jne/models/user.dart';
import 'package:jne/providers/remote/account_provider.dart';
import 'package:jne/repo/account_repo.dart';

class AccountRepoImp implements AccountRepo {
  final AccountProvider _provider = AccountProvider();

  //AccountRepoImp(this._provider);

  @override
  Future<User?> get userInformation => _provider.userInformation;
}
