import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin_dashboard_poc/client/client_state.dart';


final clietControllerProvider = StateNotifierProvider.autoDispose<ClientController, ClientState>((ref) {
  return ClientController(
    ClientState(
      pageController: PageController(),
    ),
  );
});

class ClientController extends StateNotifier<ClientState> {
  ClientController(ClientState state): super(state);

  void updateClientName(String name) {
    state = state.copyWith(name: name);
  }
}