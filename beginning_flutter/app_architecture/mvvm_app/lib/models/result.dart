//sealed classes allow a limited number of classes to extend it

sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends Result<T> {
  final Exception error;
  Failure(this.error);
}
