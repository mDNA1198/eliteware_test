class ApiException implements Exception {
  final int status;
  final String message;

  const ApiException({
    required this.status,
    required this.message,
  });

  ApiException.fromJson(Map<String, dynamic> json)
      : status = json['status'] ?? 0,
        message = json['message'] ?? 'unknown error occurred';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiException &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          message == other.message;

  @override
  int get hashCode => status.hashCode ^ message.hashCode;

  @override
  String toString() {
    // return 'ApiException{status: $status, message: $message}';
    return message;
  }
}
