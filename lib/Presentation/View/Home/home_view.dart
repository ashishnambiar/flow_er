import 'dart:io';

import 'package:flow_er/Domain/Provider/NetworkProvider/network_provider.dart';
import 'package:flow_er/Domain/Provider/NetworkProvider/network_state.dart';
import 'package:flow_er/Presentation/Widgets/Home/data_node_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: [
        //       ...List.generate(
        //         100,
        //         (index) => Padding(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        //           child: ElevatedButton(
        //             onPressed: () {},
        //             child: Padding(
        //               padding: const EdgeInsets.all(8),
        //               child: Text('index: $index'),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Divider(),
        Expanded(
          child: ApiTabView(),
        ),
      ],
    );
  }
}

class ApiTabView extends ConsumerStatefulWidget {
  const ApiTabView({Key? key}) : super(key: key);

  @override
  ConsumerState<ApiTabView> createState() => _ApiTabViewState();
}

class _ApiTabViewState extends ConsumerState<ApiTabView> {
  final baseUrl =
      TextEditingController(text: 'https://api-staging.youthoppia.com/');

  final path = TextEditingController(text: '/v1/serverResponse');

  final method = TextEditingController(text: 'GET');

  final data = TextEditingController();

  final headers = <MapEntry<TextEditingController, TextEditingController>>[];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: baseUrl,
                  decoration: const InputDecoration(
                    label: Text('Base URL'),
                  ),
                ),
                TextField(
                  controller: path,
                  decoration: const InputDecoration(
                    label: Text('Path'),
                  ),
                ),
                TextField(
                  controller: method,
                  decoration: const InputDecoration(
                    label: Text('Method (GET, POST, PUT, etc...)'),
                  ),
                ),
                TextField(
                  controller: data,
                  decoration: const InputDecoration(
                    label: Text('Data (JSON/Map format)'),
                  ),
                  maxLines: 5,
                ),
                Column(
                  children: [
                    ...List.generate(
                      headers.length,
                      (index) => Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: headers[index].key,
                              decoration: const InputDecoration(
                                label: Text('key'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(':',
                                style: Theme.of(context).textTheme.titleLarge),
                          ),
                          Expanded(
                            child: TextField(
                              controller: headers[index].value,
                              decoration: const InputDecoration(
                                label: Text('value'),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                headers.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.remove),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          headers.add(
                            MapEntry(
                                TextEditingController(
                                    text: HttpHeaders.contentTypeHeader),
                                TextEditingController(
                                    text: 'application/json')),
                          );
                        });
                      },
                      child: const Text('Add Header'),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    final h = <String, dynamic>{};
                    for (var e in headers) {
                      h.addAll({e.key.text: e.value.text});
                    }

                    ref.read(networkProvider.notifier).call(
                          baseUrl: baseUrl.text,
                          path: path.text,
                          method: method.text,
                          data: data.text,
                          headers: h,
                        );
                  },
                  child: const Text('Call API'),
                ),
              ],
            ),
          ),
        ),
        Builder(builder: (context) {
          return Container(
            margin: const EdgeInsets.all(6),
            width: 5,
            color: Theme.of(context).colorScheme.primary.withOpacity(.1),
          );
        }),
        Flexible(
          flex: 2,
          child: SingleChildScrollView(
            child: Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(networkProvider);
                switch (state.progress) {
                  case Progress.error:
                    return const Text('Error');
                  case Progress.initial:
                    return Container();
                  case Progress.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Progress.loaded:
                    if (state.dataNode == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return DataNodeWidget(node: state.dataNode!);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
