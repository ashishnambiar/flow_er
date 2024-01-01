import 'package:flow_er/Domain/Node/DataNodeModel/data_node_model.dart';

DataNode parseToDataNode(dynamic v, [int i = -1]) {
  final result = <DataNode>[];
  result.addAll(_loop(v));
  return DataNode(
    key: '{}',
    value: result,
    valueType: ValueType.map,
  );
}

List<DataNode> _loop(dynamic v) {
  final result = <DataNode>[];
  try {
    for (var e in v.entries) {
      final val = _loop(e.value);
      result.add(
        DataNode(
          key: e.key,
          value: val.isNotEmpty ? val : e.value,
          valueType: e.value.runtimeType == List
              ? ValueType.list
              : val.isNotEmpty
                  ? ValueType.map
                  : ValueType.leaf,
        ),
      );
    }
  } catch (e) {
    if (v.runtimeType == List) {
      for (var i = 0; i < v.length; i++) {
        final li = v[i];
        final val = _loop(li);
        result.add(
          DataNode(
            key: i.toString(),
            value: val.isNotEmpty ? val : li,
            valueType: li.runtimeType == List
                ? ValueType.list
                : val.isNotEmpty
                    ? ValueType.map
                    : ValueType.leaf,
          ),
        );
      }
    }
  }
  return result;
}
