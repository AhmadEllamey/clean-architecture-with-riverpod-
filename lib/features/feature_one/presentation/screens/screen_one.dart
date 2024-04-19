import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenOne extends ConsumerStatefulWidget {
  const ScreenOne({super.key});

  @override
  ConsumerState<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends ConsumerState<ScreenOne> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.purple,
      ),
    );
  }
}
