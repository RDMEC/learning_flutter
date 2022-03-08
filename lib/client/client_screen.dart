import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:admin_dashboard_poc/client/client_controller.dart';

class ClientScreen extends  ConsumerWidget {
  ClientScreen({Key? key,}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var newNameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              const Text("Informações do Cliente:"),
              const Spacer(flex: 1),
              Text("Nome: ${ref.watch(clietControllerProvider).name}"),
              Text("CPF: ${ref.watch(clietControllerProvider).cpf}"),
              Text("Data de Nascimento: ${ref.watch(clietControllerProvider).dateOfBirth}"),
              Text("Pessoa politicamente exposta: ${ref.watch(clietControllerProvider).isPep}"),
              const Spacer(flex: 10),
              const Text("Atualize o nome do Cliente:"),
              const Spacer(flex: 1),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: newNameCtrl,
                      decoration: const InputDecoration(
                        hintText: 'Novo Nome do Cliente',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("Novo nome é ${newNameCtrl.text}");

                            ref.read(clietControllerProvider.notifier).updateClientName(newNameCtrl.text);
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}