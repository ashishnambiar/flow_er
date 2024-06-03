import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResponseView extends ConsumerStatefulWidget {
  const ResponseView({super.key});

  @override
  ConsumerState<ResponseView> createState() => _ResponseViewState();
}

class _ResponseViewState extends ConsumerState<ResponseView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Response'),
    );
  }
}
