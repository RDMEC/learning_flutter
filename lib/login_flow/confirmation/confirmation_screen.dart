import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:admin_dashboard_poc/login_flow/login_flow_controller.dart';


class ConfirmationScreen extends ConsumerWidget {
  ConfirmationScreen({Key? key,}) : super(key: key);

  var codeController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(loginFlowControllerProvider).isLoading ? 
      const Center(child: CircularProgressIndicator(),) :
      Scaffold(
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
              padding: const EdgeInsets.symmetric(horizontal: 250, vertical: 10),
              child: TextField(
                controller: codeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Código',
                  hintText: 'Código de confirmação'
                ),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  await ref.read(loginFlowControllerProvider.notifier).confirm(codeController.text);
                  if (ref.read(loginFlowControllerProvider.notifier).isLoggedIn()) context.go('/client');
                },
                child: const Text(
                  'Enviar',
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