import 'package:equatable/equatable.dart';
import 'package:flow_er/Domain/Node/DataNodeModel/data_node_model.dart';

enum Progress {
  initial,
  loading,
  loaded,
  error,
}

final class NetworkState extends Equatable {
  final DataNode? dataNode;
  final String baseUrl;
  final String path;
  final Progress progress;
  final Map<String, String> headers;
  final Map<String, dynamic> data;

  const NetworkState({
    required this.dataNode,
    required this.baseUrl,
    required this.path,
    this.progress = Progress.initial,
    this.headers = const {},
    this.data = const {},
  });

  NetworkState copyWith({
    DataNode? dataNode,
    String? baseUrl,
    String? path,
    Progress? progress,
    Map<String, String>? headers,
    Map<String, dynamic>? data,
  }) =>
      NetworkState(
        dataNode: dataNode ?? this.dataNode,
        baseUrl: baseUrl ?? this.baseUrl,
        path: path ?? this.path,
        data: data ?? this.data,
        progress: progress ?? this.progress,
        headers: headers ?? this.headers,
      );

  @override
  List<Object?> get props => [dataNode];
}
