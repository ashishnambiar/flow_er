import 'package:flow_er/Presentation/View/Home/home_view.dart';
import 'package:flow_er/Utils/Router/router.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              router.goNamed(Routes.settings);
            },
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              router.goNamed(Routes.globalOptions);
            },
            icon: const Icon(Icons.all_out),
          ),
        ],
      ),
      body: const HomeView(),
    );
  }
}
