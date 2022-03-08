import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:admin_dashboard_poc/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    // required this.toClientScreen,
  }) : super(key: key);

  // final VoidCallback toClientScreen;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bem vindo a plataforma Admin da sua empresa',
            ),
            ElevatedButton(
              onPressed: () => context.go('/client'),
              child: const Text("Tela de informação do cliente")
            ),
          ],
        ),
      ),
    );
  }
}