class ApiResponse<T> {
  final AuthResponseState state;
  final String message;
  final T? data;

  ApiResponse.success(this.data) : state = AuthResponseState.success, message = '';
  ApiResponse.error(this.message) : state = AuthResponseState.error, data = null;
  ApiResponse.loading() : state = AuthResponseState.loading, message = '', data = null;
}

enum AuthResponseState { loading, success, error }
