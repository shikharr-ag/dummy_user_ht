import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String _prefix;
  final String message;

  const Failure({required String prefix, required this.message})
      : _prefix = prefix;

  @override
  List<Object?> get props => [_prefix, message];

  @override
  String toString() {
    return '$_prefix-$message';
  }
}

class ServerFailure extends Failure {
  const ServerFailure(
      {prefix = 'Server Failure', message = 'Some Server Error Occured :('})
      : super(
            prefix: 'Server Failure', message: 'Some Server Error Occured :(');
}
