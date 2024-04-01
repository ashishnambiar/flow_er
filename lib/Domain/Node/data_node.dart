enum ValueType {
  map,
  list,
  leaf,
}

class DataNode {
  final String? key;
  final ValueType valueType;
  final dynamic value;

  const DataNode({
    required this.key,
    required this.value,
    required this.valueType,
  });

  @override
  String toString() =>
      ' DataNode{key:"$key", valueType=>"${valueType.name}", value=>"$value"} ';
}
