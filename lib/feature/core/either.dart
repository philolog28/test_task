


import '../domain/entities/error/failures.dart';

class Either<T> {
  const Either._(this.data, this.error, this.success);

  const Either.success(T data) : this._(data, null, true);

  const Either.error(Failure error) : this._(null, error, false);

  final T? data;
  final Failure? error;
  final bool success;

  void when({
    required void Function(T? data) success,
    required void Function(Failure error) error,
  }) {
    if (this.success) {
      return success(data);
    } else {
      return error(this.error!);
    }
  }
}
