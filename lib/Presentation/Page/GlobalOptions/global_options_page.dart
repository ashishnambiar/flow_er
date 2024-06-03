import 'package:flow_er/Presentation/View/GlobalOptions/global_options_view.dart';
import 'package:flutter/material.dart';

class GlobalOptionsPage extends StatelessWidget {
  const GlobalOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Options Page'),
      ),
      body: GlobalOptionsView(),
    );
  }
}
