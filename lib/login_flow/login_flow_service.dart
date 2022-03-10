import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin_dashboard_poc/login_flow/login_flow_repository.dart';

final loginServiceProvider = Provider<LoginService>((ref) {
  final loginRepository = ref.watch(loginRepositoryProvider);
  return AdminLoginService(loginRepository);
});

abstract class LoginService {
  Future<String> login(String email, String password);
  Future<String> confirm(String id, String confirmationToken);
}

class AdminLoginService extends LoginService {
  AdminLoginService(this._adminLoginRepository);
  final LoginRepository _adminLoginRepository;

  @override
  Future<String> login(String email, String password) async {
    return await _adminLoginRepository.login(email, password);
  }

  @override
  Future<String> confirm(String id, String confirmationToken) async {
    return await _adminLoginRepository.confirm(id, confirmationToken);
  }
}