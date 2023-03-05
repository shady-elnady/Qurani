import 'package:equatable/equatable.dart';

import '../Utils/Strings/messages.dart';

abstract class Failure extends Equatable {
  final String? message;
  final int? statusCode;

  const Failure({
    this.message,
    this.statusCode,
  });

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure({
    super.message,
    super.statusCode,
  });
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({
    required super.message,
    super.statusCode,
  });
}

class OfflineFailure extends Failure {
  const OfflineFailure({
    super.message,
    super.statusCode,
  });
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({
    super.message,
    super.statusCode,
  });
}

class LogFailure extends Failure {
  const LogFailure({
    super.message,
    super.statusCode,
  });
}

class EmptyCacheTokenFailure extends LogFailure {
  const EmptyCacheTokenFailure({
    super.message,
    super.statusCode,
  });
}

@override
class FailureToMessage {
  static String call({
    required Failure failure,
  }) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Meassages.serverFailure;
      case EmptyCacheFailure:
        return Meassages.emptyCacheData;
      case OfflineFailure:
        return Meassages.offLineConnection;
      case EmptyCacheTokenFailure:
        return Meassages.emptyCacheToken;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
