import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin_dashboard_poc/main.dart';

final loginRepositoryProvider = Provider<LoginRepository> ((ref){
  final dio = ref.watch(dioProvider);

  return AdminLoginRepository(dio: dio);
});

abstract class LoginRepository {
  Future<String> login(String email, String password);
  Future<String> confirm(String id, String confirmationToken);
}

class AdminLoginRepository extends LoginRepository {
  AdminLoginRepository({required this.dio});
  final Dio dio;

  @override
  Future<String> login(String email, String password) async {
    print('login function inside login_repository');
    final response = await dio.post(
      'manager/session',
      data: {
        'email': email,
        'password': password
      },
    );

    print("login response: ${response}");

    return response.data['data']['id'].toString();
  }

  @override
  Future<String> confirm(String id, String confirmationToken) async {
    print('confirm function inside login_repository');
    print('id ${id}');
    print('confirmationToken ${confirmationToken}');
    final response = await dio.post(
      'manager/user-confirmation',
      data: {
        'id': id,
        'confirmation_token': confirmationToken
      },
    );

    print("confirm response: ${response}");

    return response.data['data']['access_token'].toString();
  }

}