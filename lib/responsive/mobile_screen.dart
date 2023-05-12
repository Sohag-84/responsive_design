import 'package:flutter/material.dart';
import 'package:responsive_design/components/appbar.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appBarWidget(),
        ],
      ),
    );
  }
}
