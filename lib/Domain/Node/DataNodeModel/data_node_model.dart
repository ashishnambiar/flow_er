import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_node_model.freezed.dart';

enum ValueType {
  map,
  list,
  leaf,
}

@freezed
class DataNode with _$DataNode {
  const factory DataNode({
    required String? key,
    required ValueType valueType,
    required dynamic value,
  }) = _DataNode;
}
