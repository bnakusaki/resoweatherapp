import 'package:equatable/equatable.dart';
import 'dart:convert';

abstract class Failure extends Equatable {
  final String? message;
  const Failure(this.message) : super();

  @override
  String toString() => _utf8convert(message!);

  static String _utf8convert(String text) {
    final bytes = text.codeUnits;
    return utf8.decode(bytes);
  }

  @override
  List<Object?> get props => [message];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}
