import 'package:flutter/material.dart';

class StateManager extends StatelessWidget {
  const StateManager({Key? key, required this.isLoading, required this.child})
      : super(key: key);
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return isLoading ? const CircularProgressIndicator() : child;
  }
}
