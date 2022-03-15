import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin_dashboard_poc/login_flow/login_flow_state.dart';
import 'package:admin_dashboard_poc/login_flow/login_flow_service.dart';


final loginFlowControllerProvider = StateNotifierProvider.autoDispose<LoginFlowController, LoginState>((ref) {
  return LoginFlowController(
    LoginState(
      pageController: PageController(),
    ),
    ref.watch(loginServiceProvider),
  );
});

class LoginFlowController extends StateNotifier<LoginState> {
  LoginFlowController(
    LoginState state,
    this._loginService,
  ): super(state);

  final LoginService _loginService;

  Future<void> login(String email, String password) async {
    state = state.copyWith(email: email, isLoading: true);

    String id = await _loginService.login(email, password);
    
    await state.pageController.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
    state = state.copyWith(id: id, isLoading: false);
  }

  Future<void> confirm(String confirmationToken) async {
    state = state.copyWith(confirmationToken: confirmationToken, isLoading: true);
    String accessToken = await _loginService.confirm(state.id!, confirmationToken);
    state = state.copyWith(accessToken: accessToken, isLoading: false, isLoggedIn: true);
  }

  bool isLoggedIn() {
    return state.isLoggedIn;
  }
}