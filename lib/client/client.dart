import 'package:flutter/foundation.dart';

@immutable
class Client {
  final String name;
  final int cpf;
  final String dateOfBirth;
  final bool isPep;

  const Client({
    required this.name,
    required this.cpf,
    required this.dateOfBirth,
    required this.isPep,
  });

  const Client.initial()
      : name = '',
        cpf = 0,
        dateOfBirth = '',
        isPep = false;

  @override
  String toString() {
    return 'Client(name: $name, cpf: $cpf, dateOfBirth: $dateOfBirth, isPep: $isPep)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Client &&
        other.name == name &&
        other.cpf == cpf &&
        other.dateOfBirth == dateOfBirth &&
        other.isPep == isPep;
  }

  @override
  int get hashCode {
    return name.hashCode ^ cpf.hashCode ^ dateOfBirth.hashCode ^ isPep.hashCode;
  }
}