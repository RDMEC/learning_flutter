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
    try{
      final response = await dio.post(
        'manager/session',
        data: {
          'email': email,
          'password': password
        },
      );

      return response.data['data']['id'].toString();
    } catch(err) {
      return '';
    }
  }

  @override
  Future<String> confirm(String id, String confirmationToken) async {
    try {
      final response = await dio.post(
        'manager/user-confirmation',
        data: {
          'id': id,
          'confirmation_token': confirmationToken
        },
      );

      return response.data['data']['access_token'].toString();
    } catch (err) {
      return '';
    }
  }
}