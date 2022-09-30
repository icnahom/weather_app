import 'package:flutter/material.dart';

class MyCenteredPage extends StatelessWidget {
  const MyCenteredPage({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: child),
    );
  }
}
