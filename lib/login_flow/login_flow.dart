import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin_dashboard_poc/login_flow/login_flow_controller.dart';
import 'package:admin_dashboard_poc/login_flow/login/login_screen.dart';
import 'package:admin_dashboard_poc/login_flow/confirmation/confirmation_screen.dart';


class LoginFlow extends ConsumerWidget {
  const LoginFlow({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      controller: ref.watch(loginFlowControllerProvider).pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        LoginScreen(),
        ConfirmationScreen(),
      ],
    );
  }
}