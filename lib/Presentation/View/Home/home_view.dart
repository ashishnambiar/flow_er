import 'package:dio/dio.dart';
import 'package:flow_er/Domain/Node/node_functions.dart';
import 'package:flow_er/Presentation/Widgets/Home/data_node_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

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
                      return DataNodeWidget(node: start(snap.data));
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
