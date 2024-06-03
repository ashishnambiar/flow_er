import 'package:flow_er/Presentation/View/Home/network_data_view.dart';
import 'package:flow_er/Presentation/View/Home/response_view.dart';
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
    return Column(
      children: [
        // TODO: add list of tab on top.
        // TODO: It is also possible to have it as a
        // list on the left side, or as drop down

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

        const Divider(),

        //
        Expanded(
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: NetworkDataView(),
              ),
              Container(
                margin: const EdgeInsets.all(6),
                width: 5,
                color: Theme.of(context).colorScheme.primary.withOpacity(.1),
              ),
              const Expanded(
                flex: 3,
                child: ResponseView(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
