import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin_dashboard_poc/home/home.dart';
import 'package:admin_dashboard_poc/client/client_screen.dart';
import 'package:admin_dashboard_poc/unknown.dart';

void main() {
  runApp(const ProviderScope(child: AdminApp()));
}

class AdminApp extends StatefulWidget {
  const AdminApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AdminAppState();
}


class _AdminAppState extends State<AdminApp> {
  final _router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/client',
        builder: (context, state) => ClientScreen(),
      ),
    ],
    errorBuilder: (context, state) => const UnknownScreen(),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books App',
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
    );
  }
}
