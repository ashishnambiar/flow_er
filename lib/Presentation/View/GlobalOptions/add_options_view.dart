
import 'package:flutter/material.dart';

class AddGlobalOptionsView extends StatefulWidget {
  const AddGlobalOptionsView({super.key});

  @override
  State<AddGlobalOptionsView> createState() => _AddGlobalOptionsViewState();
}

class _AddGlobalOptionsViewState extends State<AddGlobalOptionsView> {
  final _baseUrl = TextEditingController();
  final _path = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _baseUrl,
                decoration: const InputDecoration(
                  labelText: 'Add Base URL',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Add'),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _path,
                decoration: const InputDecoration(
                  labelText: 'Add Path',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Add'),
            ),
          ],
        ),
      ],
    );
  }
}
