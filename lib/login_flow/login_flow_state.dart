import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';


@immutable
class LoginState {
  final PageController pageController;
  final String? email;
  final String? id;
  final String? confirmationToken;
  final String? accessToken;
  bool isLoading;
  bool isLoggedIn;
  bool unauthorized;

  LoginState({
    required this.pageController,
    this.email,
    this.id,
    this.confirmationToken,
    this.accessToken,
    this.isLoading = false,
    this.isLoggedIn = false,
    this.unauthorized = false,
  });

  LoginState copyWith({
    PageController? pageController,
    String? email,
    String? id,
    String? confirmationToken,
    String? accessToken,
    bool? isLoading,
    bool? isLoggedIn,
    bool? unauthorized,
  }) {
    return LoginState(
      pageController: pageController ?? this.pageController,
      email: email ?? this.email,
      id: id ?? this.id,
      confirmationToken: confirmationToken ?? this.confirmationToken,
      accessToken: accessToken ?? this.accessToken,
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      unauthorized: unauthorized ?? this.unauthorized,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginState &&
        other.pageController == pageController &&
        other.email == email &&
        other.id == id &&
        other.confirmationToken == confirmationToken &&
        other.accessToken == accessToken;
  }

  @override
  int get hashCode {
    return pageController.hashCode ^
      email.hashCode ^
      id.hashCode ^
      confirmationToken.hashCode ^
      accessToken.hashCode;
  }
}