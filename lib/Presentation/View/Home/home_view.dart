import 'package:flow_er/Presentation/View/Home/api_tab_view.dart';
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
        Divider(),
        Expanded(
          child: ApiTabView(),
        ),
      ],
    );
  }
}
