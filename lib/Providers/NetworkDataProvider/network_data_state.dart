import 'package:equatable/equatable.dart';

class NetworkDataState extends Equatable {
  const NetworkDataState({
    this.baseUrls = const [],
    this.paths = const [],
    this.callGroups = const [],
  });
  final List<String> baseUrls;
  final List<String> paths;
  final List<CallGroup> callGroups;

  NetworkDataState copyWith({
    List<String>? baseUrls,
    List<String>? paths,
    List<CallGroup>? callGroups,
  }) =>
      NetworkDataState(
        baseUrls: baseUrls ?? this.baseUrls,
        paths: paths ?? this.paths,
        callGroups: callGroups ?? this.callGroups,
      );

  @override
  List<Object?> get props => [
        baseUrls,
        paths,
        callGroups,
      ];
}

final class CallGroup extends Equatable {
  final String baseUrl;
  final String path;
  final String method;
  final Map<String, dynamic> headers;
  final ApiState apiState;
  const CallGroup({
    required this.baseUrl,
    required this.path,
    required this.method,
    required this.headers,
    this.apiState = ApiState.idle,
  });

  CallGroup copyWith({
    String? baseUrl,
    String? path,
    String? method,
    Map<String, dynamic>? headers,
    ApiState? apiState,
  }) =>
      CallGroup(
        baseUrl: baseUrl ?? this.baseUrl,
        path: path ?? this.path,
        method: method ?? this.method,
        headers: headers ?? this.headers,
        apiState: apiState ?? this.apiState,
      );

  @override
  List<Object?> get props => [
        baseUrl,
        path,
        method,
        headers,
        apiState,
      ];
}

enum ApiState {
  idle,
  loading,
  success,
  error,
}
