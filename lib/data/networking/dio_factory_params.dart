import 'package:flutter/foundation.dart';

class DioFactoryParams {
  final String hostUrl;
  final int timeout;
  final bool logNetworkRequest;
  final bool logNetworkRequestHeader;
  final bool logNetworkRequestBody;
  final bool logNetworkResponseHeader;
  final bool logNetworkResponseBody;
  final bool logNetworkError;
  final bool selfSignedCert;
  final bool enableLogs;

  const DioFactoryParams(
    this.hostUrl, {
    this.timeout = 60000,
    this.logNetworkRequest = true,
    this.logNetworkRequestHeader = true,
    this.logNetworkRequestBody = true,
    this.logNetworkResponseHeader = true,
    this.logNetworkResponseBody = true,
    this.logNetworkError = true,
    this.selfSignedCert = false,
    this.enableLogs = !kReleaseMode,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['host_url'] = hostUrl;
    data['timeout'] = timeout;
    data['log_network_request'] = logNetworkRequest;
    data['log_network_request_header'] = logNetworkRequestHeader;
    data['log_network_request_body'] = logNetworkRequestBody;
    data['log_network_response_header'] = logNetworkResponseHeader;
    data['log_network_response_body'] = logNetworkResponseBody;
    data['log_network_error'] = logNetworkError;
    data['self_signed_cert'] = selfSignedCert;
    data['enable_logs'] = enableLogs;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DioFactoryParams &&
          runtimeType == other.runtimeType &&
          hostUrl == other.hostUrl &&
          timeout == other.timeout &&
          logNetworkRequest == other.logNetworkRequest &&
          logNetworkRequestHeader == other.logNetworkRequestHeader &&
          logNetworkRequestBody == other.logNetworkRequestBody &&
          logNetworkResponseHeader == other.logNetworkResponseHeader &&
          logNetworkResponseBody == other.logNetworkResponseBody &&
          logNetworkError == other.logNetworkError &&
          selfSignedCert == other.selfSignedCert &&
          enableLogs == other.enableLogs;

  @override
  int get hashCode =>
      hostUrl.hashCode ^
      timeout.hashCode ^
      logNetworkRequest.hashCode ^
      logNetworkRequestHeader.hashCode ^
      logNetworkRequestBody.hashCode ^
      logNetworkResponseHeader.hashCode ^
      logNetworkResponseBody.hashCode ^
      logNetworkError.hashCode ^
      selfSignedCert.hashCode ^
      enableLogs.hashCode;

  @override
  String toString() {
    return 'DioFactoryParams{hostUrl: $hostUrl, timeout: $timeout, logNetworkRequest: $logNetworkRequest, logNetworkRequestHeader: $logNetworkRequestHeader, logNetworkRequestBody: $logNetworkRequestBody, logNetworkResponseHeader: $logNetworkResponseHeader, logNetworkResponseBody: $logNetworkResponseBody, logNetworkError: $logNetworkError, selfSignedCert: $selfSignedCert, enableLogs: $enableLogs}';
  }
}
