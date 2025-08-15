class ApiResult<T> {
  final T? data;
  final Exception? error;

  ApiResult._({this.data, this.error});

  factory ApiResult.success(T data) => ApiResult._(data: data);

  factory ApiResult.failure(Exception error) => ApiResult._(error: error);

  bool get isSuccess => data != null;

  R fold<R>(R Function(Exception error) onFailure, R Function(T data) onSuccess) {
    if (data != null) {
      return onSuccess(data as T);
    } else {
      return onFailure(error ?? Exception("Unknown error"));
    }
  }
}
