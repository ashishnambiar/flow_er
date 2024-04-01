import 'package:flow_er/Domain/Node/DataNodeModel/data_node_model.dart';
import 'package:flutter/material.dart';

class DataNodeWidget extends StatefulWidget {
  final DataNode node;
  final int i;
  const DataNodeWidget({
    required this.node,
    this.i = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<DataNodeWidget> createState() => _DataNodeWidgetState();
}

class _DataNodeWidgetState extends State<DataNodeWidget> {
  bool isOpen = true;

  void toggleOpen() => setState(() {
        isOpen = !isOpen;
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: isOpen || widget.node.valueType == ValueType.leaf
          ? IgnorePointer(
              ignoring: widget.node.valueType == ValueType.leaf,
              child: InkWell(
                onTap: () {
                  toggleOpen();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.node.valueType != ValueType.leaf)
                      const Icon(Icons.arrow_drop_down),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ...switch (widget.node.valueType) {
                            ValueType.map || ValueType.list => [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      widget.node.key ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${widget.node.valueType == ValueType.map ? '{ }' : '[ ]'} ${widget.node.value.length.toString()} ${widget.node.valueType == ValueType.map ? 'keys' : 'items'}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                ...List.generate(
                                  widget.node.value.length,
                                  (index) => Container(
                                    padding: const EdgeInsets.only(left: 4),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                    child: DataNodeWidget(
                                        node: widget.node.value[index],
                                        i: widget.i + 1),
                                  ),
                                ),
                              ],
                            ValueType.leaf => [
                                Text(
                                    '${widget.node.key ?? ''}: ${widget.node.value.toString()}'),
                              ],
                          }
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : InkWell(
              onTap: () {
                toggleOpen();
              },
              child: Container(
                color: Colors.amber.withOpacity(.3),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_right),
                    Text(
                      '${widget.node.key}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${widget.node.valueType == ValueType.map ? '{ }' : '[ ]'} ${widget.node.value.length.toString()} ${widget.node.valueType == ValueType.map ? 'keys' : 'items'}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
