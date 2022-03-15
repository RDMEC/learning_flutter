import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin_dashboard_poc/login_flow/login_flow_controller.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key,}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(loginFlowControllerProvider).isLoading
      ? const Center(
        child: CircularProgressIndicator(),
      )
      : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                  width: 200,
                  height: 150,
                  child: Image.asset('asset/images/flutter-logo.png')
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 250, vertical: 10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Seu email de usuário',
                  errorText: ref.watch(loginFlowControllerProvider).unauthorized ?
                  'Dados de login inválidos' : null,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 250, vertical: 10),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                  hintText: 'Sua senha'
                ),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextButton(
                onPressed: () {
                  ref.read(loginFlowControllerProvider.notifier).login(
                    emailController.text, passwordController.text
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
