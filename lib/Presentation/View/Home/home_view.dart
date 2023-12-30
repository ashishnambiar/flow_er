import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flow_er/Domain/Node/data_node.dart';
import 'package:flutter/material.dart';

import '../../../Domain/Node/nodes_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final path = TextEditingController(text: 'pokemon/ditto');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: path,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {});
          },
          child: const Text('Call API'),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: FutureBuilder<Map<String, dynamic>>(
              future: call(path.text),
              builder: (context, snap) {
                switch (snap.connectionState) {
                  case ConnectionState.done:
                    if (snap.data != null) {
                      return DataNodeWidget(
                          node: NodeController.start(snap.data));
                    }
                    return const Text('Error Snap');
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.none:
                  case ConnectionState.active:
                    return const Text('Error');
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class DataNodeWidget extends StatefulWidget {
  final DataNode node;
  const DataNodeWidget({
    required this.node,
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
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
      ),
      child: isOpen || widget.node.valueType == ValueType.leaf
          ? InkWell(
              onTap: widget.node.valueType == ValueType.leaf
                  ? null
                  : () {
                      toggleOpen();
                    },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...switch (widget.node.valueType) {
                    ValueType.map || ValueType.list => [
                        Text(widget.node.key ?? ''),
                        ...List.generate(
                          widget.node.value.length,
                          (index) =>
                              DataNodeWidget(node: widget.node.value[index]),
                        )
                      ],
                    ValueType.leaf => [
                        Text(
                            '${widget.node.key ?? ''}: ${widget.node.value.toString()}'),
                      ],
                  }
                ],
              ),
            )
          : TextButton(
              onPressed: () {
                toggleOpen();
              },
              child: Text('Closed: ${widget.node.valueType}'),
            ),
    );
  }
}

Future<Map<String, dynamic>> call(String path) async {
  const baseUrl = 'https://pokeapi.co/api/v2/';

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
    ),
  );

  final repsonse = await dio.get(path);
  return repsonse.data;
}
