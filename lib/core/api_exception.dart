class ApiException implements Exception {
  final int code;
  final String message;

  const ApiException({
    required this.code,
    required this.message,
  });

  ApiException.fromJson(Map<String, dynamic> json)
      : code = json['code'] ?? 0,
        message = json['message'] ?? 'unknown error occurred';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiException &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          message == other.message;

  @override
  int get hashCode => code.hashCode ^ message.hashCode;

  @override
  String toString() {
    // return 'ApiException{status: $status, message: $message}';
    return message;
  }
}
