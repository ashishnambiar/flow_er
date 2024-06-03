import 'package:flow_er/Core/Constants/headers_map.dart';
import 'package:flow_er/Utils/ApiService/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NetworkDataView extends ConsumerStatefulWidget {
  const NetworkDataView({super.key});

  @override
  ConsumerState<NetworkDataView> createState() => _NetworkDataViewState();
}

class _NetworkDataViewState extends ConsumerState<NetworkDataView> {
  final baseUrl =
      TextEditingController(text: 'https://api-staging.youthoppia.com/');

  final path = TextEditingController(text: '/v1/serverResponse');

  final method = TextEditingController(text: 'GET');

  final data = TextEditingController();

  final headers = <MapEntry<TextEditingController, TextEditingController>>[];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      child: Autocomplete<String>(
                        optionsBuilder: (val) {
                          final s = <String>{};
                          for (var e in headersMap.entries) {
                            if (e.key
                                    .toLowerCase()
                                    .contains(val.text.toLowerCase()) ||
                                e.value
                                    .toLowerCase()
                                    .contains(val.text.toLowerCase())) {
                              s.add(e.value);
                            }
                          }
                          return s.toList();
                        },
                        fieldViewBuilder: (context, textEditingController,
                            focusNode, onFieldSubmitted) {
                          return TextField(
                            controller: textEditingController,
                            focusNode: focusNode,
                            onSubmitted: (value) {
                              onFieldSubmitted();
                              headers[index].key.text =
                                  textEditingController.text;
                              focusNode.requestFocus();
                              focusNode.nextFocus();
                            },
                            onChanged: (value) {
                              headers[index].key.text =
                                  textEditingController.text;
                            },
                            decoration: const InputDecoration(
                              label: Text('key'),
                            ),
                          );
                        },
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
                        TextEditingController(),
                        TextEditingController(),
                      ),
                    );
                  });
                },
                child: const Text('Add Header'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () async {
              final h = <String, dynamic>{};
              for (var e in headers) {
                h.addAll({e.key.text: e.value.text});
              }

              final (response, error) = await ApiService.call(
                baseUrl: baseUrl.text,
                path: path.text,
                method: method.text,
                data: data.text,
                headers: h,
              );
              print('RESPONSE: $response');
              print('ERROR: $error');
            },
            child: const Text('Call API'),
          ),
        ],
      ),
    );
  }
}
