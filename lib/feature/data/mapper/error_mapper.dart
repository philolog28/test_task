
import '../../domain/entities/error/failures.dart';

class ErrorMapper {
  Failure map(Exception exception) {
    String? message;
    return ServerFailure(
      message: message ?? exception.toString(),
    );
  }
}