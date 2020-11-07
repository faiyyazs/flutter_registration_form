class BaseState<T> {
  final String message;
  final bool isSuccess;
  final T data;

  BaseState({
    this.message: "",
    this.isSuccess: false,
    this.data,
  });
}
