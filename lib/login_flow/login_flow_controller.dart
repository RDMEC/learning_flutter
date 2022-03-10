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

  void login(String email, String password) {
    state = state.copyWith(email: email);

    _loginService.login(email, password).then((String id) => {
      state = state.copyWith(id: id),
      state.pageController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic,
      ),
    });
  }

  void confirm(String confirmationToken) {
    state = state.copyWith(confirmationToken: confirmationToken);

    _loginService.confirm(state.id!, confirmationToken).then((String accessToken) => {
      state = state.copyWith(accessToken: accessToken),
      // Route to client page. How?
    });
  }
}