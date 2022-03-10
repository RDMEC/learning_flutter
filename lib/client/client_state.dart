import 'package:flutter/material.dart';


@immutable
class ClientState {
  final PageController pageController;
  final String name;
  final int cpf;
  final String dateOfBirth;
  final bool isPep;

  const ClientState({
    required this.pageController,
    this.name = "Fulano",
    this.cpf = 99999999999,
    this.dateOfBirth = "01/04/1971",
    this.isPep = false,
  });

  ClientState copyWith({
    PageController? pageController,
    String? name,
    int? cpf,
    String? dateOfBirth,
    bool? isPep,
  }) {
    return ClientState(
      pageController: pageController ?? this.pageController,
      name: name ?? this.name,
      cpf: cpf ?? this.cpf,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      isPep: isPep ?? this.isPep,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClientState &&
        other.pageController == pageController &&
        other.name == name &&
        other.cpf == cpf &&
        other.dateOfBirth == dateOfBirth &&
        other.isPep == isPep;
  }

  @override
  int get hashCode {
    return pageController.hashCode ^ name.hashCode ^ cpf.hashCode ^ dateOfBirth.hashCode ^ isPep.hashCode;
  }
}