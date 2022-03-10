import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';


@immutable
class LoginState {
  final PageController pageController;
  final String? email;
  final String? password;
  final String? id;
  final String? confirmationToken;
  final String? accessToken;

  const LoginState({
    required this.pageController,
    this.email,
    this.password,
    this.id,
    this.confirmationToken,
    this.accessToken,
  });

  LoginState copyWith({
    PageController? pageController,
    String? email,
    String? password,
    String ? id,
    String ? confirmationToken,
    String ? accessToken,
  }) {
    return LoginState(
      pageController: pageController ?? this.pageController,
      email: email ?? this.email,
      password: password ?? this.password,
      id: id ?? this.id,
      confirmationToken: confirmationToken ?? this.confirmationToken,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginState &&
        other.pageController == pageController &&
        other.email == email &&
        other.password == password &&
        other.id == id &&
        other.confirmationToken == confirmationToken &&
        other.accessToken == accessToken;
  }

  @override
  int get hashCode {
    return pageController.hashCode ^
      email.hashCode ^
      password.hashCode ^
      id.hashCode ^
      confirmationToken.hashCode ^
      accessToken.hashCode;
  }
}