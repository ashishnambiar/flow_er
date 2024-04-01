import 'package:flow_er/Domain/Node/data_node.dart';

class NodeController {
  DataNode? nodeThing;

  static DataNode start(dynamic v, [int i = -1]) {
    final result = <DataNode>[];
    result.addAll(loop(v));
    return DataNode(
      key: 'data',
      value: result,
      valueType: ValueType.map,
    );
  }

  static List<DataNode> loop(dynamic v) {
    final result = <DataNode>[];
    try {
      for (var e in v.entries) {
        final val = loop(e.value);
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
          final val = loop(li);
          result.add(
            DataNode(
              key: i.toString(),
              value: val.isNotEmpty ? val : li,
              valueType: li.runtimeType == List
                  ? ValueType.list
                  : val.isNotEmpty
                      ? ValueType.map
                      : ValueType.leaf,

              // val.isNotEmpty ? ValueType.list : ValueType.leaf,
            ),
          );
        }
      }
    }
    return result;
  }
}
