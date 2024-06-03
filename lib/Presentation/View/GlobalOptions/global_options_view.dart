import 'package:flow_er/Presentation/View/GlobalOptions/add_options_view.dart';
import 'package:flow_er/Presentation/View/GlobalOptions/show_global_options_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalOptionsView extends ConsumerStatefulWidget {
  const GlobalOptionsView({super.key});

  @override
  ConsumerState<GlobalOptionsView> createState() => _GlobalOptionsViewState();
}

class _GlobalOptionsViewState extends ConsumerState<GlobalOptionsView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AddGlobalOptionsView(),
        ),
        Container(
          margin: const EdgeInsets.all(6),
          width: 5,
          color: Theme.of(context).colorScheme.primary.withOpacity(.1),
        ),
        Expanded(
          child: ShowGlobalOptionsView(),
        ),
      ],
    );
  }
}
